# Stage 1: Download and Extract (Build Environment)
FROM alpine:latest AS downloader

RUN apk add --no-cache zip unzip

COPY https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /tmp/photogenic.zip

WORKDIR /tmp

RUN unzip photogenic.zip

# Stage 2: Build the Application Image (Smaller Runtime Environment)
FROM centos:stream8

# Optional: Install essential packages (if needed)
# RUN yum install -y httpd  # Uncomment if needed

COPY --from=downloader /tmp/ /var/www/html/

# Set permissions (optional, adjust based on your needs)
RUN chmod -R 755 /var/www/html/

# Start the httpd service in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for external access
EXPOSE 80