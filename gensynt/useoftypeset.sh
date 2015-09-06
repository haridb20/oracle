#!/usr/bin/env ksh

# @(#) s1       Demonstrate similarities, ksh: typeset, bash: printf.

set -o nounset
echo

## Use local command version for the commands in this demonstration.

echo "ksh version = $KSH_VERSION"
bash --version | head -1
printf --version | head -1

echo

typeset -L10 L10="12345"
typeset -R10 R10="abcde"

echo " ksh with typeset:"
echo "L10 is $L10"
echo "R10 is $R10"

echo
echo " bash with printf:"
bash <<'EOF'
left="12345"
righ="abcde"

printf "left is %-10s\n" $left
printf "righ is %10s\n" $righ
EOF

exit 0
