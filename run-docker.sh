#!/bin/bash
set -e

# Build and run the containerized portfolio
echo " Building Anthony Richards Portfolio Container..."

# Build the Docker image
docker-compose build

echo " Build completed!"

# Run database migrations
echo " Running database migrations..."
docker-compose run --rm web python manage.py migrate

# Create superuser (optional)
echo " Would you like to create a superuser for Django admin? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    docker-compose run --rm web python manage.py createsuperuser
fi

# Start all services
echo " Starting all services..."
docker-compose up -d

echo " Portfolio is now running!"
echo " Access your portfolio at: http://localhost"
echo " Django admin at: http://localhost/admin"
echo "View logs: docker-compose logs -f"
echo " Stop services: docker-compose down"
