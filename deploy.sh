#!/usr/bin/env sh

set -e

npm run build

cd dist

#echo 'reanaived.github.io/' > CNAME

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:reanaived/reanaived.github.io.git master
git push -f git@github.com:reanaived/cac-raffle.git master:gh-pages

cd -