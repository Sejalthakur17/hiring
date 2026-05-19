# Alchemyst AI — DevOps Internship Assignment

## Overview

This project implements a distributed AI-style inference infrastructure on AWS using Terraform, Docker, FastAPI, and private cloud networking.

The architecture follows production-style DevOps practices including:

- Public API Gateway Server
- Private Worker Nodes
- Internal RPC communication
- Infrastructure as Code using Terraform
- Dockerized services
- Secure VPC networking

---

# Architecture

## High-Level Design

```text
                    Internet
                        |
                 Public API Server
                  (FastAPI / Docker)
                        |
        -----------------------------------
        |                |                |
     Worker-1         Worker-2         Worker-3
   (Private VM)     (Private VM)     (Private VM)
```

---

# Infrastructure Components

| Component | Purpose |
|---|---|
| AWS VPC | Private cloud network |
| Public Subnet | Hosts API server |
| Private Subnet | Hosts worker nodes |
| Internet Gateway | Public internet access |
| NAT Gateway | Outbound internet for workers |
| Security Groups | Restrict network traffic |
| EC2 Instances | Compute servers |
| Docker | Containerized deployment |
| Terraform | Infrastructure automation |

---

# Tech Stack

| Category | Technology |
|---|---|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| API Framework | FastAPI |
| Containerization | Docker |
| Operating System | Ubuntu 22.04 |
| Internal Communication | HTTP-based RPC |
| Language | Python 3.11 |

---

# Project Structure

```text
alchemyst-devops/
├── terraform/
│   ├── provider.tf
│   ├── vpc.tf
│   ├── security.tf
│   ├── ec2.tf
│   ├── outputs.tf
│   └── variables.tf
│
├── api/
│   ├── main.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── worker/
│   ├── main.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── scripts/
│   ├── install_api.sh
│   └── install_worker.sh
│
└── README.md
```

---

# Networking Design

## Public API Server

The API server:
- Resides inside the public subnet
- Has a public IP address
- Exposes `/infer` endpoint
- Receives internet traffic

Allowed inbound ports:
- 22 (SSH)
- 8000 (FastAPI)

---

## Private Worker Nodes

Worker nodes:
- Reside inside private subnet
- Have NO public IP addresses
- Only accessible internally
- Process inference requests

Allowed inbound traffic:
- Port 9000 from API security group only

This ensures secure internal communication.

---

# Deployment Steps

## 1. Clone Repository

```bash
git clone <repository-url>
cd alchemyst-devops
```

---

## 2. Configure AWS CLI

```bash
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- Region (`ap-south-1`)

---

## 3. Initialize Terraform

```bash
cd terraform
terraform init
```

---

## 4. Validate Terraform

```bash
terraform validate
```

---

## 5. Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform provisions:
- VPC
- Public subnet
- Private subnet
- NAT Gateway
- Security Groups
- EC2 Instances

---

# Deploy Worker Services

## SSH into Worker VM

```bash
ssh -i alchemyst-key.pem ubuntu@<worker-private-ip>
```

---

## Build Docker Image

```bash
docker build -t worker .
```

---

## Run Worker Container

```bash
docker run -d -p 9000:9000 worker
```

Repeat on all worker nodes.

---

# Deploy API Service

## SSH into API Server

```bash
ssh -i alchemyst-key.pem ubuntu@<public-ip>
```

---

## Build API Docker Image

```bash
docker build -t api .
```

---

## Run API Container

```bash
docker run -d -p 8000:8000 api
```

---

# API Endpoints

## Public Endpoint

### POST `/infer`

Example request:

```bash
curl -X POST http://<public-ip>:8000/infer
```

Example response:

```json
{
  "result": "processed by worker"
}
```

---

# Internal RPC Communication

The API server communicates with worker nodes using internal private IPs:

```text
10.0.2.x:9000
```

This communication never traverses the public internet.

---

# Security Design

## Implemented Security Measures

### Private Worker Isolation
- Workers have no public IPs

### Security Groups
- Workers only accept traffic from API server

### NAT Gateway
- Workers access internet outbound only

### Public Exposure Limitation
- Only API server exposed publicly

---

# Scalability Design

This architecture can scale horizontally.

Possible production improvements:

| Component | Improvement |
|---|---|
| API Layer | Application Load Balancer |
| Worker Layer | Auto Scaling Group |
| Orchestration | Kubernetes / EKS |
| Queue System | RabbitMQ / Kafka |
| Monitoring | Prometheus + Grafana |
| Logging | CloudWatch |
| Secrets | AWS Secrets Manager |
| HTTPS | ACM + Load Balancer |
| CI/CD | GitHub Actions |

---

# Monitoring & Observability (Future Improvements)

Potential additions:
- Prometheus
- Grafana dashboards
- CloudWatch metrics
- Centralized logging
- Distributed tracing

---

# CI/CD Improvements

Potential CI/CD pipeline:
- Terraform validation
- Docker image builds
- Automated deployments
- Security scanning
- Infrastructure drift detection

---

# Cleanup

Destroy infrastructure:

```bash
terraform destroy
```

---

# Key Learnings

This project demonstrates:
- AWS networking
- Infrastructure as Code
- Dockerized deployments
- Distributed systems basics
- Secure private networking
- Internal RPC communication
- DevOps automation practices

---

# Author

Sejal Thakur