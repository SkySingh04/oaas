#!/bin/bash

# LLVM Obfuscator Deployment Script
# This script handles the deployment of the LLVM Obfuscator Docker containers

set -e

# Configuration
REGISTRY="ghcr.io"
REPOSITORY="${GITHUB_REPOSITORY:-your-org/your-repo}"
BACKEND_IMAGE="${REGISTRY}/${REPOSITORY}/backend"
FRONTEND_IMAGE="${REGISTRY}/${REPOSITORY}/frontend"
COMPOSE_FILE="docker-compose.prod.yml"

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
LLVM Obfuscator Deployment Script

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
    --env-file      Use custom environment file

Environment Variables:
    GITHUB_TOKEN    GitHub token for container registry access
    GITHUB_USERNAME GitHub username for container registry access
    GITHUB_REPOSITORY GitHub repository (org/repo format)

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
    
    # Check if GitHub token is provided
    if [ -z "$GITHUB_TOKEN" ]; then
        log_error "GITHUB_TOKEN environment variable is not set."
        log_info "Please set your GitHub token: export GITHUB_TOKEN=your_token"
        exit 1
    fi
    
    # Check if GitHub username is provided
    if [ -z "$GITHUB_USERNAME" ]; then
        log_error "GITHUB_USERNAME environment variable is not set."
        log_info "Please set your GitHub username: export GITHUB_USERNAME=your_username"
        exit 1
    fi
    
    log_success "Prerequisites check passed"
}

# Login to GitHub Container Registry
login_to_registry() {
    log_info "Logging in to GitHub Container Registry..."
    echo "$GITHUB_TOKEN" | docker login "$REGISTRY" -u "$GITHUB_USERNAME" --password-stdin
    log_success "Successfully logged in to $REGISTRY"
}

# Pull latest images
pull_images() {
    if [ "$NO_PULL" = true ]; then
        log_info "Skipping image pull (--no-pull specified)"
        return
    fi
    
    log_info "Pulling latest images..."
    docker pull "${BACKEND_IMAGE}:latest"
    docker pull "${FRONTEND_IMAGE}:latest"
    log_success "Images pulled successfully"
}

# Deploy application
deploy() {
    log_info "Deploying LLVM Obfuscator..."
    
    # Create necessary directories
    mkdir -p reports logs nginx/ssl
    
    # Set environment variables for docker-compose
    export GITHUB_REPOSITORY="$REPOSITORY"
    
    # Start services
    docker-compose -f "$COMPOSE_FILE" up -d
    
    log_success "Deployment completed successfully!"
    log_info "Services are starting up..."
    
    # Wait for services to be healthy
    sleep 10
    check_health
}

# Update application
update() {
    log_info "Updating LLVM Obfuscator..."
    
    # Pull latest images
    pull_images
    
    # Restart services
    docker-compose -f "$COMPOSE_FILE" up -d --force-recreate
    
    log_success "Update completed successfully!"
    check_health
}

# Stop services
stop_services() {
    log_info "Stopping services..."
    docker-compose -f "$COMPOSE_FILE" down
    log_success "Services stopped"
}

# Restart services
restart_services() {
    log_info "Restarting services..."
    docker-compose -f "$COMPOSE_FILE" restart
    log_success "Services restarted"
    check_health
}

# Show logs
show_logs() {
    if [ "$VERBOSE" = true ]; then
        docker-compose -f "$COMPOSE_FILE" logs -f
    else
        docker-compose -f "$COMPOSE_FILE" logs --tail=100
    fi
}

# Show status
show_status() {
    log_info "Service Status:"
    docker-compose -f "$COMPOSE_FILE" ps
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
        --env-file)
            ENV_FILE="$2"
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

# Load environment file if specified
if [ -n "$ENV_FILE" ]; then
    log_info "Loading environment file: $ENV_FILE"
    source "$ENV_FILE"
fi

# Execute command
case $COMMAND in
    deploy)
        check_prerequisites
        login_to_registry
        deploy
        ;;
    update)
        check_prerequisites
        login_to_registry
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

