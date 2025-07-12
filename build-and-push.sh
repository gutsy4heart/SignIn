#!/bin/bash

# Configuration
DOCKER_USERNAME="your-dockerhub-username"
FRONTEND_IMAGE="signin-frontend"
BACKEND_IMAGE="signin-backend"
VERSION="latest"

echo "Building and pushing Docker images to Docker Hub..."

# Build frontend image
echo "Building frontend image..."
docker build -t $DOCKER_USERNAME/$FRONTEND_IMAGE:$VERSION ./frontend

# Build backend image
echo "Building backend image..."
docker build -t $DOCKER_USERNAME/$BACKEND_IMAGE:$VERSION ./backend

# Push frontend image
echo "Pushing frontend image to Docker Hub..."
docker push $DOCKER_USERNAME/$FRONTEND_IMAGE:$VERSION

# Push backend image
echo "Pushing backend image to Docker Hub..."
docker push $DOCKER_USERNAME/$BACKEND_IMAGE:$VERSION

echo "All images have been built and pushed successfully!"
echo ""
echo "To run the application with Docker Hub images, use:"
echo "docker-compose -f docker-compose.prod.yml up -d"
echo ""
echo "To run the application with local builds, use:"
echo "docker-compose up -d" 