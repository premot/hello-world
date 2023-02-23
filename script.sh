sleep $((RANDOM % 3600))
echo $(curl icanhazip.com) | tr . a >> fileNewest
date >> fileNewest
printf "\n"
  git add *
   git commit -m "send"
    git push
