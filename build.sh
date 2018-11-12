basepath=$(cd `dirname $0`;pwd)
docker build -t nginx $basepath
