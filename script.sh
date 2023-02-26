sleep $((RANDOM % 36))
echo $(curl icanhazip.com) | tr . a >> ~/hello-world/fileNewest
date >> ~/hello-world/fileNewest
  git add .
   git commit -m "send"
    git push 
