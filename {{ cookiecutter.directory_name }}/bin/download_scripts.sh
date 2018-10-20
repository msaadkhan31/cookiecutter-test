#!/bin/bash

if [ "$1" = "" ]
then
  echo "Usage: please provide deployment script language i.e bash or python"
  exit 1
fi
if [  -d deployment-scripts ]
then
      echo "Scripts UpToDate"
      exit 0
fi
if [ "$c1" != bash -a "$1" != python ]; then
  echo "Unknown language."
  exit 1
fi

cd ops/bin
git init
git config core.sparsecheckout true
echo deployment-scripts/$1/ >> .git/info/sparse-checkout
git remote add -f origin ssh://careem@vault.phacility.com/source/cicd-tools.git
git pull --depth=1 origin development
git pull origin development
cd deployment-scripts/$1
mv *.py ../../ || exit 0
mv *.sh ../../ || exit 0
cd ../../
rm -rf deployment-scripts && rm -rf .git || exit 0
exit 0