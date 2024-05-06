FROM centos:stream8  
MAINTAINER halakammoun2001@gmail.com

COPY C:/Users/hale/Desktop/projet\ devops/step1/photogenic.zip /var/www/html/

WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]  # Updated httpd command
EXPOSE 80
