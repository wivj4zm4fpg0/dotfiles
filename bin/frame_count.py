import os


def file_count(input_dir, n):
    for file_name in os.listdir(input_dir):
        if n > 0:
            file_count(os.path.join(input_dir, file_name), n - 1)
        else:
            command = f'cd {input_dir} ; ls -U1 | wc -l'
            output = os.popen(command).read()[:-1]
            print(f'{input_dir} = {output}')
            if int(output) < 64:
                print('Warning!!')


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='ファイル数をカウントする')
    parser.add_argument('--input_dir', type=str, required=True, help='絶対パスで指定すること')
    parser.add_argument('--depth', default=2, type=int, help='辿るディレクトリの深さを指定')
    args = parser.parse_args()

    file_count(args.input_dir, args.depth)
