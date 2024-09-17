
import os
import time
import re

from domains_problem import Domain, Problem
from llm import LLM

FAST_DOWNWARD_ALIAS = "lama"

def create_prompt(domain_pddl:str, problem_nl:str, problem_pddl_example:str, problem_nl_example:str, domain_pddl_example:str=None):
    """
    If domain_pddl_example is None, it means the two problems come from the same domain.
    """

    if domain_pddl_example:
        prompt = f"I want you to translate problems formulated in natural language to Problem PDDL.\n" + \
                    f"Let's start with a example of what you have to do. " + \
                    f"Here is a domain PDDL for the example: \n {domain_pddl_example} \n" +\
                    f"An example planning problem formulated in natural language is: \n {problem_nl_example} \n" + \
                    f"The correct translation in problem PDDL for this problem is: \n {problem_pddl_example} \n" + \
                    f"Now, it is your turn to translate the next problem. " + \
                    f"Here is the domain PDDL (note that we work in a different domain from the example): \n {domain_pddl} \n" + \
                    f"And the description in natural language of the problem is: \n {problem_nl} \n" + \
                    f"Provide me with the problem PDDL that describes " + \
                    f"the new planning problem directly without further explanations. Only return the PDDL problem between 'PDDL Formulation' and 'End Formulation'. Do not return anything else."

    else:
        prompt = f"I want you to translate problems formulated in natural language to Problem PDDL.\n" + \
                    f"Here is the domain PDDL: \n {domain_pddl}" +\
                    f"Let's start with a example of what you have to do. " + \
                    f"An example planning problem formulated in natural language is: \n {problem_nl_example} \n" + \
                    f"The correct translation in problem PDDL for this problem is: \n {problem_pddl_example} \n" + \
                    f"Now, it is your turn to translate the next problem. " + \
                    f"Here is the description in natural language of the problem you have to translate: \n {problem_nl} \n" + \
                    f"Provide me with the problem PDDL that describes " + \
                    f"the new planning problem directly without further explanations. Only return the PDDL problem between 'PDDL Formulation' and 'End Formulation'. Do not return anything else."

    return prompt

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

def llm_plus_p(problem: Problem, problem_example: Problem, model = "gpt-4o"):
    """
    LLM + P:

    """

    domain = problem.get_domain()
    domain_example = problem_example.get_domain()
    same_domain = domain == domain_example

    domain_pddl = domain.get_pddl_representation()
    problem_pddl = problem.get_pddl_representation()
    problem_nl = problem.get_description_nl()

    domain_pddl_example = domain_example.get_pddl_representation()
    problem_pddl_example = problem_example.get_pddl_representation()
    problem_nl_example = problem_example.get_description_nl()

    llm = LLM(model = model)

    prompt = create_prompt(domain_pddl, problem_nl, problem_pddl_example, problem_nl_example, domain_pddl_example if not same_domain else None)
    raw_result = llm.query(prompt)
    problem_pddl_generated = postprocess(raw_result)

    return problem_pddl_generated