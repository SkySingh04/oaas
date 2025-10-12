# Docker Deployment Guide

This guide explains how to deploy the LLVM Obfuscator using Docker containers with custom LLVM toolchain and obfuscation passes.

## Architecture Overview

The deployment consists of two main services:

1. **Backend Service** (`pb-obfuscator-backend`):
   - Python FastAPI application
   - Custom LLVM toolchain with obfuscation passes
   - Handles code obfuscation requests
   - Runs on port 8000

2. **Frontend Service** (`pb-obfuscator-frontend`):
   - React/Vite application served by Nginx
   - Web interface for the obfuscator
   - Proxies API requests to backend
   - Runs on port 80

## Custom LLVM Toolchain

The backend includes a custom LLVM toolchain with:

- **Custom clang compiler**: Modified version with obfuscation capabilities
- **Custom opt optimizer**: Includes obfuscation passes
- **LLVM Obfuscation Plugin**: Shared library with custom passes

### Plugin Structure

```
plugins/
├── linux-x86_64/          # Linux x86_64 binaries
│   ├── clang              # Custom clang compiler
│   ├── opt                # Custom opt optimizer
│   └── LLVMObfuscationPlugin.so  # Obfuscation plugin
└── darwin-arm64/          # macOS ARM64 binaries
    ├── opt                # Custom opt optimizer
    └── LLVMObfuscationPlugin.dylib  # Obfuscation plugin
```

## Docker Images

### Backend Image

The backend Dockerfile (`Dockerfile.backend.multiarch`) includes:

- Python 3.11 runtime
- System dependencies (build tools, LLVM)
- Custom LLVM toolchain installation
- Environment configuration for custom toolchain
- Health checks

### Frontend Image

The frontend Dockerfile (`Dockerfile.frontend`) includes:

- Node.js build environment
- Nginx runtime
- Built React application
- API proxy configuration

## GitHub Actions Workflow

The `.github/workflows/docker-build-and-push.yml` workflow:

1. **Triggers**: On push to main/develop branches and on version tags
2. **Multi-architecture builds**: Supports both x86_64 and ARM64
3. **Container Registry**: Pushes to GitHub Container Registry (ghcr.io)
4. **Caching**: Uses GitHub Actions cache for faster builds
5. **Deployment artifacts**: Generates production deployment files

### Workflow Features

- **Automatic tagging**: Based on branch names and semantic versions
- **Multi-platform support**: Builds for linux/amd64 and linux/arm64
- **Security**: Uses GitHub token for registry authentication
- **Deployment files**: Generates docker-compose.prod.yml and deployment scripts

## Deployment Options

### Option 1: Using Generated Deployment Files

After a successful GitHub Actions run, download the deployment artifacts:

```bash
# Download deployment files from GitHub Actions artifacts
# Extract to your server

# Set environment variables
export GITHUB_TOKEN=your_github_token
export GITHUB_USERNAME=your_username

# Run deployment
./deploy.sh
```

### Option 2: Manual Deployment

```bash
# Login to GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Pull latest images
docker pull ghcr.io/your-org/your-repo/backend:latest
docker pull ghcr.io/your-org/your-repo/frontend:latest

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: "3.9"

services:
  backend:
    image: ghcr.io/your-org/your-repo/backend:latest
    environment:
      - OBFUSCATOR_DISABLE_AUTH=false
    volumes:
      - ./reports:/app/reports
    expose:
      - "8000"
    restart: unless-stopped

  frontend:
    image: ghcr.io/your-org/your-repo/frontend:latest
    ports:
      - "80:80"
    depends_on:
      - backend
    restart: unless-stopped
EOF

# Start services
docker-compose up -d
```

### Option 3: Development Deployment

For local development:

```bash
# Build and run locally
docker-compose up --build
```

## Environment Configuration

### Backend Environment Variables

- `OBFUSCATOR_DISABLE_AUTH`: Set to `false` for production (default: `true`)
- `PYTHONDONTWRITEBYTECODE`: Prevents Python from writing .pyc files
- `PYTHONUNBUFFERED`: Ensures Python output is sent straight to terminal

### Custom LLVM Toolchain Environment

The Docker container automatically configures:

- `PATH`: Includes `/usr/local/llvm-obfuscator/bin`
- `LD_LIBRARY_PATH`: Includes `/usr/local/llvm-obfuscator/lib`

## Monitoring and Health Checks

### Health Checks

- **Backend**: HTTP GET to `/api/health`
- **Frontend**: Nginx default health check

### Logs

```bash
# View all logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f backend
docker-compose logs -f frontend
```

### Monitoring

```bash
# Check service status
docker-compose ps

# Check resource usage
docker stats
```

## Troubleshooting

### Common Issues

1. **Custom LLVM binaries not found**:
   - Verify plugin files exist in `plugins/linux-x86_64/`
   - Check file permissions (should be executable)

2. **Plugin loading errors**:
   - Verify `LD_LIBRARY_PATH` includes plugin directory
   - Check plugin dependencies

3. **Build failures**:
   - Ensure all required system dependencies are installed
   - Check Docker build context includes all necessary files

### Debug Commands

```bash
# Check custom toolchain installation
docker exec -it <backend-container> /usr/local/llvm-obfuscator/bin/clang --version
docker exec -it <backend-container> /usr/local/llvm-obfuscator/bin/opt --version

# Check plugin availability
docker exec -it <backend-container> ls -la /usr/local/llvm-obfuscator/lib/

# Test obfuscation functionality
docker exec -it <backend-container> python -c "from core.obfuscator import LLVMObfuscator; print('Obfuscator loaded successfully')"
```

## Security Considerations

1. **Authentication**: Enable authentication in production (`OBFUSCATOR_DISABLE_AUTH=false`)
2. **Network**: Use reverse proxy (nginx/traefik) for SSL termination
3. **Secrets**: Store sensitive data in Docker secrets or environment files
4. **Updates**: Regularly update base images and dependencies

## Scaling

For production scaling:

1. **Load Balancing**: Use multiple backend instances behind a load balancer
2. **Database**: Add persistent storage for reports and user data
3. **Caching**: Implement Redis for session management and caching
4. **Monitoring**: Add Prometheus/Grafana for metrics and alerting

