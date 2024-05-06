FROM centos:stream8
MAINTAINER halakammoun2001@gmail.com
RUN yum install -y httpd zip unzip

# Assuming photogenic.zip is in the same directory as the Dockerfile
COPY photogenic.zip /var/www/html/

WORKDIR /var/www/html/
RUN unzip photogenic.zip

# No need for cp or rm commands as everything is copied at once
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]  # Updated httpd command
EXPOSE 80