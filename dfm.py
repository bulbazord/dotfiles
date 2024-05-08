import argparse
import os
import sys
import typing

from dataclasses import dataclass


@dataclass
class FileConfig:
    relative_path: str


FILES = {
    "alacritty.toml": FileConfig(".config"),
    "inputrc": FileConfig(""),
    "init.lua": FileConfig(".config/nvim"),
    "tmux.conf": FileConfig(""),
    "zshrc": FileConfig(""),
}


def install(args):
    dotfiles_dir = os.path.dirname(os.path.realpath(__file__))

    for file, file_config in FILES.items():
        destination_dir = os.path.join(args.dest_dir, file_config.relative_path)
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


def main():
    parser = argparse.ArgumentParser(description="dotfile management tool")
    subparsers = parser.add_subparsers()

    install_command_parser = subparsers.add_parser("install")
    install_command_parser.add_argument(
        "--dest-dir",
        type=str,
        nargs=1,
        default=os.path.expanduser("~"),
        required=False,
        help="Destination directory to install dotfiles to (Defaults to homedir)",
    )
    install_command_parser.set_defaults(func=install)

    args = parser.parse_args()
    if hasattr(args, "func"):
        args.func(args)
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
