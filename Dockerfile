FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 unzip zip curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract the web content
RUN curl -L -o /var/www/html/oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
RUN unzip /var/www/html/oxer.zip -d /var/www/html/ && \
    rm /var/www/html/oxer.zip


# Expose port 80
EXPOSE 80