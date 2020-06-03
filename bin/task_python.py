import json
import os
import re
import sys

with open(sys.argv[1], 'r') as f:
    json_dict = json.load(f)

for command in json_dict.keys():
    args = ''
    command_ = json_dict[command]
    for arg in command_['args'].keys():
        args = '{} {} {}'.format(args, arg,
                                 re.sub(r'[[,\'\]]', '', str(command_['args'][arg])))
    print('python {} {}'.format(
        command_['input'],
        args
    ))
    os.system('python {} {}'.format(
        command_['input'],
        args
    ))
