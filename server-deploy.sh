#!/bin/bash

# LLVM Obfuscator Server Deployment Script
# This script can be used on your SSH server to deploy the application

set -e

# Configuration
DOCKERHUB_USERNAME="${DOCKERHUB_USERNAME:-your-username}"
BACKEND_IMAGE="${DOCKERHUB_USERNAME}/llvm-obfuscator-backend:latest"
FRONTEND_IMAGE="${DOCKERHUB_USERNAME}/llvm-obfuscator-frontend:latest"
DEPLOY_DIR="${DEPLOY_DIR:-/opt/llvm-obfuscator}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Help function
show_help() {
    cat << EOF
LLVM Obfuscator Server Deployment Script

Usage: $0 [OPTIONS] COMMAND

Commands:
    deploy          Deploy the application
    update          Update to latest images
    stop            Stop all services
    restart         Restart all services
    logs            Show logs
    status          Show service status
    health          Check service health
    cleanup         Remove unused images and containers

Options:
    -h, --help      Show this help message
    -v, --verbose   Enable verbose output
    -f, --force     Force operation without confirmation
    --no-pull       Skip pulling latest images
    --username      Docker Hub username (default: $DOCKERHUB_USERNAME)
    --dir           Deployment directory (default: $DEPLOY_DIR)

Environment Variables:
    DOCKERHUB_USERNAME  Docker Hub username
    DEPLOY_DIR          Deployment directory

Examples:
    $0 deploy
    $0 update --no-pull
    $0 logs -f
    $0 cleanup --force
EOF
}

# Check prerequisites
check_prerequisites() {
    log_info "Checking prerequisites..."
    
    # Check if Docker is installed
    if ! command -v docker &> /dev/null; then
        log_error "Docker is not installed. Please install Docker first."
        exit 1
    fi
    
    # Check if Docker Compose is installed
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        log_error "Docker Compose is not installed. Please install Docker Compose first."
        exit 1
    fi
    
    log_success "Prerequisites check passed"
}

# Create docker-compose.yml
create_compose_file() {
    log_info "Creating docker-compose.yml..."
    
    cat > docker-compose.yml << EOF
version: "3.9"

services:
  backend:
    image: $BACKEND_IMAGE
    container_name: llvm-obfuscator-backend
    environment:
      - OBFUSCATOR_DISABLE_AUTH=false
      - PYTHONDONTWRITEBYTECODE=1
      - PYTHONUNBUFFERED=1
    volumes:
      - ./reports:/app/reports
      - ./logs:/app/logs
    expose:
      - "8000"
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-fsS", "http://localhost:8000/api/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
    networks:
      - obfuscator-network

  frontend:
    image: $FRONTEND_IMAGE
    container_name: llvm-obfuscator-frontend
    ports:
      - "80:80"
    depends_on:
      backend:
        condition: service_healthy
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-fsS", "http://localhost/"]
      interval: 30s
      timeout: 10s
      retries: 3
    networks:
      - obfuscator-network

networks:
  obfuscator-network:
    driver: bridge

volumes:
  reports:
    driver: local
  logs:
    driver: local
EOF
    
    log_success "docker-compose.yml created"
}

# Pull latest images
pull_images() {
    if [ "$NO_PULL" = true ]; then
        log_info "Skipping image pull (--no-pull specified)"
        return
    fi
    
    log_info "Pulling latest images..."
    docker pull "$BACKEND_IMAGE"
    docker pull "$FRONTEND_IMAGE"
    log_success "Images pulled successfully"
}

# Deploy application
deploy() {
    log_info "Deploying LLVM Obfuscator..."
    
    # Create deployment directory
    mkdir -p "$DEPLOY_DIR"
    cd "$DEPLOY_DIR"
    
    # Create necessary directories
    mkdir -p reports logs
    
    # Create docker-compose.yml
    create_compose_file
    
    # Pull latest images
    pull_images
    
    # Start services
    docker-compose up -d
    
    log_success "Deployment completed successfully!"
    log_info "Services are starting up..."
    
    # Wait for services to be healthy
    sleep 30
    check_health
}

# Update application
update() {
    log_info "Updating LLVM Obfuscator..."
    
    # Pull latest images
    pull_images
    
    # Restart services
    docker-compose up -d --force-recreate
    
    log_success "Update completed successfully!"
    check_health
}

# Stop services
stop_services() {
    log_info "Stopping services..."
    docker-compose down
    log_success "Services stopped"
}

# Restart services
restart_services() {
    log_info "Restarting services..."
    docker-compose restart
    log_success "Services restarted"
    check_health
}

# Show logs
show_logs() {
    if [ "$VERBOSE" = true ]; then
        docker-compose logs -f
    else
        docker-compose logs --tail=100
    fi
}

# Show status
show_status() {
    log_info "Service Status:"
    docker-compose ps
}

# Check health
check_health() {
    log_info "Checking service health..."
    
    # Check backend health
    if curl -fsS http://localhost:8000/api/health &> /dev/null; then
        log_success "Backend is healthy"
    else
        log_warning "Backend health check failed"
    fi
    
    # Check frontend health
    if curl -fsS http://localhost/ &> /dev/null; then
        log_success "Frontend is healthy"
    else
        log_warning "Frontend health check failed"
    fi
    
    # Show service status
    show_status
}

# Cleanup unused resources
cleanup() {
    if [ "$FORCE" != true ]; then
        log_warning "This will remove unused Docker images and containers."
        read -p "Are you sure? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_info "Cleanup cancelled"
            return
        fi
    fi
    
    log_info "Cleaning up unused Docker resources..."
    
    # Remove unused containers
    docker container prune -f
    
    # Remove unused images
    docker image prune -f
    
    # Remove unused volumes
    docker volume prune -f
    
    # Remove unused networks
    docker network prune -f
    
    log_success "Cleanup completed"
}

# Parse command line arguments
VERBOSE=false
FORCE=false
NO_PULL=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        --no-pull)
            NO_PULL=true
            shift
            ;;
        --username)
            DOCKERHUB_USERNAME="$2"
            BACKEND_IMAGE="${DOCKERHUB_USERNAME}/llvm-obfuscator-backend:latest"
            FRONTEND_IMAGE="${DOCKERHUB_USERNAME}/llvm-obfuscator-frontend:latest"
            shift 2
            ;;
        --dir)
            DEPLOY_DIR="$2"
            shift 2
            ;;
        deploy|update|stop|restart|logs|status|health|cleanup)
            COMMAND="$1"
            shift
            ;;
        *)
            log_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Execute command
case $COMMAND in
    deploy)
        check_prerequisites
        deploy
        ;;
    update)
        check_prerequisites
        update
        ;;
    stop)
        stop_services
        ;;
    restart)
        restart_services
        ;;
    logs)
        show_logs
        ;;
    status)
        show_status
        ;;
    health)
        check_health
        ;;
    cleanup)
        cleanup
        ;;
    *)
        log_error "No command specified"
        show_help
        exit 1
        ;;
esac


