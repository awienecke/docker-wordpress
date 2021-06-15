FROM alpine:3.13
RUN apk add wget nginx php7 php7-fpm php7-xml php7-curl php7-dom \
        php7-exif php7-fileinfo php7-json php7-mbstring php7-mysqli \
        php7-imagick php7-zip php7-simplexml php7-sodium \
        php7-gd php7-zlib php7-xmlreader php7-iconv php7-mcrypt && \
        rm -rf /var/lib/apt/lists/ && \
        mkdir -p /run/nginx && chown nginx.nginx /run/nginx
RUN wget -O latest.tar.gz https://wordpress.org/latest.tar.gz
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY php.conf /etc/php7/php-fpm.d/www.conf 
COPY run.sh /tmp/
RUN chmod 755 /tmp/run.sh
EXPOSE 80/tcp
CMD ["sh", "-c", "/tmp/run.sh"]

