FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 unzip zip curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract the web content
RUN curl -L -o /var/www/html/carvilla.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip
RUN unzip /var/www/html/carvilla.zip -d /var/www/html/ && \
    rm /var/www/html/carvilla.zip


# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
