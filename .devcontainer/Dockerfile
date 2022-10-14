# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
ARG VARIANT=7
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# Install MariaDB client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y mariadb-client \ 
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install php-mysql driver
RUN docker-php-ext-install mysqli pdo pdo_mysql

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Configure Apache2 for Phorge
RUN a2enmod rewrite

RUN { \
        echo '<VirtualHost *:8080>'; \
        echo '  DocumentRoot /workspace/phorge/webroot'; \
        echo '  ServerName phorge.local'; \
        echo '  RewriteEngine on'; \
        echo '  RewriteRule ^(.*)$ /index.php?__path__=$1 [B,L,QSA]'; \
        echo '</VirtualHost>'; \
    } > /etc/apache2/sites-available/000-default.conf

RUN { \
        echo '<Directory "/workspace/phorge/webroot">'; \
        echo '  Require all granted'; \
        echo '</Directory>'; \
    } > /etc/apache2/conf-available/phorge.conf

RUN a2enconf phorge
