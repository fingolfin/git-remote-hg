#!/bin/sh

. ./sharness.sh

if ! command -v python2 >/dev/null
then
	skip_all='skipping remote-hg tests; python not available'
	test_done
fi

if ! python2 -c 'import mercurial' > /dev/null 2>&1
then
	skip_all='skipping remote-hg tests; mercurial not available'
	test_done
fi

if ! command -v git >/dev/null
then
	skip_all='skipping remote-hg tests; git not available'
	test_done
fi

GIT_VERSION=$(git --version)
GIT_MAJOR=$(expr "$GIT_VERSION" : '[^0-9]*\([0-9]*\)')
GIT_MINOR=$(expr "$GIT_VERSION" : '[^0-9]*[0-9]*\.\([0-9]*\)')
test "$GIT_MAJOR" -ge 2 && test_set_prereq GIT_2_0

GIT_AUTHOR_EMAIL=author@example.com
GIT_AUTHOR_NAME='A U Thor'
GIT_COMMITTER_EMAIL=committer@example.com
GIT_COMMITTER_NAME='C O Mitter'
export GIT_AUTHOR_EMAIL GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL GIT_COMMITTER_NAME
