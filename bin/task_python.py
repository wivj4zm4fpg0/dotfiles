import json
import os
import re
import sys

json_dict = json.load(open(sys.argv[1], 'r'))
if len(sys.argv) == 3 and sys.argv[2] == 'no_exe':
    do_exe = False
else:
    do_exe = True

for command in json_dict.keys():
    args = ''
    command_ = json_dict[command]
    for arg in command_['args'].keys():
        args = '{} {} {}'.format(args, arg, re.sub(r'[[,\'\]]', '', str(command_['args'][arg])))
    print(f'python {command_["input"]} {args}')
    if do_exe:
        os.system(f'python {command_["input"]} {args}')
