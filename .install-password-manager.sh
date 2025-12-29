#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type password-manager-binary >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install password-manager-binary on Darwin (macOS)
    brew install 1password-cli
    # ask and wait for user to confirm 1password GUI installation and CLI enablement
    echo "Please install the 1Password GUI application from https://1password.com/downloads/ and enable the CLI integration. Press Enter to continue after installation."
    read -r
    1password-cli signin
    1password-cli --version
    ;;
Linux)
    echo "linux install not yet implemented"
    # commands to install password-manager-binary on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
