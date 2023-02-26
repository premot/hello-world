raw1=/pool.3/RAW1
raw2=/pool.3/RAW2
cpr=/pool.3/CPR
ip=192.168.0

#bootstrap
#rsync -a $raw1/ $raw2 &&
#rsync -a $raw2/ $raw1 &&a
while :
do
	
	for file in 101 102 103 104
	do
	youtube-dl http://$ip.$file:8081 -o $raw1/$file.avi &
	done
	
	filedate="$(date | cut -c 9-16 | tr " " _)"
	
	for file in 101 102 103 104
	do
	#mkdir $cpr$file
	ffmpeg -i $raw2/$file.avi.part -vcodec h264 -crf 28 -acodec copy $cpr/$file/$filedate-$file.avi
	done
	rm $raw2/* &&
	sleep 60 && kill -15 $(pgrep yt-dlp)
	
	
	for file in 101 102 103 104
	do
	youtube-dl http://$ip.$file:8081 -o $raw2/$file.avi &
	done
	
	filedate="$(date | cut -c 9-16 | tr " " _)"
	
	for file in 101 102 103 104
	do
	#mkdir $cpr$file
	ffmpeg -i $raw1/$file.avi.part -vcodec h264 -crf 28 -acodec copy $cpr/$file/$filedate-$file.avi
	done
	rm $raw1/* &&
	sleep 60 && kill -15 $(pgrep yt-dlp)
	
done
