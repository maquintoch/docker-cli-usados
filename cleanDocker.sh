#!/bin/bash

#Display list of all Docker contaimers and images before dele#tion
echo "Before Deletion:"
docker ps -a
docker images

#Stop all running containers
docker stop $(docker ps -a -q)

#Remove all stopped containers
docker rm $(docker ps -a -q)

#Prune volumes not used by any container
docker volume prune -f

#Prune all unused images
docker image prune -a -f

# Prune Docker system(included stopped containers, networks,dangling images and optionally unused volumes
docker system prune -a -f
echo "After deletion"
docker ps -a
docker images
