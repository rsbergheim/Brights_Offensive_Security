import re

log_file = "security.log"
pattern = r"Failed password for (invalid user|user) (\S+) from (\S+)"

with open(log_file, 'r') as file:
    for line in file:
        match = re.search(pattern, line)
        if match:
            print (f"Potential login attempt from {match.group(3)} for {match.group(5)}")