# Inception

## Overview  
Inception is a completed system administration project demonstrating the design and deployment of a lightweight, containerized infrastructure using Docker. The project successfully isolates services into Docker containers, ensuring secure communication, persistence of data, and seamless networking between components.

---

## Achievements  
The project implemented:  
- **Containerization**: Services like NGINX, WordPress, and MariaDB were isolated in dedicated containers, ensuring modularity and ease of management.  
- **Security**: TLS encryption (TLSv1.2/1.3) was configured to secure all communications. Sensitive data was managed securely using environment variables.  
- **Networking**: A custom Docker network was created to facilitate secure and efficient service communication.  
- **Persistence**: Docker volumes were employed to ensure data remains intact across container lifecycles.  

---

## Directory Structure  
The project structure was organized for clarity and maintainability:  
project_root/   
├── Makefile   
├── srcs/   
│   ├── docker-compose.yml   
│   ├── .env   
│   ├── requirements/   
│       ├── nginx/   
│       │   ├── Dockerfile   
│       │   ├── conf/   
│       ├── mariadb/   
│       │   ├── Dockerfile   
│       │   ├── conf/   
│       └── wordpress/   
│           ├── Dockerfile   
│           ├── tools/   


### Makefile  
The Makefile automated the following tasks:  
- Building and starting the containers.  
- Cleaning up containers, images, and volumes for a fresh restart.  

### Environment Variables  
All sensitive configurations, such as database credentials and domain names, were managed in a `.env` file to ensure confidentiality.  

---

## Service Configuration  

### NGINX  
- Configured as the entry point for the infrastructure.  
- Listened on port 443 for HTTPS traffic with strict TLSv1.2/1.3 enforcement.  
- Reverse proxy settings ensured secure communication with WordPress.  

### WordPress  
- Hosted via `php-fpm` for optimized performance.  
- Connected to MariaDB for content management.  
- Persistent storage was configured to retain uploaded content and configuration changes.  

### MariaDB  
- Managed WordPress’s database operations.  
- Two user accounts were implemented:
  - **Admin**: For database management.  
  - **WordPress user**: With limited privileges for CMS functionality.  

---

## Networking and Data Persistence  

### Custom Network  
An isolated Docker network ensured secure and streamlined inter-service communication, reducing the risk of interference from external services.  

### Volumes  
Data persistence was achieved with mounted volumes:  
- **MariaDB**: To store database files.  
- **WordPress**: To retain website files.  

---

## Deployment Process  

1. **Cloning and Setup**: The repository was cloned onto the virtual machine, and a `.env` file was created with the following environment variables:  
#nginx   
NGINX_BUILD_PATH=requirements/nginx/   

#wordpress   
WORDPRESS_BUILD_PATH=requirements/wordpress/    
WORDPRESS_DB_HOST=mariadb-ctnr   
WORDPRESS_DB_NAME=wordpress-db   
WORDPRESS_DB_USER0=wpuser   
WORDPRESS_DB_USER1=wpuser1   
WORDPRESS_DB_PASSWORD=xxxxxx   

#mariadb   
MARIADB_BUILD_PATH=requirements/mariadb/   
SQL_DATABASE=wordpress-db   
SQL_USER=root   
SQL_PASSWORD=xxxxxx   

#misc   
HOST_WEB_VOL_PATH=/home/brandebr/data/wp   
HOST_DB_VOL_PATH=/home/brandebr/data/db   

2. **Container Initialization**:  
- Executed `make` to build and deploy the containers.  
- Verified services by accessing the website via `https://brandebr.42.fr`.  

---

## Challenges and Solutions  

- **TLS Certificate Configuration**: Proper paths and permissions were set in NGINX to enable HTTPS.  
- **Database Connectivity**: Ensured MariaDB credentials matched WordPress configuration for uninterrupted access.  
- **Persistent Storage**: Docker volumes were tested to validate data retention across container restarts.  

---

## Final Results  

The infrastructure was deployed successfully, achieving:  
- A fully functional WordPress site accessible over HTTPS.  
- Secure, isolated services communicating effectively within a custom Docker network.  
- Persistent data management for both the database and website files.  

This project showcases practical expertise in system administration, container orchestration, and secure deployment practices.  
