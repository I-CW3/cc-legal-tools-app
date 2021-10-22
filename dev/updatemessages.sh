#!/bin/bash
#
# Run Django Management makemessages with helpful options (including excluding
# legalcode) and compilemessages
#
set -o errtrace
set -o nounset

# Change directory to cc-licenses (grandparent directory of this script)
cd ${0%/*}/../

if ! docker-compose exec app true 2>/dev/null; then
    echo 'The app container/services is not avaialable.' 1>&2
    echo 'First run `docker-compose up`.' 1>&2
    exit 1
fi

printf "\e[1m\e[7m %-80s\e[0m\n" 'Django Managment makemessages'
docker-compose exec app coverage run manage.py \
    makemessages \
        --all \
        --symlinks \
        --ignore **/includes/legalcode_licenses_4.0.html \
        --ignore **/includes/legalcode_zero.html \
        --no-obsolete \
        --keep-pot
echo

printf "\e[1m\e[7m %-80s\e[0m\n" 'Django Managment compilemessages'
docker-compose exec app coverage run manage.py \
    compilemessages
echo
