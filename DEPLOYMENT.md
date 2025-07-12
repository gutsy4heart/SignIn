# Deployment Guide

This guide covers how to deploy the Sign In/Sign Up application using Docker.

## Prerequisites

- Docker and Docker Compose installed
- Docker Hub account (for production deployment)
- Git

## Local Development

### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd SignIn
```

### 2. Run with Docker Compose
```bash
# Build and start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### 3. Access the Application
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000
- Database: localhost:5432

## Production Deployment

### 1. Update Docker Hub Username
Edit the following files and replace `your-dockerhub-username` with your actual Docker Hub username:
- `docker-compose.prod.yml`
- `build-and-push.sh`

### 2. Build and Push Images
```bash
# Make sure you're logged into Docker Hub
docker login

# Build and push images
./build-and-push.sh
```

### 3. Deploy with Docker Hub Images
```bash
# Run with production compose file
docker-compose -f docker-compose.prod.yml up -d
```

## Environment Configuration

### Frontend Environment Variables
Create `.env` file in the `frontend` directory:
```env
REACT_APP_API_URL=http://localhost:5000
```

### Backend Environment Variables
The backend configuration is in `backend/appsettings.json`. For production, you can override using environment variables:
```bash
export ConnectionStrings__DefaultConnection="Host=postgres;Database=signin_db;Username=postgres;Password=your-secure-password"
export JwtSettings__SecretKey="your-super-secure-jwt-secret-key"
```

## Database Management

### Initial Setup
The database is automatically created when the application starts. The Entity Framework context will create the necessary tables.

### Backup Database
```bash
docker exec signin_postgres pg_dump -U postgres signin_db > backup.sql
```

### Restore Database
```bash
docker exec -i signin_postgres psql -U postgres signin_db < backup.sql
```

## Monitoring and Logs

### View Service Logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f postgres
```

### Health Checks
```bash
# Check service status
docker-compose ps

# Check database connectivity
docker exec signin_postgres pg_isready -U postgres
```

## Troubleshooting

### Common Issues

1. **Port Already in Use**
   ```bash
   # Check what's using the port
   lsof -i :3000
   lsof -i :5000
   lsof -i :5432
   
   # Stop conflicting services
   sudo systemctl stop <service-name>
   ```

2. **Database Connection Issues**
   ```bash
   # Check if PostgreSQL is running
   docker exec signin_postgres pg_isready -U postgres
   
   # Restart the database
   docker-compose restart postgres
   ```

3. **Frontend Not Loading**
   ```bash
   # Check if the build was successful
   docker logs signin_frontend
   
   # Rebuild the frontend
   docker-compose build frontend
   docker-compose up -d frontend
   ```

### Reset Everything
```bash
# Stop and remove all containers, networks, and volumes
docker-compose down -v

# Remove all images
docker rmi $(docker images -q)

# Start fresh
docker-compose up -d
```

## Security Considerations

1. **Change Default Passwords**
   - Update PostgreSQL password in docker-compose files
   - Use strong JWT secret keys
   - Consider using Docker secrets for sensitive data

2. **Network Security**
   - Use reverse proxy (nginx) in production
   - Enable HTTPS
   - Configure firewall rules

3. **Database Security**
   - Use strong passwords
   - Limit database access
   - Regular backups

## Scaling

### Horizontal Scaling
```bash
# Scale backend services
docker-compose up -d --scale backend=3

# Use load balancer for frontend
# Consider using Docker Swarm or Kubernetes for production
```

## Maintenance

### Update Images
```bash
# Pull latest images
docker-compose pull

# Restart services
docker-compose up -d
```

### Cleanup
```bash
# Remove unused containers, networks, and images
docker system prune -a

# Remove unused volumes
docker volume prune
``` 