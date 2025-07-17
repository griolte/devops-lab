# DevOps Lab – griolte

[![CI for Backup Script](https://github.com/griolte/devops-lab/actions/workflows/ci-backup.yml/badge.svg)](https://github.com/griolte/devops-lab/actions)

This repository showcases a professional DevOps environment built from scratch.  
It includes automation, containerization, CI/CD, monitoring, and clean infrastructure.

---

## 💡 Features

- ✅ Bash script automation (backup service)  
- ✅ Docker & Docker Compose  
- ✅ Python-based monitoring API  
- ✅ GitHub Actions for CI/CD  
- ✅ Reverse proxy with NGINX  
- ✅ Clean project structure with documentation  

---

## 📁 Project Structure

```
devops-lab/
├── backup-script/        # Bash container: backup.sh + Dockerfile
├── python-monitor/       # Flask API + backup checker + Dockerfile
├── nginx-gateway/        # NGINX reverse proxy
├── data/                 # Source files to backup
├── backups/              # Shared volume for backups
├── docker-compose.yml    # Orchestrates everything
└── README.md
```

---

## 🚀 Setup

### 1. Clone the repository

```bash
git clone https://github.com/griolte/devops-lab.git
cd devops-lab
```

### 2. Launch all services

```bash
docker compose up -d --build
```

### 3. Simulate a backup manually (for testing)

```bash
touch backups/backup-$(date +%F).tar.gz
```

### 4. Access the monitoring API

- Via NGINX: [http://localhost/status](http://localhost/status)
- Or directly (optional): [http://localhost:5000/status](http://localhost:5000/status)

---

## 🔧 Services Overview

### 🟩 `bash-backup/`

- Based on Alpine
- Runs `backup.sh` that compresses `/data` into timestamped `.tar.gz` under `/backup`
- Automatically tested via GitHub Actions

### 🟦 `python-monitor/`

- Flask API with `/status`
- Checks if a backup `.tar.gz` exists for today
- Mounts `backups/` as shared volume
- Unit tested with `pytest`

### 🟨 `nginx-gateway/`

- Reverse proxy to route `/status` to `python-monitor`
- Easy to extend for other services later

---

## 📸 Screenshots

Add these to a folder like `captures/`:

- ✅ API OK:  
  ![OK](./captures/status-ok.png)

- ❌ API Error (no backup):  
  ![ERROR](./captures/status-error.png)

---

## ✅ DevOps Topics Covered

- [x] Dockerfiles (Python, Bash, NGINX)
- [x] Docker Compose orchestration
- [x] Volume sharing between containers
- [x] CI/CD with GitHub Actions
- [x] API-based monitoring
- [x] Reverse proxy configuration
- [x] Project structure & documentation

---

## 🛠️ To Do Next

- [ ] Add a basic HTML dashboard
- [ ] Push images to Docker Hub
- [ ] CI for `python-monitor`
- [ ] Add backup rotation / cleanup
- [ ] Optional: Kubernetes & Terraform deployment

---

## 👤 Author

**griolte**  
[github.com/griolte](https://github.com/griolte)

