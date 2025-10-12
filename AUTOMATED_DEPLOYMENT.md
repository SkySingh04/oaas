# Automated Deployment Guide

This guide covers two approaches for deploying your LLVM Obfuscator to an SSH server:

1. **Automated SSH Deployment** - GitHub Actions automatically deploys to your server
2. **Docker Hub Deployment** - Build images on Docker Hub, deploy manually via SSH

## Option 1: Automated SSH Deployment

### Setup Required Secrets

In your GitHub repository, go to Settings → Secrets and variables → Actions, and add:

```
SSH_HOST=your-server-ip-or-domain
SSH_USERNAME=your-ssh-username
SSH_PRIVATE_KEY=your-private-ssh-key
SSH_PORT=22 (optional, defaults to 22)
```

### How it Works

1. **Trigger**: Push to `main` branch or manual workflow dispatch
2. **Build**: GitHub Actions builds Docker images with your custom LLVM toolchain
3. **Push**: Images are pushed to GitHub Container Registry
4. **Deploy**: GitHub Actions SSH into your server and:
   - Pulls the latest images
   - Creates docker-compose.yml
   - Stops old containers
   - Starts new containers
   - Runs health checks
   - Cleans up old images

### Benefits
- ✅ Fully automated
- ✅ No manual intervention needed
- ✅ Automatic health checks
- ✅ Rollback capability
- ✅ Environment-specific deployments

## Option 2: Docker Hub Deployment

### Setup Required Secrets

In your GitHub repository, go to Settings → Secrets and variables → Actions, and add:

```
DOCKERHUB_USERNAME=your-dockerhub-username
DOCKERHUB_TOKEN=your-dockerhub-access-token
```

### How it Works

1. **Trigger**: Push to `main` branch or manual workflow dispatch
2. **Build**: GitHub Actions builds Docker images
3. **Push**: Images are pushed to Docker Hub
4. **Deploy**: You manually SSH into your server and run the deployment script

### Server-Side Deployment

1. **SSH into your server**:
   ```bash
   ssh your-username@your-server-ip
   ```

2. **Download the deployment script**:
   ```bash
   # Option A: Download from GitHub Actions artifacts
   # (After a successful workflow run, download the artifact)
   
   # Option B: Create the script manually
   curl -o server-deploy.sh https://raw.githubusercontent.com/your-org/your-repo/main/server-deploy.sh
   chmod +x server-deploy.sh
   ```

3. **Set your Docker Hub username**:
   ```bash
   export DOCKERHUB_USERNAME=your-dockerhub-username
   ```

4. **Deploy**:
   ```bash
   ./server-deploy.sh deploy
   ```

### Benefits
- ✅ Uses public Docker Hub (easier access)
- ✅ Manual control over deployment timing
- ✅ Can be used on any server with Docker
- ✅ No need to configure SSH keys in GitHub

## Comparison

| Feature | SSH Deployment | Docker Hub Deployment |
|---------|---------------|----------------------|
| **Automation** | Fully automated | Semi-automated |
| **Setup Complexity** | Medium (SSH keys) | Low (Docker Hub) |
| **Deployment Speed** | Fast (automatic) | Medium (manual trigger) |
| **Control** | Limited | Full control |
| **Rollback** | Automatic | Manual |
| **Server Access** | Requires SSH access | Requires SSH access |

## Quick Start Commands

### For SSH Deployment:
```bash
# Just push to main branch - deployment happens automatically!
git push origin main
```

### For Docker Hub Deployment:
```bash
# 1. Push to trigger image build
git push origin main

# 2. SSH to server and deploy
ssh your-server
export DOCKERHUB_USERNAME=your-username
./server-deploy.sh deploy
```

## Server Requirements

Your SSH server needs:

- **Docker** installed and running
- **Docker Compose** installed
- **curl** for health checks
- **Internet access** to pull images
- **Port 80** available for the frontend

### Installing Docker on Ubuntu/Debian:
```bash
# Update package index
sudo apt-get update

# Install Docker
sudo apt-get install -y docker.io docker-compose

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group (optional)
sudo usermod -aG docker $USER
```

## Monitoring and Management

### Check Status:
```bash
./server-deploy.sh status
```

### View Logs:
```bash
./server-deploy.sh logs
```

### Health Check:
```bash
./server-deploy.sh health
```

### Update to Latest:
```bash
./server-deploy.sh update
```

### Stop Services:
```bash
./server-deploy.sh stop
```

## Troubleshooting

### Common Issues:

1. **SSH Connection Failed**:
   - Check SSH_HOST, SSH_USERNAME, SSH_PRIVATE_KEY secrets
   - Verify SSH key has proper permissions
   - Test SSH connection manually

2. **Docker Images Not Found**:
   - Check DOCKERHUB_USERNAME secret
   - Verify images exist on Docker Hub
   - Check network connectivity

3. **Health Checks Failing**:
   - Check if ports 80 and 8000 are available
   - Verify containers are running: `docker ps`
   - Check logs: `docker-compose logs`

4. **Permission Issues**:
   - Ensure user has Docker permissions
   - Check file permissions on deployment directory

### Debug Commands:

```bash
# Check Docker status
sudo systemctl status docker

# Check running containers
docker ps

# Check container logs
docker logs llvm-obfuscator-backend
docker logs llvm-obfuscator-frontend

# Check network connectivity
curl -I http://localhost:8000/api/health
curl -I http://localhost/
```

## Security Considerations

1. **SSH Keys**: Use dedicated deployment keys with limited permissions
2. **Docker Hub**: Use access tokens instead of passwords
3. **Firewall**: Configure firewall to only allow necessary ports
4. **Updates**: Regularly update Docker images and base system
5. **Monitoring**: Set up monitoring and alerting for service health

## Advanced Configuration

### Environment Variables:
```bash
# Custom deployment directory
export DEPLOY_DIR=/opt/llvm-obfuscator

# Custom Docker Hub username
export DOCKERHUB_USERNAME=your-username

# Disable authentication (development only)
export OBFUSCATOR_DISABLE_AUTH=true
```

### Custom Ports:
Edit the docker-compose.yml to use different ports:
```yaml
frontend:
  ports:
    - "8080:80"  # Use port 8080 instead of 80
```

### SSL/HTTPS:
Add nginx reverse proxy with SSL certificates for production deployments.

