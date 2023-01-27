#!/bin/bash

# This is just a convenience script that is used to copy all the
# necessary settings in one shot.

# The source directory from where files are being used
SRCDIR="/fs/ess/PMIU0184/setup"

# First check to ensure this script is being run from a workspace folder
if [ ! -f "workspace.code-workspace" ]; then
    echo "This script should be run after you have saved as a workspace"
    exit 10 
fi

# Add to the start-up scripts
cat "${SRCDIR}/.bashrc"       >> "${HOME}/.bashrc"
if [ $? -ne 0 ]; then
    echo "Something went wrong when updating ~/.bashrc"
    exit 1
fi

# Setup bash profile to load modules if logging in via ssh
cat "${SRCDIR}/.bash_profile" >> "${HOME}/.bash_profile"
if [ $? -ne 0 ]; then
    echo "Something went wrong when updating ~/.bash_profile"
    exit 2
fi

# Copy the global configuration for vscode
cp "${SRCDIR}/settings.json" "${HOME}/.local/share/code-server/User/settings.json"
if [ $? -ne 0 ]; then
    echo "Something went wrong when updating settings.json"
    exit 3
fi

# Copy the global configuration for vscode
cp "${SRCDIR}/.gdbinit" "${HOME}/.gdbinit"
if [ $? -ne 0 ]; then
    echo "Something went wrong when updating ~/.gdbinit"
    exit 4
fi

# Create a .vscode/c_cpp_properties.json file for local intellisene cache
mkdir -p "./.vscode"
if [ $? -ne 0 ]; then
    echo "Something went wrong when creating .vscode directory"
    exit 5
fi

# Create a dummy c_cpp_properties.json file 
touch "./.vscode/c_cpp_properties.json"
if [ $? -ne 0 ]; then
    echo "Something went wrong when creating .vscode/c_cpp_properties.json"
    exit 6
fi


# Copy the default workspace file to ease using a folder 
cp "${SRCDIR}/workspace.code-workspace" "./"
if [ $? -ne 0 ]; then
    echo "Something went wrong when updating workspace file"
    exit 7
fi

# End of script
