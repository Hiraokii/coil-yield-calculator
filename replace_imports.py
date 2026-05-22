import os

def replace_in_file(filepath, old_str, new_str):
    with open(filepath, 'r') as f:
        content = f.read()
    
    if old_str in content:
        content = content.replace(old_str, new_str)
        with open(filepath, 'w') as f:
            f.write(content)
        print(f"Replaced in {filepath}")

def main():
    lib_dir = 'lib'
    for root, dirs, files in os.walk(lib_dir):
        for file in files:
            if file.endswith('.dart'):
                filepath = os.path.join(root, file)
                replace_in_file(filepath, 'package:coil_yield_calculator', 'package:coil_calc')

if __name__ == "__main__":
    main()
