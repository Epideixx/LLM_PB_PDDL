import os
import time
import re

from domains_problem import Domain, Problem
from llm import LLM

FAST_DOWNWARD_ALIAS = "lama"

def postprocess(raw_answer):
    """
    Postprocess the raw answer from the LLM
    """
    start_marker = "PDDL Formulation"
    end_marker = "End Formulation"
    pattern = f"{start_marker}(.*?){end_marker}"
    match = re.search(pattern, raw_answer, re.DOTALL)
    if match:
        extracted_text = match.group(1).strip()
        extracted_text = extracted_text.replace("```", "")
        extracted_text = extracted_text.replace("lisp", "")
        extracted_text = extracted_text.replace("pddl", "")
        return extracted_text
    else:
        return None
    

def zero_shot_without_CoT(problem: Problem, model = "gpt-4o"):
    """
    Zero-shot without CoT:

    """
    domain = problem.get_domain()
    domain_pddl = domain.get_pddl_representation()
    problem_nl = problem.get_description_nl()

    # Generate Problem PDDL
    llm = LLM(model = model)
    prompt = f"I want you to solve planning problems. " + \
                    f"Here is the domain PDDL: \n {domain_pddl} \n" + \
                    f"And here is the description of the problem in natural language: \n {problem_nl} \n" + \
                    f"Provide me with the problem PDDL that describes " + \
                    f"the new planning problem directly without further explanations. Only return the PDDL problem between 'PDDL Formulation' and 'End Formulation'. Do not return anything else."


    raw_result = llm.query(prompt)
    problem_pddl_generated = postprocess(raw_result)

    return problem_pddl_generated


def zero_shot_with_CoT(problem: Problem, model = "gpt-4o"):
    """
    Zero-shot without CoT:

    """
    domain = problem.get_domain()
    domain_pddl = domain.get_pddl_representation()
    problem_nl = problem.get_description_nl()

    # Generate Problem PDDL
    llm = LLM(model = model)
    prompt = f"I want you to solve planning problems. " + \
                    f"Here is the domain PDDL: \n {domain_pddl} \n" + \
                    f"And here is the description of the problem in natural language: \n {problem_nl} \n" + \
                    f"Provide me with the problem PDDL that describes " + \
                    f"the new planning problem directly without further explanations. To accomplish your task, you will follow different steps:\n" +\
                    f"Step 1: You will summarize the formulation of the problem in your own terms.\n" +\
                    f"Step 2: You will indicate the number of objects, before writing down all the necessary names. If there are missing objects, feel free to create new ones. Be careful, some objects may not be explicitly mentioned, and you will need to enumerate them.\n" +\
                    f"Step 3: You will formulate everything which should appear in the initialisation. Try to think about possible implicit information.\n" +\
                    f"Step 4: You will formulate everything which should appear in the goals. Try to think about possible implicit information.\n" +\
                    f"Final step: You will provide the fina Problem PDDL written between 'PDDL Formulation' and 'End Formulation'."


    raw_result = llm.query(prompt)
    problem_pddl_generated = postprocess(raw_result)

    return problem_pddl_generated