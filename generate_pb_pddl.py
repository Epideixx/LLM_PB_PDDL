from LLM_plus_P import llm_plus_p
from zero_shot import zero_shot_without_CoT, zero_shot_with_CoT
from utils import run_planner
from domains_problem import Problem, Domain, check_if_equivalent
from ours import main as ours_main
import os

def postprocess(pddl_str:str):
    start_index = pddl_str.find("(define")
    if start_index != -1:
        pddl_str = pddl_str[start_index:]
    return pddl_str

def generate_problem(domain, problem, domain_example, problem_example, method, run, alias, time_limit, model = "gpt-4o", **kwargs):

    print("Domain: ", domain)

    # Load the data, the problems, ...
    file_path_domain_pddl = os.path.join("domains", domain, "domain.pddl")
    file_path_domain_description = os.path.join("domains", domain, "domain.nl")
    file_path_problem_pddl = os.path.join("domains", domain, f"{problem}.pddl")
    file_path_problem_description = os.path.join("domains", domain, f"{problem}.nl")

    if domain_example:
        file_path_domain_pddl_example = os.path.join("domains", domain_example, "domain.pddl")
        file_path_domain_description_example = os.path.join("domains", domain_example, "domain.nl")
    if problem_example:
        file_path_problem_pddl_example = os.path.join("domains", domain_example, f"{problem_example}.pddl")
        file_path_problem_description_example = os.path.join("domains", domain_example, f"{problem_example}.nl")

    domain = Domain(pddl_string=None, domain_name=domain, from_file_path=file_path_domain_pddl, description_file_path=file_path_domain_description)
    problem = Problem(pddl_string=None, problem_name=problem, domain=domain, from_file_path=file_path_problem_pddl, description_file_path=file_path_problem_description)

    if domain_example:
        domain_example = Domain(pddl_string=None, domain_name=domain_example, from_file_path=file_path_domain_pddl_example, description_file_path=file_path_domain_description_example)
    if problem_example:
        problem_example = Problem(pddl_string=None, problem_name=problem_example, domain=domain_example, from_file_path=file_path_problem_pddl_example, description_file_path=file_path_problem_description_example)

    # Create the folders and paths for the results
    if method == "llm_plus_p" and domain == domain_example:
        method += "_ic"
    problem_folder = f"./experiments/run{run}/{method}/{domain.domain_name}/problems/"
    plan_folder    = f"./experiments/run{run}/{method}/{domain.domain_name}/plans/"

    if not os.path.exists(problem_folder):
        os.system(f"mkdir -p {problem_folder}")
    if not os.path.exists(plan_folder):
        os.system(f"mkdir -p {plan_folder}")

    # Use one of the methods to generate the problem PDDL
    match method:
        case "llm_plus_p":
            problem_pddl_generated = llm_plus_p(problem, problem_example, model=model)
        case "llm_plus_p_ic":
            problem_pddl_generated = llm_plus_p(problem, problem_example, model=model)
        case "zero-shot-without-CoT":
            problem_pddl_generated = zero_shot_without_CoT(problem, model=model)
        case "zero-shot-with-CoT":
            problem_pddl_generated = zero_shot_with_CoT(problem, model=model)
        case "ours":
            problem_pddl_generated = ours_main(problem, problem_example, nb_propositions=kwargs["nb_propositions"], model=model, save_folder=os.path.join(problem_folder, problem.problem_name))
        case _:
            ValueError(f"Method {method} not implemented")

    # Postprocess the PDDL
    problem_pddl_generated = postprocess(problem_pddl_generated)
    
    # Convert this to a Problem object and save the result
    path_to_save = os.path.join(problem_folder, problem.problem_name + ".pddl")
    problem_generated = Problem(pddl_string=problem_pddl_generated, problem_name=problem, domain=domain)
    problem_generated.save(path_to_save, type = "pddl")

    # Compare this problem PDDL to the ground truth problem
    try:
        is_equivalent = check_if_equivalent(problem, problem_generated)
        print("The problems are equivalent: ", is_equivalent)
    except Exception as e: # The problem, if not correctly formatted, can raise an exception while parsing
        print("Error while comparing the problems: ", e)
        is_equivalent = False

    # Run Planner on it
    plan_file_name = os.path.join(plan_folder, problem.problem_name + ".txt")
    sas_file_name  = os.path.join(plan_folder, problem.problem_name + ".sas")

    best_cost = run_planner(plan_file_name, sas_file_name, file_path_domain_pddl, path_to_save, alias = alias, time_limit = time_limit, show_process = False)

    return is_equivalent, best_cost

if __name__ == "__main__":

    DOMAIN = "blocksworld"
    PROBLEM = "p01"
    DOMAIN_EXAMPLE = "logistics"
    PROBLEM_EXAMPLE = "p_example"
    METHOD = "ours"
    RUN = 0
    ALIAS = "lama"
    TIME_LIMIT = 200

    generate_problem(DOMAIN, PROBLEM, DOMAIN_EXAMPLE, PROBLEM_EXAMPLE, METHOD, RUN, ALIAS, TIME_LIMIT, model = "gpt-4o-mini", nb_propositions=3)