# .NET Docker Configuration

This repository contains a sample .NET application configured to run in a Docker container. This setup can be applied in any Docker environment to facilitate easy development and deployment.

## Introduction

This project demonstrates how to set up a .NET application and containerize it using Docker. The goal is to provide a robust and scalable development and deployment environment.

## Prerequisites

Before you begin, ensure you have Docker installed on your system:

- [Docker](https://www.docker.com/get-started)

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/mabedd/.NET-Docker.git
   cd .NET-Docker
   ```

2. **Build the Docker Image:**

   ```bash
   docker build -t .net-docker .
   ```

3. **Run the Container:**

   ```bash
   docker run -p 8080:5000 net-docker
   ```

4. **Stop the Container:**
   ```bash
   docker stop net-docker
   ```

<div align="center">
  <p>Made with ❤️ by Mohammed</p>
</div>
