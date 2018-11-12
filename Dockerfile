FROM centos:7.2.1511

MAINTAINER XiaoWei <xiaoweiqb@126.com>

ENV NGINX_VERSION 1.12.2

RUN useradd -s /sbin/nologin nginx

RUN yum install -y wget vim gcc gcc-c++ pcre-devel openssl openssl-devel

RUN mkdir /usr/local/nginx \
	&& cd /usr/local/nginx \
	&& wget http://nginx.org/download/nginx-1.12.2.tar.gz \
	&& tar -xzf nginx-1.12.2.tar.gz 
RUN cd /usr/local/nginx/nginx-1.12.2 \
	&& ./configure \
		--user=nginx \
		--group=nginx \
		--prefix=/opt/nginx \
		--sbin-path=/usr/sbin/nginx \
		--conf-path=/etc/nginx/nginx.conf \
		--error-log-path=/var/log/nginx/error.log \
		--http-log-path=/var/log/nginx/access.log \
		--http-client-body-temp-path=/tmp/nginx/client_body \
		--http-proxy-temp-path=/tmp/nginx/proxy \
		--http-fastcgi-temp-path=/tmp/nginx/fastcgi \
		--pid-path=/var/run/nginx.pid \
		--lock-path=/var/lock/subsys/nginx \
		--with-http_stub_status_module \
		--with-http_ssl_module \
		--with-http_gzip_static_module \
		--with-pcre \
		--with-http_realip_module \
		--with-http_sub_module \
	&& make \
	&& make install

RUN mkdir -p /tmp/nginx/client_body

EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]
