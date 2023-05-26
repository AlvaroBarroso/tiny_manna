import os

def load_and_parse(arg):
    current_directory = os.getcwd()

    file_path = os.path.join(current_directory, arg)

    with open(file_path, 'r') as file:
        file_contents = file.read()

    return [
        [
            int(char)
            for char in line.split(',')
            if char != ''
        ]
        for line in file_contents.split('\n')[:-1]
    ]
