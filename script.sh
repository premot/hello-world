echo 189.143.143.52 | cut -d "." -f 3,4 > fileNewest
#$(curl icanhazip.com)
date >> fileNewest
  git add *
   git commit -m "send"
    git push
