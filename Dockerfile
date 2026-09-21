FROM php:8.2-apache

# Environment variables
ENV SKIN_LANGUAGE=skins_en
ENV DB_HOST=localhost
ENV DB_PORT=3306
ENV DB_NAME=
ENV DB_USER=
ENV DB_PASS=
ENV WEB_STYLE_DARK=true
ENV STEAM_API_KEY=
ENV STEAM_DOMAIN_NAME=
ENV STEAM_LOGOUT_PAGE=
ENV STEAM_LOGIN_PAGE=

# Enable the Apache mod_rewrite module (usually useful for PHP sites)
RUN a2enmod rewrite

# Install the common PHP extensions for the database (mysqli, pdo_mysql)
# Given the presence of 'class/database.php', these extensions are likely required.
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set the working directory
WORKDIR /var/www/html

# Copy the website files into the container
COPY . /var/www/html/

# Adjust permissions for the Apache user (www-data)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80
