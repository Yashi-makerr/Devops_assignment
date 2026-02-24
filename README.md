#Set up and the deployment instruction
first part
#Development Phase (Local Setup)
Structure:
backend/        → Node + Express API
frontend/       → Angular app
nginx.conf      → Reverse proxy config
nginx.Dockerfile
docker-compose.yml

Local Flow:

Backend connects to MongoDB
Angular frontend calls backend APIs
Nginx serves Angular build
Docker Compose runs:
Mongo container
Backend container
Nginx container

Request Flow (Locally & Production Same)
User Browser
     ↓
Port 80
     ↓
Nginx Container
     ↓
Backend Container (Express)
     ↓
MongoDB Container

second part
#Containerization Structure
Backend Dockerfile

Uses Node image
Installs dependencies
Exposes backend port

Angular Build Step

npm run build --configuration production
Generates optimized dist/ folder

Nginx Dockerfile

Uses nginx:alpine
Copies Angular dist to /usr/share/nginx/html
Copies nginx.conf
Handles reverse proxy to backend

Third Part
#Docker Compose (Production Version on Azure)
We pull Pulls images,runs containers,so actually we does not need source code

fourth part
#CI/CD Pipeline Flow
CI Phase

GitHub Actions:
Checkout repository
Login to Docker Hub
Build backend image
Build Angular app
Build nginx image
Push images to Docker Hub

CD phase
SSH into Azure VM
Run:
docker compose pull
docker compose up -d
VM pulls latest images
Containers restart automatically
Fully automated deployment.
No manual login required.

final part 
#Final Production Architecture
GitHub Repo
     ↓ push
GitHub Actions
     ↓
Docker Hub
     ↓
Azure VM
     ↓
Docker Compose
     ↓
Nginx (Port 80)
     ↓
Backend API
     ↓
MongoDB

Screenshots

CI/CD Configuration-.github/workflows/docker.yml
<img width="1419" height="977" alt="image" src="https://github.com/user-attachments/assets/49407412-6258-489a-89d7-eda883382978" />

CI/CD Execution
<img width="1908" height="967" alt="image" src="https://github.com/user-attachments/assets/91869f9e-6b42-43a6-88ed-644805b486a5" />

Docker Hub Images Page
<img width="1907" height="970" alt="image" src="https://github.com/user-attachments/assets/03f982d6-99e5-4ae0-8e66-9efc6e8f39a3" />

Azure VM Running Containers
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6a936007-4cfb-41d2-ba07-0449fd1d8217" />

Application Working on Browser
<img width="1915" height="980" alt="image" src="https://github.com/user-attachments/assets/2fa07e32-4c2a-4518-8130-5a2cd98f9e20" />

Nginx Reverse Proxy Proof
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/aa84a805-59cf-443c-a174-a570fce439f6" />


