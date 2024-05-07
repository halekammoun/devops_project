FROM centos:stream8
MAINTAINER halakammoun2001@gmail.com
RUN yum install -y httpd zip unzip
COPY photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN chmod -R 755 /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80