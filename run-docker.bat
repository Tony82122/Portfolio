@echo off
echo =======================================
echo  Anthony Richards Portfolio ..yes i did it myself - Docker
echo =======================================
echo.

echo Building Docker containers...
docker-compose build

if %errorlevel% neq 0 (
    echo Error occurred during build!
    pause
    exit /b %errorlevel%
)

echo.
echo Running database migrations...
docker-compose run --rm web python manage.py migrate

echo.
echo Starting all services...
docker-compose up -d

echo.
echo =======================================
echo  Portfolio is now running!
echo =======================================
echo.
echo Portfolio URL: http://localhost
echo Django Admin: http://localhost/admin
echo.
echo Commands:
echo   View logs: docker-compose logs -f
echo   Stop: docker-compose down
echo   Restart: docker-compose restart
echo.
pause
