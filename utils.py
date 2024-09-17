import os
import glob
import tempfile
import re

import errno
import signal
import functools

class TimeoutError(Exception):
    pass

def timeout(seconds=10, error_message=os.strerror(errno.ETIME)):
    def decorator(func):
        def _handle_timeout(signum, frame):
            raise TimeoutError(error_message)

        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            signal.signal(signal.SIGALRM, _handle_timeout)
            signal.alarm(seconds)
            try:
                result = func(*args, **kwargs)
            finally:
                signal.alarm(0)
            return result

        return wrapper

    return decorator


def run_planner(plan_file_name, sas_file_name, domain_pddl_file_name, task_pddl_file_name, alias = "lama", time_limit = 200, show_process = False):
    
    if not show_process:
        with tempfile.NamedTemporaryFile(mode='w', delete=False) as temp_file:
            temp_file_name = temp_file.name
            os.system(f"python3 ./downward/fast-downward.py --alias {alias} " + \
                f"--search-time-limit {time_limit} --plan-file {plan_file_name} " + \
                f"--sas-file {sas_file_name} " + \
                f"{domain_pddl_file_name} {task_pddl_file_name} > {temp_file_name}")
        
        with open(temp_file_name, 'r') as result_file:
            result = result_file.read()
        
        os.remove(temp_file_name)

    else: 
        os.system(f"python3 ./downward/fast-downward.py --alias {alias} " + \
            f"--search-time-limit {time_limit} --plan-file {plan_file_name} " + \
            f"--sas-file {sas_file_name} " + \
            f"{domain_pddl_file_name} {task_pddl_file_name}")
        
    best_cost, best_plan = collect_best_cost(plan_file_name)
    if best_plan:
        file_to_save_best_plan = re.sub(r".txt.*", "_best_plan.txt", plan_file_name)
        with open(file_to_save_best_plan, "w") as f:
            f.write(best_plan)

        print("Best cost :", best_cost)
        return best_cost
    else:
        print("No plan found")
        return None
                                    


def get_cost(plan:str):
    cost_pattern = r'; cost = (\d+) \(unit cost\)'
    match = re.search(cost_pattern, plan)
    if match:
        cost = int(match.group(1))
        return cost
    else:
        return None

def collect_best_cost(plan_file_name):
    best_cost = 1e10
    best_plan = None
    for fn in glob.glob(f"{plan_file_name}.*"):
        with open(fn, "r") as f:
            try:
                plans = f.read()
                cost = get_cost(plans)
                if cost < best_cost:
                    best_cost = cost
                    best_plan = plans
            except:
                continue

    return best_cost, best_plan