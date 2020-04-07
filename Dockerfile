FROM 	alpine:3.9.5
RUN 	set -exu ; \
	apk update ; \
	apk add apache2 ; \
	apk add php ; \
	apk add php-apache2 ; \
	apk add php7-redis ; \
	apk add php-mysqli ; \
	ln -sf /dev/stdout /var/log/apache2/access.log ; \
	ln -sf /dev/stderr /var/log/apache2/error.log ; \
	rm -f /var/cache/apk/* ; \
	rm -f /var/www/localhost/htdocs/* ; 

COPY	index.php /var/www/localhost/htdocs

ENTRYPOINT [ "/usr/sbin/httpd","-D","FOREGROUND" ]
EXPOSE 	80
