import os


def file_delete(input_dir: str, depth: int, delete_name: str):
    for file_name in os.listdir(input_dir):
        file_name_path = os.path.join(input_dir, file_name)
        if depth > 0:  # 指定した深さに到達していないときは再帰的に呼び出す
            file_delete(file_name_path, depth - 1, delete_name)
        else:
            if file_name == delete_name:
                print(f'remove {file_name_path=}')
                os.remove(file_name_path)


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='特定のファイルをすべて削除する')
    parser.add_argument('--input_dir', type=str, required=True, help='絶対パスで指定すること')
    parser.add_argument('--depth', default=2, type=int, help='辿るディレクトリの深さを指定')
    parser.add_argument('--delete_name', type=str, default='n_frames', help='削除したいファイル名を指定')
    args = parser.parse_args()

    file_delete(args.input_dir, args.depth, args.delete_name)
