# Sign In/Sign Up Application

A full-stack authentication application built with React frontend, ASP.NET Core backend, and PostgreSQL database.

## Project Structure

```
SignIn/
├── frontend/          # React application
├── backend/           # ASP.NET Core API
├── docker-compose.yml # Docker orchestration
└── README.md         # This file
```

## Features

- User registration and authentication
- JWT token-based authentication
- Secure password hashing
- PostgreSQL database
- Docker containerization
- Modern React UI with Tailwind CSS

## Quick Start

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd SignIn
   ```

2. **Run with Docker Compose**
   ```bash
   docker-compose up -d
   ```

3. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000
   - Database: localhost:5432

## Development

### Frontend (React)
- Built with React 18
- Styled with Tailwind CSS
- Uses React Router for navigation
- Axios for API calls

### Backend (ASP.NET Core)
- ASP.NET Core 8.0 Web API
- Entity Framework Core
- JWT authentication
- PostgreSQL database

### Database
- PostgreSQL 15
- Entity Framework migrations
- User authentication tables

## Docker Images

The application uses separate Docker images for frontend and backend:
- Frontend: `your-dockerhub-username/signin-frontend:latest`
- Backend: `your-dockerhub-username/signin-backend:latest`

## API Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/profile` - Get user profile (authenticated)

## Environment Variables

Create `.env` files in frontend and backend directories with appropriate configuration. 