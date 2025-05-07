import argparse
import os
import sys
from typing import Optional, Tuple

from dataclasses import dataclass


@dataclass
class FileConfig:
    relative_path: Optional[str] = None


FILES = {
    "alacritty.toml": FileConfig(".config"),
    "inputrc": FileConfig(),
    "init.lua": FileConfig(".config/nvim"),
    "tmux.conf": FileConfig(),
    "zshrc": FileConfig(),
}


def get_dotfiles_dir() -> str:
    return os.path.dirname(os.path.realpath(__file__))


def calculate_destination_dir(
    dest_dir: str, file: str, file_config: FileConfig
) -> Tuple[str, str]:
    relative_path_component = file_config.relative_path if file_config.relative_path else ""
    destination_dir = os.path.join(dest_dir, relative_path_component)
    filename = file
    if relative_path_component == "":
        filename = "." + filename

    return (destination_dir, filename)


def install(args):
    for file, file_config in FILES.items():
        (destination_dir, filename) = calculate_destination_dir(
            args.dest_dir, file, file_config
        )
        try:
            os.makedirs(destination_dir)
        except FileExistsError:
            pass

        source = os.path.join(get_dotfiles_dir(), file)
        destination = os.path.join(destination_dir, filename)

        print(f"Symlink: {source} -> {destination}")
        try:
            os.symlink(source, destination)
        except FileExistsError:
            pass


def uninstall(args):
    for file, file_config in FILES.items():
        (destination_dir, filename) = calculate_destination_dir(
            args.dest_dir, file, file_config
        )

        destination = os.path.join(destination_dir, filename)
        print(f"Removing symlink: {destination}")
        try:
            os.remove(destination)
        except FileNotFoundError:
            pass


def main():
    parser = argparse.ArgumentParser(description="dotfile management tool")
    subparsers = parser.add_subparsers()

    # Install
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

    # Uninstall
    uninstall_command_parser = subparsers.add_parser("uninstall")
    uninstall_command_parser.add_argument(
        "--dest-dir",
        type=str,
        nargs=1,
        default=os.path.expanduser("~"),
        required=False,
        help="Destination directory to remove dotfiles from (Defaults to homedir)",
    )
    uninstall_command_parser.set_defaults(func=uninstall)

    args = parser.parse_args()
    if hasattr(args, "func"):
        args.func(args)
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
