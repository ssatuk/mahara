#!/bin/bash
versions=(19.10_STABLE 20.04_STABLE master)
git fetch upstream
for BRANCH in "${versions[@]}"; do
   echo $BRANCH
   git push origin refs/remotes/upstream/$BRANCH:refs/heads/$BRANCH
   #git push contrib refs/remotes/upstream/$BRANCH:refs/heads/$BRANCH
done
