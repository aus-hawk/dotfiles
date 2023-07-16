#!/bin/bash

# exit 1 = Estragon couldn't be installed
# exit 2 = Bad Estragon environment
# exit 3 = Bad package installation
# exit 4 = Bad setup
# exit 5 = Bad config deployment

# Needed for setting up Go as well as running Estragon
localbin=${localbin:-"$HOME/.local/bin"}

if [[ ! -x "$(command -v estragon)" ]]; then
    echo "Estragon is not installed"

    if [[ ! -x "$(command -v go)" ]]; then
        echo "Go is not installed"
        echo "Installing Go for $1"

        if [[ $# -eq 0 ]]; then
            echo "Distro name not passed as the first argument"
            echo "Usage: ./bootstrap.sh [DISTRO]"
            echo "Valid distros: arch"
            exit 1
        fi

        case "$1" in
            arch)
                sudo pacman -S --noconfirm go
                if [[ $? -ne 0 ]]; then
                    echo "Failed to install Go"
                    exit 1
                fi
                ;;
            *)
                echo "\"$1\" is not a valid distro name, can't install Go"
                exit 1
                ;;
        esac
        echo "Go has been installed successfully"
    fi

    XDG_DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}
    echo $localbin
    go env -w GOPATH="$XDG_DATA_HOME/go" GOBIN="$localbin"

    go install github.com/aus-hawk/estragon@latest
    if [[ $? -ne 0 ]]; then
        echo "Failed to install Estragon"
        exit 1
    fi

    echo "Estragon has been installed successfully"
fi

if ! "$localbin/estragon" > /dev/null; then
    echo "Something is wrong with the Estragon environment string"
    echo "Set it to a valid one with:"
    echo '    "$localbin/estragon" -e [ENV]'
    echo "and rerun"
    exit 2
fi

# Set variables needed to run Estragon
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

echo "Installing packages"
sudo "$localbin/estragon" install --all
if [[ $? -ne 0 ]]; then
    echo "Failed to install packages"
    exit 3
fi

echo "Changing shell to Zsh"
chsh -s /bin/zsh
if [[ $? -ne 0 ]]; then
    echo "Failed to change shell to Zsh"
fi

echo "Deploying dotfiles"
"$localbin/estragon" deploy --all
if [[ $? -ne 0 ]]; then
    echo "Failed to deploy dotfiles"
    exit 5
fi
