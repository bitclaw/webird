#!/usr/bin/env bash
# Environment variables SCRIPTDIR and TEMPDIR are available
. $SCRIPTDIR/functions/php.sh

list=$(readlist "$SCRIPTDIR/lists/pecl")
for extension in $list
do
  php-pecl-install $extension
  [[ $? -ne 0 ]] && exit 1
done

exit 0
