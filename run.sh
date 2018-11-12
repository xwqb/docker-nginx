basepath=$(cd `dirname $0`; pwd)
if [[ $1 == rmc ]]; then
   docker rm -f nginx
fi
docker run --name nginx -v /etc/localtime:/etc/localtime:ro -v $basepath/conf/:/etc/nginx/ -v $basepath/html/:/opt/nginx/html/  -v $basepath/logs/:/var/log/nginx/ --privileged=true --net=host -d nginx
