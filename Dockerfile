FROM centos:stream8  # This might not work on Windows directly, consider alternative base image for Windows
MAINTAINER halakammoun2001@gmail.com

# Assuming Docker Desktop is configured with shared folders and "projet devops" is a shared folder name
COPY C:/Users/hale/Desktop/projet\ devops/step1/photogenic.zip /var/www/html/

WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]  # Updated httpd command
EXPOSE 80
