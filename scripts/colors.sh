#!/bin/bash

# If this is imported in a file that is executed in the context of a Makefile which is
# located in the root directory, import this from the perspective of the root script and not
# the subscripts (i.e in the case of a Makefile the subscript should import from './scripts/colors.sh').

# shellcheck disable=SC2155
export R="$(tput sgr0)" # Reset

export BW="$(tput setab 0)"
export BR="$(tput setab 1)"
export BG="$(tput setab 2)"
export BY="$(tput setab 3)"
export BP="$(tput setab 5)"
export BB="$(tput setab 6)"
export BW="$(tput setab 7)"

export TW="$(tput setaf 0)"
export TR="$(tput setaf 1)"
export TG="$(tput setaf 2)"
export TY="$(tput setaf 3)"
export TP="$(tput setaf 5)"
export TB="$(tput setaf 6)"
export TW="$(tput setaf 7)"

export A="${TW}>>${R}"
