import os


def file_delete(input_dir: str, depth: int, threshold: int):
    input_dir_list = os.listdir(input_dir)
    for file_name in input_dir_list:
        if depth > 0:  # 指定した深さに到達していないときは再帰的に呼び出す
            file_delete(os.path.join(input_dir, file_name), depth - 1, threshold)
        else:
            if len(input_dir_list) <= threshold:  # 指定した数よりファイル数が少ないなら何もしない
                continue
            # 上から数えていき指定数より下のファイルを抽出
            files = [os.path.join(input_dir, file_name) for file_name in input_dir_list[threshold:]]
            for file in files:
                if os.path.isfile(file):
                    os.remove(file)


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='ファイルを規定数以下まで削除する')
    parser.add_argument('--input_dir', type=str, required=True, help='絶対パスで指定すること')
    parser.add_argument('--depth', default=2, type=int, help='辿るディレクトリの深さを指定')
    parser.add_argument('--delete_threshold', type=int, default=10, help='ファイルを何枚残すか指定')
    args = parser.parse_args()

    file_delete(args.input_dir, args.depth, args.delete_threshold)
