# 🐳 Docker Commands Reference Guide

---

## 📦 BUILD IMAGE

```bash
docker build -t my-simple-api:1.0 .
```
**What it does:** Builds a Docker image from your Dockerfile in the current directory

---

## ▶️ RUN CONTAINER

```bash
docker run -d --name wanchoo-con -p 5000:5000 flask-api:1.0
```

**Flags explained:**
- `-d` → Run in detached mode (background)
- `--name` → Give your container a name
- `-p 5000:5000` → Map port (host:container)

---

## 🧪 TEST API

```bash
curl http://localhost:5000
```

**Or open in browser:**
```
http://localhost:5000
```

---

## 🏷️ TAG FOR DOCKER HUB

```bash
docker tag vikaswanchoo/flask-api:latest vikaswanchoo/flask-api:latest
```

**Format:** `docker tag <local-image>:<tag> <username>/<repo>:<tag>`

---

## 🚀 LOGIN & PUSH TO HUB

```bash
docker login
```
Enter your Docker Hub username and password

```bash
docker push vikaswanchoo/flask-api:latest
```

---

## 📋 USEFUL COMMANDS

### List Images
```bash
docker images
```
Shows all images on your machine

### List Containers (Running)
```bash
docker ps
```
Shows only running containers

### List All Containers
```bash
docker ps -a
```
Shows running + stopped containers

### View Container Logs
```bash
docker logs api-container
```
Replace `api-container` with your container name

### View Real-time Logs
```bash
docker logs -f api-container
```
The `-f` flag follows logs in real-time (like `tail`)

### Stop Container
```bash
docker stop api-container
```
Gracefully stops a running container

### Start Container
```bash
docker start api-container
```
Starts a stopped container

### Delete Container
```bash
docker rm api-container
```
**Note:** Container must be stopped first

### Delete Image
```bash
docker rmi my-simple-api:1.0
```
Removes the image from your machine

### Inspect Container
```bash
docker inspect api-container
```
Shows detailed info about the container (ports, env vars, etc.)

### Execute Command in Container
```bash
docker exec -it api-container bash
```
Opens a bash shell inside the running container

### View Container Stats
```bash
docker stats api-container
```
Shows CPU, memory, network usage in real-time

### Remove All Unused Images
```bash
docker image prune
```
Cleans up dangling/unused images

---

## 🔄 COMPLETE WORKFLOW

```bash
# 1. Build
docker build -t my-simple-api:1.0 .

# 2. Run locally
docker run -d --name api-container -p 5000:5000 my-simple-api:1.0

# 3. Test
curl http://localhost:5000

# 4. View logs
docker logs api-container

# 5. Tag for Hub
docker tag my-simple-api:1.0 vikaswanchoo/my-simple-api:1.0

# 6. Login
docker login

# 7. Push to Hub
docker push vikaswanchoo/my-simple-api:1.0

# 8. Verify
# Visit: https://hub.docker.com/r/vikaswanchoo/my-simple-api
```

---

## 💡 QUICK TIPS

| Task | Command |
|------|---------|
| Check Docker version | `docker --version` |
| Get help on any command | `docker run --help` |
| Clean up everything unused | `docker system prune` |
| Stop all containers | `docker stop $(docker ps -q)` |
| Delete all containers | `docker rm $(docker ps -a -q)` |
| Delete all images | `docker rmi $(docker images -q)` |

---

## 🎯 COMMON PORTS

- **Flask/Python:** 5000
- **Node.js:** 3000
- **PostgreSQL:** 5432
- **MySQL:** 3306
- **Redis:** 6379
- **Nginx:** 80 (HTTP), 443 (HTTPS)
- **MongoDB:** 27017

---

**Print this guide and keep it handy! 📌**
