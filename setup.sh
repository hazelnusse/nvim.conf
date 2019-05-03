#!/bin/bash
NVIM_DIR="${HOME}/.config/nvim"
if [[ -d "${NVIM_DIR}" ]]
then
    echo "Removing ${NVIM_DIR}..."
    rm -rf "${NVIM_DIR}"
fi

mkdir -p "${NVIM_DIR}"

ln -s "$(pwd)"/init.vim "${NVIM_DIR}"/init.vim
