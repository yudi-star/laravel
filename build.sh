#!/usr/bin/env bash
# exit on error
set -o errexit

# Instalar dependencias de PHP con Composer
composer install --no-interaction --no-dev --prefer-dist

# Instalar dependencias de Node.js y compilar assets (si usas Vite/Mix)
# Descomenta las siguientes dos líneas si tu proyecto tiene frontend
# npm install
# npm run build

# Limpiar y cachear configuraciones para producción
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Generar el enlace simbólico para el almacenamiento público
php artisan storage:link

# Ejecutar las migraciones de la base de datos
# El flag --force es necesario para ejecutar en un entorno de producción
php artisan migrate --force