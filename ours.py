from domains_problem import Problem, Domain, check_if_equivalent
from llm import LLM
import json
import tiktoken
import re
import os

def postprocess(raw_answer):
    pattern = r"```(?:pddl|lisp|plaintext)\s*([\s\S]*?)```"
    match = re.search(pattern, raw_answer)

    pattern2 = r"```\s*([\s\S]*?)```"
    match2 = re.search(pattern2, raw_answer)

    if match:
        return match.group(1)
    elif match2:
        return match2.group(1)
    else:
        return raw_answer
    
def postprocess_translation(raw_answer):
    pattern = r"START TRANSLATION\s*([\s\S]*?)\s*END TRANSLATION"
    match = re.search(pattern, raw_answer)
    if match:
        return match.group(1)
    else:
        return raw_answer
    
def count_tokens(text, model = "gpt-4o"):
    encoding = tiktoken.encoding_for_model(model)
    num_tokens = len(encoding.encode(text))
    return num_tokens
    
    
def sc_cot(problem:Problem, problem_example:Problem, llm:LLM, nb_propositions:int = 3, save_folder=None, test = False, count_nb_tokens=False):
    """
    Self-consistency Chain-of-Thought
    Using Chain-of-Thought, using one example, it generates in a multi-step process, a final Problem PDDL
    Inputs:
        - problem: Problem
            Problem that we want to translate to PDDL. The ground-truth can be already in, and may be used for testing.
        - problem_example: Problem
            Problem used as an example during the CoT process.
        - nb_propositions: int, default = 3
            Number of different PDDL propositions generated by the LLM
        - save_folder: string, default = None
        - test: bool, default = False
            If True, the generated PDDL will be tested against the ground-truth PDDL
    Returns:
        - pbs_pddl_generated: list(Problem)
        - llms: list(LLM)
            List of LLMs used to generate the PDDL
    """
    
    # Create folder to save the results
    if save_folder:
        if not os.path.exists(save_folder):
            os.makedirs(save_folder)
        for i in range(nb_propositions):
            llm_folder = os.path.join(save_folder, f"llm_{i+1}", "sc_cot")
            if not os.path.exists(llm_folder):
                os.makedirs(llm_folder)

    answers = []
    domain = problem.domain
    domain_pddl = domain.get_pddl_representation()
    domain_description = domain.get_description_nl()
    problem_nl = problem.get_description_nl()
    problem_pddl_example = problem_example.get_pddl_representation()
    problem_nl_example = problem_example.get_description_nl()
    count_tokens_sc_soc = [0 for _ in range(nb_propositions)]
    
    # We load an example from another folder, that will be used in Step 2 and 3
    with open("data_for_TIC/fot_CoT.json", 'r') as f:
        text_example_other = json.load(f)["text"]

    # Load one different LLM for each proposition
    llms = [llm.deepcopy() for _ in range(nb_propositions)]

    # Step 1: Deccription and understanding of the domain PDDL
    with open("prompts_ours/prompt_1_step_1.txt", 'r') as f:
        prompt_1 = f.read()
    prompt_1 = prompt_1.replace("[DOMAIN PDDL]", domain_pddl)
    prompt_1 = prompt_1.replace("[DOMAIN DESCRIPTION]", domain_description)
    for i, llm in enumerate(llms):
        answer = llm.query(prompt_1)
        if save_folder:
                with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", f"prompt_1.md"), 'w') as f:
                    f.write(answer)
        if count_nb_tokens:
            count_tokens_sc_soc[i] += int(count_tokens(" ".join([message["content"] for message in llm.messages])))

    # Step 2: Find cardinality of each object
    with open("prompts_ours/prompt_1_step_2.txt", 'r') as f:
        prompt_2 = f.read()
    prompt_2 = prompt_2.replace("[EXAMPLE PROBLEM NL]", text_example_other)
    prompt_2 = prompt_2.replace("[EXAMPLE NB OBJECTS]", "{’table’: 2, ’apple’: 4, ’orange’: 3, ’plate’: 5, ’ball’: 3, ’kid’: 3, ’cell’: 8}")
    prompt_2 = prompt_2.replace("[PROBLEM NL]", problem_nl)
    for i, llm in enumerate(llms):
        answer = llm.query(prompt_2)
        if save_folder:
                with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", f"prompt_2.md"), 'w') as f:
                    f.write(answer)
        if count_nb_tokens:
            count_tokens_sc_soc[i] += int(count_tokens(" ".join([message["content"] for message in llm.messages])))

    # Step 3: Extract the names of the different objects
    with open("prompts_ours/prompt_1_step_3.txt", 'r') as f:
        prompt_3 = f.read()
    prompt_3 = prompt_3.replace("[EXAMPLE PROBLEM NL]", text_example_other)
    prompt_3 = prompt_3.replace("[EXAMPLE NAME OBJECTS]", "{’apple’: [’apple1’, ’apple2’], ’orange’: [], ’plate’: [’plate_1’, ’plate_2’, ’plate_3’, ’plate_4’, ’plate_5’], ’table’: [’table1’, ’table2’], ’ball’: [’ball1’, ’ball3’], ’room’: [’hall’], ’kid’: [], ’robot’: [], ’cell’: [’cell_0_1’, ’cell_0_2’, ’cell_1_1’, ’cell_1_2’, ’cell_2_1’, ’cell_2_2’, ’cell_3_1’, ’cell_3_2’]}")
    prompt_3 = prompt_3.replace("[PROBLEM NL]", problem_nl)
    for i, llm in enumerate(llms):
        answer = llm.query(prompt_3)
        if save_folder:
                with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", f"prompt_3.md"), 'w') as f:
                    f.write(answer)
        if count_nb_tokens:
            count_tokens_sc_soc[i] += int(count_tokens(" ".join([message["content"] for message in llm.messages])))

    # Step 4 : Create and find rules about the domain and the problem
    ### Note: Maybe not super useful ...
    with open("prompts_ours/prompt_1_step_4.txt", 'r') as f:
        prompt_4 = f.read()
    for i, llm in enumerate(llms):
        answer = llm.query(prompt_4)
        if save_folder:
                with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", f"prompt_4.md"), 'w') as f:
                    f.write(answer)
        if count_nb_tokens:
            count_tokens_sc_soc[i] += int(count_tokens(" ".join([message["content"] for message in llm.messages])))

    # Step 5: Focus and clearly describe separately the initial state and the goal state
    with open("prompts_ours/prompt_1_step_5.txt", 'r') as f:
        prompt_5 = f.read()
    for i, llm in enumerate(llms):
        answer = llm.query(prompt_5)
        if save_folder:
                with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", f"prompt_5.md"), 'w') as f:
                    f.write(answer)
        if count_nb_tokens:
            count_tokens_sc_soc[i] += int(count_tokens(" ".join([message["content"] for message in llm.messages])))

    # Step 6: Generate the final PDDL proposition
    with open("prompts_ours/prompt_1_step_6.txt", 'r') as f:
        prompt_6 = f.read()
    prompt_6 = prompt_6.replace("[EXAMPLE TEXT PDDL]", problem_nl_example)
    prompt_6 = prompt_6.replace("[EXAMPLE PB PDDL]", problem_pddl_example)
    prompt_6 = prompt_6.replace("[PROBLEM NL]", problem_nl)
    for i, llm in enumerate(llms):
        answer = llm.query(prompt_6)
        if save_folder:
                with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", f"prompt_6.md"), 'w') as f:
                    f.write(answer)
        answers.append(answer)
        if count_nb_tokens:
            count_tokens_sc_soc[i] += int(count_tokens(" ".join([message["content"] for message in llm.messages])))

    # Convert the final answers to PDDL Problem
    pbs_pddl_generated = []
    for i, llm in enumerate(llms):
        print(answers[i])
        pddl = postprocess(answers[i])
        if pddl == None: 
            pddl = answers[i][-1]
        pddl = Problem(pddl_string=pddl, problem_name=problem.problem_name, domain=domain, description_nl=problem_nl)
        pbs_pddl_generated.append(pddl)
        if save_folder:
            with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", "generated_pddl_sc_cot.pddl"), 'w') as f:
                f.write(pddl.get_pddl_representation())

    # Count the number of tokens
    if count_nb_tokens:
        for i, llm in enumerate(llms):
            with open(os.path.join(save_folder, f"llm_{i+1}", "sc_cot", "tokens_count.txt"), 'w') as f:
                f.write("Number tokens used : "+ str(count_tokens_sc_soc[i]))

    return pbs_pddl_generated, llms


    
def validator_pddl(problem_pddl:Problem):

    """
    Validates the Problem PDDL generated by the LLM
    Input:
        - problem_pddl: Problem
            Problem to validate
    Returns:
        - feedback: str
            Feedback messages. If None, means there is no feedback.
    """

    try:
        pb_json = problem_pddl.get_json_representation()
    except ValueError as e: # If there is a "not" in the initial state.
        return e
    domain = problem_pddl.get_domain()
    domain_json = domain.get_json_representation()
    is_typing = ":typing" in domain_json["requirements"]
    feedback = []
    check_is_typing = True

    ### OBJECTS
    objects_in_pb = pb_json['objects']
    list_types = []
    for k, v in domain_json["types"].items():
        list_types.append(k)
        list_types.extend(v)
    
    for obj_type, object_list in objects_in_pb.items():
        # Check that if "typing", the objects all have a type
        if is_typing and 'null' in objects_in_pb:
            feedback.append(f"The domain has the requirement 'typing' which means all the defined objects must be associated to a type, as mentioned in the domain PDDL.")
            check_is_typing = False
            break
        if is_typing and check_is_typing:
            # Checks if any objects use undefined types.
            if obj_type not in list_types:
                feedback.append(f"The object type {obj_type} is not defined in the types.")
                break
        for obj in object_list:
            if is_typing and check_is_typing:
                # Checks if any object name is a type.
                if obj in list_types:
                    feedback.append(f"The object {obj} has a name of a type, which is not allowed.")
                    break
            # Checks if any object name is a predicate.
            if obj in domain_json['predicates']:
                feedback.append(f"The object {obj} has a name of a predicate, which is not allowed.")
                break

    ### PREDICATES
    dict_defined_predicates = domain_json["predicates"]
    reversed_dict_objects_pb = dict()
    for obj_type, object_list in objects_in_pb.items():
        for obj in object_list:
            reversed_dict_objects_pb[obj] = obj_type
    objects_predecessors = dict() # Include the larger types
    for obj_type, object_types in domain_json["types"].items():
        if obj_type not in objects_predecessors:
            objects_predecessors[obj_type] = [obj_type]
        for object_type in object_types:
            if object_type not in objects_predecessors:
                objects_predecessors[object_type] = [object_type]
            objects_predecessors[object_type].extend(objects_predecessors[obj_type])

    # For init
    predicates_init = pb_json['init']
    for predicate in predicates_init:
        for predicate_name, argument_dict in predicate.items():
            # Check if predicate exists
            if predicate_name not in dict_defined_predicates.keys():
                feedback.append(f"The predicate {predicate_name} used in the init block is not defined.")
                break
            # Check if the number of arguments is correct
            dict_predicate_arg = dict_defined_predicates[predicate_name]
            if dict_predicate_arg == None:
                dict_predicate_arg = dict()
            if len(argument_dict) != len(dict_predicate_arg):
                feedback.append(f"The predicate {predicate_name} in the init block has the wrong number of arguments ({len(argument_dict)} instead of {len(dict_predicate_arg)}).")
                break
            for pos, object_name in argument_dict.items():
                # Checks that all predicate argument objects exist.
                if object_name not in reversed_dict_objects_pb:
                    feedback.append(f"In predicate {predicate_name} in the init block, the object {object_name} in argument has not been defined.")
                    break
                # Check that all predicate argument types are valid.
                if is_typing and check_is_typing:
                    if list(dict_defined_predicates[predicate_name].values())[int(pos)] not in objects_predecessors[reversed_dict_objects_pb[object_name]]:
                        feedback.append(f"In predicate {predicate_name} in the init block, the object {object_name} does not have the correct type.")
                        break

    # For goal
    predicates_goal = pb_json['goal']
    for predicate in predicates_goal:
        for predicate_name, argument_dict in predicate.items():
            if predicate_name == "not":
                predicate_name, argument_dict = list(argument_dict.items())[0]
            # Check if predicate exists
            if predicate_name not in dict_defined_predicates.keys():
                feedback.append(f"The predicate {predicate_name} used in the goal block is not defined.")
                break
            # Check if the number of arguments is correct
            arguments_predicate = dict_defined_predicates[predicate_name]
            if arguments_predicate is None:
                arguments_predicate = dict()
            if len(argument_dict) != len(arguments_predicate):
                feedback.append(f"The predicate {predicate_name} in the goal block has the wrong number of arguments ({len(argument_dict)} instead of {len(dict_predicate_arg)}).")
                break
            for pos, object_name in argument_dict.items():
                # Checks that all predicate argument objects exist.
                if object_name not in reversed_dict_objects_pb:
                    feedback.append(f"In predicate {predicate_name} in the goal block, the object {object_name} in argument has not been defined.")
                    break
                # Check that all predicate argument types are valid.
                if is_typing and check_is_typing:
                    if list(dict_defined_predicates[predicate_name].values())[int(pos)] not in objects_predecessors[reversed_dict_objects_pb[object_name]]:
                        feedback.append(f"In predicate {predicate_name} in the goal block, the object {object_name} in argument has not been defined.")
                        break

    if len(feedback) > 0:
        feedback = "\n".join(feedback)
    else:
        feedback = None

    return feedback



def feedback_questions(problem:Problem, problem_example:Problem, llm_for_feedback:LLM):
    """
    Using a list of pre-set questions to guide an LLM, the later gives a feedback
    Inputs:
        problem: Problem
            Problem which correctness must be checked
        llm_for_feedback: LLM
            LLM used to create the feedback, based on the questions

    Returns:
        - feedback
    """

    llm_for_feedback.reset()

    # Collect the feedback prompt and fill it in with examples for CoT
    with open("prompts_ours/prompt_fb_questions.txt", "r") as f:
        prompt_fb = f.read()
    prompt_fb = prompt_fb.replace("[DOMAIN LOGISTICS]", problem_example.domain.get_pddl_representation())
    prompt_fb = prompt_fb.replace("[PB LOGISTICS NL]", problem_example.get_description_nl())
    with open("domains/logistics/p_example_wrong_1.pddl", "r") as f:
        prompt_fb = prompt_fb.replace("[PB 1]", f.read())
    with open("domains/logistics/p_example_wrong_1.txt", "r") as f:
        prompt_fb = prompt_fb.replace("[PB 1 FB]", f.read())
    with open("domains/logistics/p_example_wrong_2.pddl", "r") as f:
        prompt_fb = prompt_fb.replace("[PB 2]", f.read())
    with open("domains/logistics/p_example_wrong_2.txt", "r") as f:
        prompt_fb = prompt_fb.replace("[PB 2 FB]", f.read())
    prompt_fb = prompt_fb.replace("[PB CORRECT]", problem_example.get_pddl_representation())
    prompt_fb = prompt_fb.replace("[DOMAIN PDDL]", problem.domain.get_pddl_representation())
    prompt_fb = prompt_fb.replace("[PB NL]", problem.get_description_nl())

 
    prompt_fb_final = prompt_fb.replace("[PB PDDL GENERATED]", problem.get_pddl_representation())
    
    raw_answer = llm_for_feedback.query(prompt_fb_final)
    feedback = raw_answer

    print("FEEDBACK ORIGINAL QUESTIONS", feedback)
    
    if "no feedback required" in feedback.lower():
        feedback = None

    return feedback

       
def translate_pddl_to_nl(problem:Problem, problem_example:Problem, llm_translator:LLM):
    """
    Translate PDDL (usually the generated one) back to natural language
    This new description is inserted as the description on the problem, which is returned
    """
    with open("prompts_ours/prompt_for_translation.txt", "r") as f:
        prompt = f.read()
    prompt = prompt.replace("[PB PDDL EXAMPLE]", problem_example.get_pddl_representation())
    prompt = prompt.replace("[PB NL EXAMPLE]", problem_example.get_description_nl())
    prompt = prompt.replace("[PB PDDL]", problem.get_pddl_representation())
    raw_answer = llm_translator.query(prompt)
    print(raw_answer)
    problem.description_nl = postprocess_translation(raw_answer)

    return problem


def llm_as_judge(problem:Problem, problem_example:Problem, gt_description:str, llm_judge:LLM):
    """
    Using the generated problem, we generate its corresponding description before comparing it to the ground truth description and return feedback based on that
    Inputs:
        - 

    Returns:
        - feedback: str or None
            If None, no feedback is required
    """

    # Translate the problem to a natural language representation
    problem = translate_pddl_to_nl(problem, problem_example, llm_judge)
    problem_description_generated = problem.get_description_nl()
    problem_description_gt = gt_description

    # Reset LLM so it doesn't know about the original PDDL
    llm_judge.reset()

    # Get the prompt and fill it in with examples for CoT
    with open("prompts_ours/prompt_llm_as_a_judge.txt", "r") as f:
        prompt = f.read()
    prompt = prompt.replace("[PB NL EXAMPLE]", problem_example.get_description_nl())
    with open("domains/logistics/p_example_description_incorrect_1.txt", "r") as f:
        prompt = prompt.replace("[PB INCORRECT 1]", f.read())
    with open("domains/logistics/p_example_description_incorrect_1_explanation.txt", "r") as f:
        prompt = prompt.replace("[PB INCORRECT 1 EXPLANATION]", f.read())
    with open("domains/logistics/p_example_description_incorrect_2.txt", "r") as f:
        prompt = prompt.replace("[PB INCORRECT 2]", f.read())
    with open("domains/logistics/p_example_description_incorrect_2_explanation.txt", "r") as f:
        prompt = prompt.replace("[PB INCORRECT 2 EXPLANATION]", f.read())
    with open("domains/logistics/p_example_description_correct.txt", "r") as f:
        prompt = prompt.replace("[PB CORRECT]", f.read())
    
    prompt = prompt.replace("[PB NL]", problem_description_gt)
    prompt = prompt.replace("[PB NL GENERATED]", problem_description_generated)

    # Generate feedback
    raw_answer = llm_judge.query(prompt)
    print("LLM JUDGE: ", raw_answer)
    feedback = raw_answer

    if "the descriptions are similar" in feedback.lower():
        feedback = None

    return feedback


def generate_pddl_from_feedback(problem:Problem, feedback_prompt:str, llm:LLM):

    raw_answer = llm.query(feedback_prompt)
    new_pddl_text = postprocess(raw_answer)
    pddl = Problem(pddl_string=new_pddl_text, problem_name=problem.problem_name, domain=problem.get_domain(), description_nl=problem.get_description_nl())
    return pddl


def merge_pddls(problem, generated_problems, llm):
 
    # Create the prompt for the final ensemble method
    prompt = "As expert in PDDL, your mission is to return the final translation from a problem formulated in natural language to a Problem PDDL. To do so, you will be given the domain PDDL, the original description of the task that you have to translate, as well as multiple potential versions of this translation. Your goal is then to combine them in a smart way. Before outputting the final PDDL translation, you will think and explain your reasoning.\n The final translation will be between 'START TRANSLATION' and 'END TRANSLATION'."
    prompt += " Here is the domain PDDL:\n" 
    prompt += problem.domain.get_pddl_representation() + "\n\n"
    prompt += "And this is the description of the task we aim to translate:\n"
    prompt += problem.get_description_nl() + "\n\n"
    prompt += "Finally, to help you, we generated potential translations of this task:\n"
    for i, pb in enumerate(generated_problems):
        prompt += f"Potential translation {i+1}:\n"
        prompt += pb.get_pddl_representation()
        prompt += "\n\n"
    prompt += "Please make the best out of these translations to generate the final PDDL translation. Also, remember that the more information there is does not mean the better, it varies from case to case."

    # Prompt the LLM
    raw_answer = llm.query(prompt)
    print("LLM MERGE RAW ANSWER: " + raw_answer)
    final_pddl_str = postprocess_translation(raw_answer)
    final_pddl_str = postprocess(final_pddl_str)
    final_pddl = Problem(pddl_string=final_pddl_str, problem_name=problem.problem_name, domain = problem.get_domain(), description_nl=problem.get_description_nl())

    return final_pddl
    
def main(problem, problem_example, nb_propositions = 2, model = "gpt-4o", temperature = 0.7, save_folder=None, max_iter_fb_val = 3, max_iter_fb_questions = 1, max_iter_llm_judge = 1, seed = 42, temperature_merge = 0.1, count_nb_tokens = True):
    """
    Inputs:
        - problem: Problem
        - problem_example: Problem

    Returns:
        - final_pddl: Problem
    """

    # Step 1 - Generate multiple PDDL using Self-consistency Chain-of-Thought
    llm = LLM(model = model, temperature= temperature, seed=seed)
    pbs_pddl_generated, llms = sc_cot(problem, problem_example, llm=llm, nb_propositions=nb_propositions, save_folder=save_folder, count_nb_tokens=count_nb_tokens)

    for i, pb in enumerate(pbs_pddl_generated):

        # Step 2 - Validate the syntax of the PDDL using the Validator
        ok = False
        nb_fb = 0
        feedbacks_val = []
        new_pddl_version = pb
        count_nb_tokens_val = 0

        if save_folder:
            save_folder_val = os.path.join(save_folder, f"llm_{i+1}", "val")
            if not(os.path.exists(save_folder_val)):
                os.makedirs(save_folder_val)

        while not ok and nb_fb < max_iter_fb_val:
            if isinstance(pb, Exception):
                feedback = "The following exception occurred: " + str(pb)
            else:
                try:
                    feedback = validator_pddl(new_pddl_version)
                    feedbacks_val.append(feedback)
                except Exception as e:
                    feedback = str(e)

            print("FEEDBACK VAL", feedback)

            if feedback:
                feedback = str(feedback)
                with open("prompts_ours/prompt_fb_val.txt", "r") as f:
                    prompt_fb = f.read()
                prompt_fb = prompt_fb.replace("[FEEDBACK]", feedback)
                new_pddl_version = generate_pddl_from_feedback(problem, prompt_fb, llms[i])
                nb_fb += 1

                if save_folder:
                    with open(os.path.join(save_folder_val, f"feedback_{nb_fb}.md"), "w") as f:
                        f.write(feedback)
                    with open(os.path.join(save_folder_val, f"feedback_{nb_fb}_pddl_generated.pddl"), "w") as f:
                        f.write(new_pddl_version.get_pddl_representation())
                
                if count_nb_tokens:
                    count_nb_tokens_val += int(count_tokens(" ".join([message["content"] for message in llms[i].messages])))
            else:
                ok = True

        if count_nb_tokens:
            with open(os.path.join(save_folder_val, f"tokens_count.txt"), 'w') as f:
                f.write("Number tokens : "+ str(count_nb_tokens_val))

        pbs_pddl_generated[i] = new_pddl_version
        
        # Step 3 - Validate the correctness of the PDDL using questions
        ok = False
        nb_fb = 0
        feedbacks_questions = []
        new_pddl_version = pbs_pddl_generated[i]
        count_nb_tokens_questions = 0

        if save_folder:
            save_folder_questions = os.path.join(save_folder, f"llm_{i+1}", "questions")
            if not(os.path.exists(save_folder_questions)):
                os.makedirs(save_folder_questions)
        
        llm_for_feedback_questions = LLM(model=model, temperature=temperature, seed=seed)
        while not ok and nb_fb < max_iter_fb_questions:
            feedback = feedback_questions(new_pddl_version, problem_example, llm_for_feedback_questions)
            feedbacks_questions.append(feedback)

            if count_nb_tokens:
                count_nb_tokens_questions += int(count_tokens(" ".join([message["content"] for message in llm_for_feedback_questions.messages])))

            if feedback:
                prompt_for_fb = "The problem PDDL needs to be improved. To do so, please use the following feedback to correct the current version of the PDDL.\n"
                prompt_for_fb += feedback
                new_pddl_version = generate_pddl_from_feedback(problem, prompt_for_fb, llms[i])
                nb_fb += 1

                if save_folder:
                    with open(os.path.join(save_folder_questions, f"feedback_{nb_fb}.md"), "w") as f:
                        f.write(feedback)
                    with open(os.path.join(save_folder_questions, f"feedback_{nb_fb}_pddl_generated.pddl"), "w") as f:
                        f.write(new_pddl_version.get_pddl_representation())

                if count_nb_tokens:
                    count_nb_tokens_questions += int(count_tokens(" ".join([message["content"] for message in llms[i].messages])))

            else:
                ok = True

        if count_nb_tokens:
            with open(os.path.join(save_folder_questions, f"tokens_count.txt"), 'w') as f:
                f.write("Number tokens : "+ str(count_nb_tokens_questions))   

        pbs_pddl_generated[i] = new_pddl_version

        # Step 4 - Validate the correctness using LLM-as-a-Judge
        ok = False
        nb_fb = 0
        feedbacks_questions = []
        new_pddl_version = pbs_pddl_generated[i]
        count_nb_tokens_judge = 0

        if save_folder:
            save_folder_judge = os.path.join(save_folder, f"llm_{i+1}", "judge")
            if not(os.path.exists(save_folder_judge)):
                os.makedirs(save_folder_judge)

        llm_judge = LLM(model = model, temperature= temperature, seed=seed)
        while not ok and nb_fb < max_iter_llm_judge:
            feedback = llm_as_judge(new_pddl_version, problem_example, gt_description=problem.get_description_nl(), llm_judge=llm_judge)
            feedbacks_questions.append(feedback)

            if count_nb_tokens:
                count_nb_tokens_judge += int(count_tokens(" ".join([message["content"] for message in llm_judge.messages])))

            if feedback:
                prompt_for_fb = "The problem PDDL needs to be improved. To do so, please use the following feedback to correct the current version of the PDDL.\n"
                prompt_for_fb += feedback
                new_pddl_version = generate_pddl_from_feedback(problem, prompt_for_fb, llms[i])
                nb_fb += 1

                if save_folder:
                    with open(os.path.join(save_folder_judge, f"feedback_{nb_fb}.md"), "w") as f:
                        f.write(feedback)
                    with open(os.path.join(save_folder_judge, f"feedback_{nb_fb}_pddl_generated.pddl"), "w") as f:
                        f.write(new_pddl_version.get_pddl_representation())
                    path_discussion = os.path.join(save_folder_judge, f"feedback_{nb_fb}_whole_discussion.txt")
                    llm_judge.save_discussion(path_discussion)
                if count_nb_tokens:
                    count_nb_tokens_judge += int(count_tokens(" ".join([message["content"] for message in llms[i].messages])))
                    
            else:
                ok = True
        

        with open(os.path.join(save_folder_judge, f"tokens_count.txt"), 'w') as f:
            f.write("Number tokens : "+ str(count_nb_tokens_judge))

        pbs_pddl_generated[i] = new_pddl_version

        if save_folder:
            file_path = os.path.join(save_folder, f"llm_{i+1}", "conversation_llm.md")
            llms[i].save_discussion(file_path)
               

    # Step 5 - Merge the answers
    llm_merge = LLM(model = model, temperature=temperature_merge, seed=seed)
    final_pddl = merge_pddls(problem=problem, generated_problems=pbs_pddl_generated, llm = llm_merge)
    print(final_pddl.get_pddl_representation())

    if save_folder:
        with open(os.path.join(save_folder, "final_pddl.pddl"), 'w') as f:
            f.write(final_pddl.get_pddl_representation())
        path_merge_conv = os.path.join(save_folder, "merge_llm_conversation.md")
        llm_merge.save_discussion(path_merge_conv)
    
    if count_nb_tokens:
        with open(os.path.join(save_folder, "tokens_count.txt"), 'w') as f:
            f.write("Number tokens : "+ str(count_tokens(" ".join([message["content"] for message in llm_merge.messages]))))

    return final_pddl
    

if __name__ == "__main__":

    domain = Domain(pddl_string=None, domain_name="termes", from_file_path="domains/termes/domain.pddl")
    problem = Problem(pddl_string=None, domain=domain, problem_name="p04",from_file_path="domains/termes/p04.pddl",  description_file_path="domains/termes/p04.nl")

    domain_example = Domain(pddl_string=None, domain_name="logistics", from_file_path="domains/logistics/domain.pddl")
    problem_example = Problem(pddl_string=None, domain=domain, problem_name="p_example",from_file_path="domains/logistics/p_example.pddl",  description_file_path="domains/logistics/p_example.nl")
    nb_propositions = 2
    
    # answers, pbs_pddl_generated = sc_cot(problem, domain, nb_propositions=nb_propositions, temperature=0.7, model="gpt-4o", save_folder="test_sc_cot")
    final_pddl = main(problem, problem_example, nb_propositions=nb_propositions, temperature=0.7, model="gpt-4o", save_folder="experiments/run670/termes/p04", max_iter_fb_val=1, max_iter_fb_questions=1, max_iter_llm_judge=1, temperature_merge=0.1)
    try:
        print(check_if_equivalent(final_pddl, problem))
    except:
        print("Timeout, the process took too long. Please verify by hand the two problems.")