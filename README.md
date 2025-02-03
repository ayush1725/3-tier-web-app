# Simple Notes App

Welcome to the **Simple Notes App**! This is a full-stack application built with **React** (Frontend) and **Django** (Backend), with **Docker containerization** added for easy deployment and management. This project is a great way to learn and explore various technologies like **Python**, **Django**, **MySQL**, **Docker**, and **Nginx**.

## Tech Stacks Used
- **Frontend**: React
- **Backend**: Django (Python)
- **Database**: MySQL
- **Containerization**: Docker
- **Reverse Proxy**: Nginx

## Why This Project?

I cloned this project for the purpose of learning and exploring various technologies, especially **Docker** and the tech stacks used in this project. My main goal was to understand how to containerize applications using **Docker**, and how to manage them effectively. Additionally, I integrated **Nginx** as a reverse proxy to make the app production-ready.

## Requirements
To run this app, you'll need the following installed:
1. **Python 3.9**
2. **Node.js**
3. **React**
4. **Docker**
5. **Docker Compose** (Recommended for an easier setup)

## Installation Steps

### 1. Clone the Repository
First, clone the repository to your local machine by running:
```bash
git clone https://github.com/LondheShubham153/django-notes-app.git
```
### 2. Build the App with Docker
After cloning the repository, build the app using Docker with the following command:
```bash
docker build -t notes-app .
```
This will create a Docker image named ```notes-app```.
### 3. Run the App Using Docker
Once the build process is complete, you can run the app inside a container using the command:
```bash
docker run -d -p 8000:8000 notes-app:latest
```
This command will run the app on port ```8000```, and you can access it in your browser at ```http://localhost:8000```.

## Nginx Setup (Optional)
To make the app production-ready, we can use Nginx as a reverse proxy. Follow these steps to install and configure Nginx:
### Install Nginx
Install Nginx on your system using the following commands:
```bash
sudo apt-get update
sudo apt install nginx
```
Once Nginx is installed, configure it to serve your app as a reverse proxy by adjusting its configuration file.
## Docker Compose (Recommended)
For a more streamlined setup, you can use Docker Compose to manage the app and MySQL database in one go.
### 1. Create a ```docker-compose.yml``` File
Here's a basic ```docker-compose.yml``` file that will set up the entire application, including the frontend, backend, database, and Nginx reverse proxy:
```bash
version: '3.8'

services:
  db:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: notesapp
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - notes-app-network

  backend:
    build: .
    command: python manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/app
    ports:
      - "8000:8000"
    depends_on:
      - db
    networks:
      - notes-app-network

  frontend:
    build:
      context: ./frontend
    ports:
      - "3000:3000"
    networks:
      - notes-app-network

  nginx:
    image: nginx:latest
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - "80:80"
    depends_on:
      - backend
    networks:
      - notes-app-network

networks:
  notes-app-network:
    driver: bridge

volumes:
  db_data:
```
### 2. Run the App Using Docker Compose
Once you have your ```docker-compose.yml``` file set up, you can start the app and all its services with a single command:
```bash
docker-compose up --build
```
This will build and start all the necessary services (backend, frontend, MySQL, and Nginx) in one go. The app will be available at ```http://localhost/```, with Nginx handling the reverse proxy.

## Conclusion
This Simple Notes App is an excellent project for learning how to work with React, Django, MySQL, and Docker. By containerizing the app with Docker, it becomes much easier to deploy and manage the app in various environments. Using Docker Compose simplifies the process even further, and Nginx can be added as a reverse proxy for production-ready deployments.
