import os


def file_delete(input_dir: str, depth: int, threshold: int):
    for file_name in os.listdir(input_dir):
        if n > 0:
            file_delete(os.path.join(input_dir, file_name), depth - 1, threshold)
        else:
            if len(os.listdir(input_dir)) <= threshold:
                continue
            os.remove(os.listdir(input_dir)[:threshold])


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='ファイルを規定数以下まで削除する')
    parser.add_argument('--input_dir', type=str, required=True, help='絶対パスで指定すること')
    parser.add_argument('--depth', default=2, type=int, help='辿るディレクトリの深さを指定')
    parser.add_argument('--delete_threshold', type=int, default=10, help='ファイルを何枚残すか指定')
    args = parser.parse_args()

    file_delete(args.input_dir, args.depth, args.delete_threshold)
