from generate_pb_pddl import generate_problem
import argparse
import os

import timeout

# Create an argument parser
parser = argparse.ArgumentParser()

# Add arguments
parser.add_argument("--domain", type=str, default="blocksworld", help="Domain name")
parser.add_argument("--problem", type=str, default=None, help="Problem name")
parser.add_argument("--domain_example", type=str, default="logistics", help="Domain example name")
parser.add_argument("--problem_example", type=str, default="p_example", help="Problem example name")
parser.add_argument("--method", type=str, default="llm_plus_p", help="Method name")
parser.add_argument("--run", type=int, default=0, help="Run id")
parser.add_argument("--alias", type=str, default="lama", help="Alias name for the planner")
parser.add_argument("--time_limit", type=int, default=200, help="Time limit for the planning process")
parser.add_argument("--output_file", type=str, default=None, help="Output file name")

# Parse the arguments
args = parser.parse_args()

# Run on one specified problem
if args.problem:
    print("Problem: %s" % args.problem)
    try:
        is_equivalent, best_cost = generate_problem(args.domain, args.problem, args.domain_example, args.problem_example, args.method, args.run, args.alias, args.time_limit)
    except timeout.TimeTimeoutError:
        is_equivalent = "unknown"
        best_cost = "unknown"
        print("Timeout")
    if args.output_file:
        method = args.method
        if args.method == "llm_plus_p" and args.domain_example == args.domain:
            method += "_ic"
        path_file = f"./experiments/{method}/{args.domain}/run{args.run}/{args.output_file}.txt"
        if not os.path.exists(path_file):
            with open(path_file, "w") as f:
                f.write("Problem: %s\n" % args.problem)
                f.write(("Is equivalent : " + str(is_equivalent) + "\n" if is_equivalent != "unknown" else "Checking equivalence took too much time, required to check by hand... \n"))
                f.write(("Best cost: " + str(best_cost) if best_cost != None else "Planner failed to find a plan.") + "\n\n")
        else:
            with open(path_file, "a") as f:
                f.write("Problem: %s\n" % args.problem)
                f.write(("Is equivalent : " + str(is_equivalent) + "\n" if is_equivalent != "unknown" else "Checking equivalence took too much time, required to check by hand...\n"))
                f.write(("Best cost: " + str(best_cost) if best_cost != None else "Planner failed to find a plan.") + "\n\n")
            
# Else run on all the problems in the domain
else:
    folder_path = f"domains/{args.domain}"
    file_list = os.listdir(folder_path)

    filtered_files = [file for file in file_list if file != "domain.pddl" and file != "p_example.pddl"]
    problems = [file.replace(".pddl", "") for file in filtered_files if file.endswith(".pddl")]
    for problem in problems:
        print("Problem: %s" % problem)
        try:
            is_equivalent, best_cost = generate_problem(args.domain, problem, args.domain_example, args.problem_example, args.method, args.run, args.alias, args.time_limit)
        except timeout.TimeoutError:
            is_equivalent = "unknown"
            best_cost = "unknown"
            print("Timeout")
        if args.output_file:
            method = args.method
            if args.method == "llm_plus_p" and args.domain_example == args.domain:
                method += "_ic"
            path_file = f"./experiments/{method}/{args.domain}/run{args.run}/{args.output_file}.txt"
            if not os.path.exists(path_file):
                with open(path_file, "w") as f:
                    f.write("Problem: %s\n" % problem)
                    f.write(("Is equivalent : " + str(is_equivalent) + "\n" if is_equivalent != "unknown" else "Checking equivalence took too much time, required to check by hand...\n"))
                    f.write(("Best cost: " + str(best_cost) if best_cost != None else "Planner failed to find a plan.") + "\n\n")
            else:
                with open(path_file, "a") as f:
                    f.write("Problem: %s\n" % problem)
                    f.write(("Is equivalent : " + str(is_equivalent) + "\n" if is_equivalent != "unknown" else "Checking equivalence took too much time, required to check by hand...\n"))
                    f.write(("Best cost: " + str(best_cost) if best_cost != None else "Planner failed to find a plan.") + "\n\n")