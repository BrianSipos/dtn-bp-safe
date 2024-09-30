#!/bin/bash
# Read stdin and verify it as valid CBOR sequence against a CDDL schema.
set -e
SELFDIR=$(readlink -f $(dirname "${BASH_SOURCE[0]}"))

COMBINED_CDDL=$1

TMPFILE=$(mktemp)
# wrap with indefinite array to satisfy the tool
echo -ne "\x9F" >>${TMPFILE}
cat | diag2cbor.rb >>${TMPFILE}
echo -ne "\xFF" >>${TMPFILE}
cddl validate --cddl "${COMBINED_CDDL}" --cbor ${TMPFILE}
echo "Exit $?"
rm ${TMPFILE}
