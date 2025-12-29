#!/bin/sh

# exit immediately if onepassword-cli is already in $PATH
type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install onepassword-cli on Darwin (macOS)
    brew install 1password-cli
    # ask and wait for user to confirm 1password GUI installation and CLI enablement
    echo "Please install the 1Password GUI application from https://1password.com/downloads/ and enable the CLI integration. Press Enter to continue after installation."
    read -r
    op signin
    op --version
    ;;
Linux)
    echo "linux install not yet implemented"
    # commands to install onepassword-cli on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
