#!/bin/bash
# Styling
COLOR_DEFAULT='\033[0m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_GREY='\033[0;37m'
COLOR_CYAN='\033[0;36m'

FONT_WEIGHT_BOLD="\033[1m"
FONT_WEIGHT_REGULAR="\033[0m"

# Public functions

u_link_file () {
    declare tag="$1" name="$2" file_path="$3" destination_path="$4"
    bold_name="${FONT_WEIGHT_BOLD}[${tag}] ${name}${FONT_WEIGHT_REGULAR}"

    if [ "$(readlink -- "$destination_path")" = $file_path ]; then
        echo -e "${COLOR_GREY} = ${bold_name}${COLOR_GREY} is already linked to comfy_guration${COLOR_DEFAULT}"
    else
        __create_symlink $tag $name $file_path $destination_path
    fi
}

# Private functions

__safe_mkdir () {
    declare file_path="$1"
    directory_path="$(dirname "${destination_path}")"
    if [ ! -d $directory_path ]; then
        echo "Making directory ${directory_path}"
        mkdir -p $directory_path
    fi
}

__create_symlink () {
    declare tag="$1" name="$2" file_path="$3" destination_path="$4"
    bold_name="${FONT_WEIGHT_BOLD}[${tag}] ${name}${FONT_WEIGHT_REGULAR}"

    exists_warning="does not exist"
    overwrite_warning=
    if [ -f $destination_path ] || [ -L $destination_path ]; then
        exists_warning="exists but is not linked to comfy_guration"
        overwrite_warning=" It will overwrite the destination."
    fi

    echo -e "$bold_name (${destination_path}) ${exists_warning}."
    while : ; do
        read -p "$(echo -e "Do you want to link ${COLOR_CYAN}${bold_name}${COLOR_DEFAULT}?${overwrite_warning} [y/n] :")" -n 1 -r; echo
        case $REPLY in
            y|Y)
                u_safe_mkdir $destination_path
                ln --symbolic --force $file_path $destination_path
                echo -e "${COLOR_GREEN} + ${bold_name}${COLOR_GREEN} LINKED${COLOR_DEFAULT}"
                break ;;
            n|N)
                echo -e "${COLOR_RED} - ${bold_name}${COLOR_RED} IGNORED${COLOR_DEFAULT}"
                break ;;
            * )
                echo -e "Invalid input. Must be [${FONT_WEIGHT_BOLD}y${FONT_WEIGHT_REGULAR}]es or [${FONT_WEIGHT_BOLD}n${FONT_WEIGHT_REGULAR}]o." ;;
        esac
    done
}
