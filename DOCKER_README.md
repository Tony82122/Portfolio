
## Docker Deployment Guide


## Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│     Nginx       │────│     Django      │────│   PostgreSQL    │
│  (Web Server)   │    │  (Application)  │    │   (Database)    │
│     Port 80     │    │    Port 8000    │    │    Port 5432    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                              │
                       ┌─────────────────┐
                       │      Redis      │
                       │    (Cache)      │
                       │    Port 6379    │
                       └─────────────────┘
```

##  Quick Start

### Prerequisites
- Docker Desktop installed
- Docker Compose installed

### Windows Users
```cmd
# Double-click or run:
run-docker.bat
```

### Linux/Mac Users
```bash
chmod +x run-docker.sh
./run-docker.sh
```

### Manual Setup
```bash
# 1. Build containers
docker-compose build

# 2. Run migrations
docker-compose run --rm web python manage.py migrate

# 3. Create superuser (optional)
docker-compose run --rm web python manage.py createsuperuser

# 4. Start all services
docker-compose up -d
```

## Access Points

- **Portfolio Website**: http://localhost
- **Django Admin**: http://localhost/admin
- **Database**: localhost:5432

## Available Commands

```bash
# View live logs
docker-compose logs -f

# Stop all services
docker-compose down

# Restart services
docker-compose restart

# Rebuild and restart
docker-compose up --build

# Access Django shell
docker-compose exec web python manage.py shell

# Run Django commands
docker-compose exec web python manage.py [command]
```

##  Configuration

### Environment Variables
Copy `.env.example` to `.env` and update values:
```env
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1,yourdomain.com
DATABASE_URL=postgresql://portfolio_user:portfolio_pass@db:5432/portfolio
```

### Production Deployment
1. Update environment variables in `docker-compose.yml`
2. Configure SSL certificates for Nginx
3. Update `ALLOWED_HOSTS` with your domain
4. Set strong passwords for database

## Services

### Django Application (`web`)
- **Base Image**: Python 3.11 slim
- **Framework**: Django 4.2.7
- **WSGI Server**: Gunicorn
- **Static Files**: WhiteNoise + Nginx

### Database (`db`)
- **Image**: PostgreSQL 15 Alpine
- **Volume**: Persistent data storage
- **Environment**: Isolated network

### Web Server (`nginx`)
- **Image**: Nginx Alpine
- **Purpose**: Reverse proxy, static files
- **Configuration**: Optimized for Django

### Cache (`redis`)
- **Image**: Redis Alpine
- **Purpose**: Session storage, caching
- **Optional**: Can be removed if not needed

## 🛡 Security Features

- Non-root user in containers
- Security headers in Nginx
- Environment variable configuration
- Isolated container network
- Health checks




### Development
```bash
# Use SQLite, DEBUG=True
docker-compose -f docker-compose.dev.yml up
```

### Production
```bash
# Use PostgreSQL, DEBUG=False
docker-compose up -d
```


### View Logs
```bash
# All services
docker-compose logs

# Specific service
docker-compose logs web
docker-compose logs nginx
docker-compose logs db
```

### Container Status
```bash
# List running containers
docker-compose ps

# View resource usage
docker stats
```

## Cloud Deployment

This containerized setup is ready for:
- **AWS ECS/Fargate**
- **Google Cloud Run**
- **Azure Container Instances**
- **DigitalOcean App Platform**
- **Heroku Container Registry**
- **Kubernetes clusters**



