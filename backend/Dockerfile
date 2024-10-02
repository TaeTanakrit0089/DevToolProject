FROM php:8.0-apache

WORKDIR /var/www/html

# Install necessary PHP extensions for PostgreSQL
RUN docker-php-ext-install pgsql pdo_pgsql

COPY . .

EXPOSE 8000
CMD ["apache2-foreground"]