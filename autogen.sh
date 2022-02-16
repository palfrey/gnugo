#!/bin/sh
# autogen.sh
##
# Usage: sh autogen.sh
#
# Run this script after checking out the source repository.
# It creates the configure script, Makefile.in files, etc.
##

set -ex
autoreconf --verbose --force --install

# autogen.sh ends here
