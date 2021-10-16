#!/bin/bash
#
# Convert http url to ssh url and vice versa.
# In '.git/config'.
#
# url = https://github.com/olegse/scripts
#       -> git@github.com-olegse:olegse/scripts
#  
# Note '-olegse' part, that for allowing different ssh keys in
# .ssh/config
# 
# Also edit ssh config file.


usage() {
  echo "Usage: `basename $0` -t|-i"
  echo "Convert upstream url within '.git/config' file. I.e.:"
  echo "  url = https://github.com/olegse/scripts ->  url = git@github.com-olegse:olegse/scripts.git"
  echo "    -t    display the resulting line (do not edit)"
  echo "    -i    edit a file"
  echo "    -p    print current url"
  exit 1
}

#pwd
if (( $# == 0 )); then usage; fi

while getopts ":tip" OPT
do
  #echo "Processing: $OPT"
  case $OPT in
   't') action='np' ;;
   'i') action='i' ;;
   'p') action='c' ;;
   '?') echo "Invalid option '-$OPTARG'"
        usage ;;
  esac
done

# Append path to the file name (defaults to '.')
path=${!OPTIND:-.};
GIT_CONF=$path/.git/config

case $action in 
  'c') awk -F= '/url/ {print $2}' $GIT_CONF
       exit ;;
esac
echo "action: $action"

set -x
if grep -q $GIT_CONF -e "url.*https"; then 
  sed -${action:0:1} "/url/ s,\S\+//\([^/]\+\)/\([^/]\+\)/\([^/]\+\),git@\1:\2/\3,${action:1:1}" $GIT_CONF
else
  sed -${action:0:1} "/url/ s,git@\([^:]\+\):,https://\1/,${action:1:1}" $GIT_CONF
fi
