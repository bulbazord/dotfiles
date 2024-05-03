import os
import sys
import typing

from dataclasses import dataclass


@dataclass
class FileConfig:
    relative_path: str


FILES = {
    "alacritty": FileConfig(".config"),
    "inputrc": FileConfig(""),
    "init.lua": FileConfig(".config/nvim"),
    "tmux.conf": FileConfig(""),
    "zshrc": FileConfig(""),
}


def main():
    dotfiles_dir = os.path.dirname(os.path.realpath(__file__))
    home_dir = os.path.expanduser("~")

    for file, file_config in FILES.items():
        destination_dir = os.path.join(home_dir, file_config.relative_path)
        filename = file
        if file_config.relative_path == "":
            filename = "." + filename
        else:
            try:
                os.makedirs(destination_dir)
            except FileExistsError:
                pass

        source = os.path.join(dotfiles_dir, file)
        destination = os.path.join(destination_dir, filename)

        print(f"Symlink: {source} -> {destination}")
        try:
            os.symlink(source, destination)
        except FileExistsError:
            pass


if __name__ == "__main__":
    main()
