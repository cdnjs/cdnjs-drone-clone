#!/bin/sh

. /ColorEcho.sh

set -e

echoCyan "CDNJS repo objects fetch process, no git clone or checkout here!"

git --version

err() {
    >&2 echoRed "\n==========ERROR==========\n";
    >&2 echo "$@";
    >&2 echoRed "\n==========ERROR==========\n";
    exit 1;
}

if [ "${CI}" != "drone" ] && [ "${DRONE}" != "true" ]; then err "Not a Drone CI environment"; fi
if [ ! -d ".git" ]; then err "Cache .git directory not found!!! What's going on?"; fi
if [ -n "${DRONE_PULL_REQUEST}" ]; then DRONE_COMMIT_BRANCH="pull/${DRONE_PULL_REQUEST}/head"; fi

if echo "${DRONE_REPO_LINK}" | grep 'github.com' > /dev/null 2>&1 ; then
    rm .git/info/sparse-checkout
    wget "$(echo "${DRONE_REPO_LINK}" | sed 's/github.com/raw.githubusercontent.com/g')/${DRONE_COMMIT_SHA}/${PLUGIN_SPARSECHECKOUT}" -O ".git/info/sparse-checkout" &
else
    err "When does CDNJS drop GitHub? No idea!"
fi

if git remote | grep pre-fetch > /dev/null 2>&1 ; then
    git fetch pre-fetch "${DRONE_REPO_BRANCH}":"${DRONE_REPO_BRANCH}" -f > /dev/null 2>&1 || {
        git fetch origin "${DRONE_REPO_BRANCH}":"${DRONE_REPO_BRANCH}" -f
    }
else
    git fetch origin "${DRONE_REPO_BRANCH}":"${DRONE_REPO_BRANCH}" -f
fi

git fetch origin "${DRONE_COMMIT_BRANCH}"
