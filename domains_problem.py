import pddl
import json
import itertools
from copy import deepcopy

import pddl.parser
import pddl.parser.domain
import pddl.parser.problem
from pddl.core import And
from pddl.logic.base import Not
from pddl.logic.predicates import Predicate
from utils import *


def pddl_problem_to_json(problem_pddl, problem_name):
    # Parse the PDDL string using the pddl module parser
    try: 
        problem = pddl.parser.problem.ProblemParser()(problem_pddl)
    except Exception as e:
        return e

    # Create a dictionary to store the JSON representation
    json_representation = {}

    # Extract the problem name
    json_representation['problem_name'] = str(problem_name)
    # Extract the domain name
    json_representation['domain_name'] = str(problem.domain_name)
    # Extract the objects
    json_representation['objects'] = dict()
    for obj in problem.objects:
        if len(obj.type_tags)>0 :
            if str(list(obj.type_tags)[0]) in json_representation['objects']:
                json_representation['objects'][str(list(obj.type_tags)[0])].append(str(obj.name))
            else:
                json_representation['objects'][str(list(obj.type_tags)[0])] = [str(obj.name)]
        else:
            if None in json_representation['objects']:
                json_representation['objects'][None].append(str(obj.name))
            else:
                json_representation['objects'][None] = [str(obj.name)]

    # Extract the initial state
    json_representation['init'] = []
    for init in problem.init:
        if isinstance(init, Not):
            raise ValueError("There is a negated predicate in the initial state, with a 'not', which is not allowed in PDDL. Reminder: by default, non-mentioned predicates are assume to be false, so no need to explictly say it.")
        else:
            json_representation['init'].append({str(init.name):{int(i): str(init_term) for i, init_term in enumerate(init.terms)}})
    # Extract the goal
    json_representation['goal'] = []
    if isinstance(problem.goal, Predicate):
        json_representation['goal'].append({str(problem.goal.name): {int(i): str(term) for i, term in enumerate(problem.goal.terms)}})
    elif isinstance(problem.goal, And):
        for goal in problem.goal.operands:
            if isinstance(goal, Not):
                json_representation['goal'].append({"not" : {str(goal.argument.name): {int(i): str(term) for i, term in enumerate(goal.argument.terms)}}})
            else:
                json_representation['goal'].append({str(goal.name): {int(i): str(term) for i, term in enumerate(goal.terms)}})

    # Convert the dictionary to JSON string
    json_string = json.dumps(json_representation, indent=4)
    json_representation = json.loads(json_string)

    # Return the JSON representation of the problem
    return json_representation

def pddl_domain_to_json(domain_pddl, domain_name):
    # Parse the PDDL string using the pddl module parser
    try:
        domain = pddl.parser.domain.DomainParser()(domain_pddl)
    except Exception as e:
        return e

    # Create a dictionary to store the JSON representation
    json_representation = {}

    # Extract the domain name
    json_representation['domain_name'] = str(domain_name)
    # Extract the requirements
    json_representation['requirements'] = [str(requirement) for requirement in list(domain.requirements)]
    # Extract the types
    json_representation['types'] = dict()
    for obj, obj_type in domain.types.items():
        if obj_type in json_representation['types']:
            json_representation['types'][obj_type].append(obj)
        else:
            json_representation['types'][obj_type] = [obj]
    
    # Extract the predicates
    json_representation['predicates'] = dict()
    for predicate in domain.predicates:
        json_representation['predicates'][str(predicate.name)] = {str(term.name): str(list(term.type_tags)[0]) if len(term.type_tags)>0 else None for term in predicate.terms} if len(predicate.terms) > 0 else None

    # Extract the actions
    json_representation['actions'] = []
    for action in domain.actions:
        action_dict = {}
        action_dict['name'] = str(action.name)
        action_dict['parameters'] = dict()
        for parameter in action.parameters:
            action_dict['parameters'][str(parameter.name)] = str(list(parameter.type_tags)[0]) if len(parameter.type_tags)>0 else None
        if isinstance(action.precondition, Predicate):
            action_dict['preconditions'] = [str(action.precondition)]
        elif isinstance(action.precondition, And):
            action_dict['preconditions']= [str(precondition) for precondition in list(action.precondition.operands)]
        action_dict['effects'] = []
        for effect in action.effect.operands:
            action_dict['effects'].append(str(effect))
        json_representation['actions'].append(action_dict)

    # Convert the dictionary to JSON string
    json_string = json.dumps(json_representation, indent=4)
    json_representation = json.loads(json_string)

    # Return the JSON representation of the problem
    return json_representation

def json_to_problem_pddl(json_problem):

    json_representation = json_problem
    # Extract the problem name
    problem_name = json_representation['problem_name']
    # Extract the domain name
    domain_name = json_representation['domain_name']
    # Extract the objects
    objects = json_representation['objects']
    # Extract the initial state
    init = json_representation['init']
    # Extract the goal
    goal = json_representation['goal']

    # Create a PDDL string
    pddl_string = "(define (problem " + problem_name + ")\n"
    pddl_string += "(:domain " + domain_name + ")\n"
    pddl_string += "(:objects\n"
    for obj_type, list_obj in objects.items():
        pddl_string += "    " + " ".join(list_obj) + (" - " + obj_type if obj_type != "null" else "") + "\n"
    pddl_string += ")\n"
    pddl_string += "(:init\n"
    for init_state in init:
        for predicate, terms in init_state.items():
            pddl_string += "    (" + predicate
            for _, term in terms.items():
                pddl_string += " " + term
            pddl_string += ")\n"
    pddl_string += ")\n"
    pddl_string += "(:goal\n"
    pddl_string += "    (and\n"
    for goal_state in goal:
        for predicate, terms in goal_state.items():
            if predicate != "not":
                pddl_string += "        (" + predicate
                for _, term in terms.items():
                    pddl_string += " " + term
                pddl_string += ")\n"
            else:
                for predicate, terms in terms.items():
                    pddl_string += "        (not(" + predicate
                    for _, term in terms.items():
                        pddl_string += " " + term
                    pddl_string += "))\n"
    pddl_string += "    )\n"
    pddl_string += "    )\n"
    pddl_string += ")\n"
    pddl_string += ")\n"

    # Return the PDDL string
    return pddl_string

def json_to_domain_pddl(json_domain):
    json_representation = json_domain

    # Extract the domain name
    domain_name = json_representation['domain_name']
    # Extract the requirements
    requirements = json_representation['requirements']
    is_typing = ":typing" in requirements
    # Extract the types
    types = json_representation['types']
    # Extract the predicates
    predicates = json_representation['predicates']
    # Extract the actions
    actions = json_representation['actions']

    # Create a PDDL string
    pddl_string = "(define (domain " + domain_name + ")\n"
    pddl_string += "(:requirements " + " ".join(requirements) + ")\n"
    if is_typing:
        pddl_string += "(:types\n"
        for parent_type, type_name_list in types.items():
            pddl_string += "    " + " ".join(type_name_list) + " - " + parent_type + "\n"
        pddl_string += ")\n"

    pddl_string += "(:predicates\n"
    for predicate_name, predicate_terms in predicates.items():

        pddl_string += "    (" + predicate_name + " "
        if predicate_terms is not None:
            for term_name, term_type in predicate_terms.items():
                pddl_string += "?" + term_name + (" - " + term_type if is_typing else "") + " "
        pddl_string += ")\n"
    pddl_string += ")\n"
    for action in actions:
        pddl_string += "(:action " + action['name'] + "\n"
        pddl_string += "    :parameters ("
        for parameter_name, parameter_type in action['parameters'].items():
            pddl_string += "?" + parameter_name + (" - " + parameter_type if is_typing else "")+ " "
        pddl_string += ")\n"
        pddl_string += "    :precondition" + ("(and\n" if len(action['preconditions']) > 1 else "")
        for precondition in action['preconditions']:
            pddl_string += ("        " if len(action['preconditions']) > 1 else " ") + precondition + "\n"
        pddl_string += ("    )" if len(action['preconditions']) > 1 else "") + "\n"
        pddl_string += "    :effect (and\n"
        for effect in action['effects']:
            pddl_string += "        " + effect + "\n"
        pddl_string += "    )\n"
        pddl_string += ")\n"

    # Return the PDDL string
    return pddl_string


class Domain:
    def __init__(self, pddl_string, domain_name, description_nl = None, from_file_path = None, description_file_path = None):
        if from_file_path:
            self.pddl_string = open(from_file_path).read()
        else:
            self.pddl_string = pddl_string
        self.domain_name = domain_name
        if description_file_path:
            self.description_nl = open(description_file_path).read()
        else:
            self.description_nl = description_nl

    def get_pddl_representation(self):
        return self.pddl_string
    
    def get_description_nl(self):
        return self.description_nl

    def get_json_representation(self):
        return pddl_domain_to_json(self.pddl_string, self.domain_name)

    def __eq__(self, other):
        if isinstance(other, self.__class__):
            return self.domain_name == other.domain_name and self.pddl_string == other.pddl_string
        return False  

    def save(self, filename, type = "pddl"):
        """
        type = "pddl" or "json"
        """
        if type == "pddl":
            with open(filename, 'w') as f:
                f.write(self.pddl_string)
        elif type == "json":
            with open(filename, 'w') as f:
                json.dump(self.get_json_representation(), f, indent=4)
        else:
            raise ValueError("Type should be either 'pddl' or 'json'") 
    
class Problem:
    def __init__(self, pddl_string, problem_name, domain:Domain = None, description_nl = None, from_file_path = None, description_file_path = None):
        if from_file_path:
            self.pddl_string = open(from_file_path).read()
        else: 
            self.pddl_string = pddl_string
        self.problem_name = problem_name
        self.domain = domain
        if description_file_path:
            self.description_nl = open(description_file_path).read()
        else:
            self.description_nl = description_nl

    def get_pddl_representation(self):
        return self.pddl_string

    def get_description_nl(self):
        return self.description_nl
    
    def get_domain(self):
        return self.domain

    def get_json_representation(self):        
        return pddl_problem_to_json(self.pddl_string, self.problem_name)
    
    def __eq__(self, other):
        if isinstance(other, self.__class__):
            return self.domain == other.domain and self.pddl_string.strip() == other.pddl_string.strip()
        return False
    
    def save(self, filename, type = "pddl"):
        """
        type = "pddl" or "json"
        """
        if type == "pddl":
            with open(filename, 'w') as f:
                f.write(self.pddl_string)
        elif type == "json":
            with open(filename, 'w') as f:
                json.dump(self.get_json_representation(), f, indent=4)
        else:
            raise ValueError("Type should be either 'pddl' or 'json'")

    def getPDDLTypes(self):
        """
        Get the PDDL object types from the problem
        """
        json_representation = self.get_json_representation()
        return list(json_representation["objects"].keys())
    
    def getPDDLObjects(self):
        """
        Get the PDDL objects from the problem
        """
        json_representation = self.get_json_representation()
        list_objects = (json_representation["objects"].values())
        list_objects = [item for sublist in list_objects for item in sublist]

        return list_objects
    
    def getInitStateAtoms(self):
        """
        Get the initial state atoms from the problem
        """
        json_representation = self.get_json_representation()
        return json_representation["init"]
    

    def getGoalStateAtoms(self):
        """
        Get the goal state atoms from the problem
        """
        json_representation = self.get_json_representation()
        return json_representation["goal"]


    def getObjectsOfType(self, type):
        """
        Get the objects of a certain type
        """
        json_representation = self.get_json_representation()
        return json_representation["objects"][type]
    

def permutations(list):
    """
    Generate all permutations of a list
    """
    if len(list) == 0:
        return [[]]
    return [[x] + p for i, x in enumerate(list) for p in permutations(list[:i] + list[i+1:])]

def cartesianProduct(perms_object):
    """
    Return the cartesian product of the permutations of objects
    perms_object: dict(obj_type:list(list(obj_names)))
        Dictionary of all the permutations of objects per type of objects
    """
    types = list(perms_object.keys())
    perms_object_list = list(perms_object.values())

    cartesian_product = itertools.product(*perms_object_list)

    return cartesian_product

def checkStateEquivalence(taskObjects, perm, taskStateAtoms, correctStateAtoms):

    task_state_mapping = dict()
    for idx, obj_type in enumerate(taskObjects.keys()):
        task_state_mapping[obj_type] = {taskObjects[obj_type][i]:perm[idx][i] for i in range(len(taskObjects[obj_type]))}
    task_state_mapping_concatenated = {}
    for obj_type, obj_mapping in task_state_mapping.items():
        task_state_mapping_concatenated.update(obj_mapping)
    task_state_mapping = task_state_mapping_concatenated

    mapping = lambda x: task_state_mapping[x]

    mapped_state_atoms = []
    for state_atom in taskStateAtoms:
        mapped_atom = {}
        for predicate, terms in state_atom.items():
            mapped_terms = {}
            for position, value in terms.items():
                mapped_value = mapping(value)
                mapped_terms[position] = mapped_value
            mapped_atom[predicate] = mapped_terms
        mapped_state_atoms.append(mapped_atom)

    is_same = True
    for predicate in mapped_state_atoms:
        if predicate not in correctStateAtoms:
            is_same = False
            break

    return is_same

@timeout(60, os.strerror(errno.ETIMEDOUT))
def check_if_equivalent(problem1, problem2):
    """
    Using the method from TIC, we want to check if two problems are equivalent.
    However, this is not perfect, and different from the method, more general, proposed by Planetarium
    """

    taskPDDLTypes = problem1.getPDDLTypes()
    correctPDDLTypes = problem2.getPDDLTypes()
    if set(taskPDDLTypes) != set(correctPDDLTypes):
        return False

    taskPDDLObjects = problem1.getPDDLObjects()
    correctPDDLObjects = problem2.getPDDLObjects()
    if len(taskPDDLObjects) != len(correctPDDLObjects):
        return False

    taskInitStateAtoms = problem1.getInitStateAtoms()
    correctInitStateAtoms = problem2.getInitStateAtoms()
    if len(taskInitStateAtoms) != len(correctInitStateAtoms):
        return False

    taskGoalStateAtoms = problem1.getGoalStateAtoms()
    correctGoalStateAtoms = problem2.getGoalStateAtoms()
    if len(taskGoalStateAtoms) != len(correctGoalStateAtoms):
        return False

    taskObjects = dict()
    correctObjects = dict()
    for t in sorted(taskPDDLTypes):
        correctObjectsOfType = problem2.getObjectsOfType(t)
        typePerm = permutations(correctObjectsOfType)
        correctObjects[t] = typePerm
        taskObjectsOfType = problem1.getObjectsOfType(t)
        taskObjects[t] = taskObjectsOfType

    perms = cartesianProduct(correctObjects)
    for perm in perms:
        if checkStateEquivalence(taskObjects, perm, taskInitStateAtoms, correctInitStateAtoms) and \
                checkStateEquivalence(taskObjects, perm, taskGoalStateAtoms, correctGoalStateAtoms):
            return True
    return False


if __name__ == "__main__":
    # Create a Domain object
    domain_pddl_string = open("domains/barman/domain.pddl").read()
    domain_name = "barman"
    domain = Domain(domain_pddl_string, domain_name)

    # Get the JSON representation of the domain
    json_representation = domain.get_json_representation()

    # Print the JSON representation
    print(json_representation)

    print(json_to_domain_pddl(json_representation))

    # Create a Problem object
    problem_pddl_string = open("domains/barman/p08.pddl").read()
    problem_name = "p08"
    problem = Problem(problem_pddl_string, problem_name)

    # Get the JSON representation of the problem
    json_representation = problem.get_json_representation()

    # Print the JSON representation
    print(json_representation)

    print(json_to_problem_pddl(json_representation))
    problem_bis = """
    (define (problem prob)
    (:domain barman)
    (:objects 
        shaker1 - shaker
        left right - hand
        shot2 shot1 shot3 shot4 shot5 - shot
        ingredient1 ingredient2 ingredient3 - ingredient
        cocktail1 cocktail2 cocktail3 cocktail4 - cocktail
        dispenser1 dispenser2 dispenser3 - dispenser
        l0 l1 l2 - level
    )
    (:init 
    (ontable shaker1)
    (ontable shot2)
    (ontable shot1)
    (ontable shot3)
    (ontable shot4)
    (ontable shot5)
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)
    (clean shaker1)
    (clean shot2)
    (clean shot1)
    (clean shot3)
    (clean shot4)
    (clean shot5)
    (empty shaker1)
    (empty shot2)
    (empty shot1)
    (empty shot3)
    (empty shot4)
    (empty shot5)
    (handempty left)
    (handempty right)
    (shaker-empty-level shaker1 l0)
    (shaker-level shaker1 l0)
    (next l0 l1)
    (next l1 l2)
    (cocktail-part1 cocktail1 ingredient2)
    (cocktail-part2 cocktail1 ingredient1)
    (cocktail-part1 cocktail2 ingredient3)
    (cocktail-part2 cocktail2 ingredient3)
    (cocktail-part1 cocktail3 ingredient3)
    (cocktail-part2 cocktail3 ingredient2)
    (cocktail-part1 cocktail4 ingredient2)
    (cocktail-part2 cocktail4 ingredient1)
    )
    (:goal
    (and
        (contains shot2 cocktail3)
        (contains shot1 cocktail2)
        (contains shot3 cocktail4)
        (contains shot4 cocktail1)
    )))
    """  
    problem_bis = Problem(problem_bis, "p08", domain="barman")

    print(check_if_equivalent(problem, problem_bis))