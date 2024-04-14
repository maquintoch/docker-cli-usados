# docker-cli-usados
## Docker most used commands that will do your live easier ! 

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker system prune
docker system prune -a

docker build -t dataopstest .
docker run -it dataopstest /bin/bash
docker exec -it dataopstest /bin/bash
docker ps -a
docker exec -it dataopstest
sudo docker compose up -f docker-compose.yaml # For specifying the docker compose file to run.
systemctl status docker # Status of Docker (running)
systemctl daemon-reload
systemctl restart docker


####

Execute docker interactiv and tt terminal.It gives access to the terminal and interact within.

####

Other docker commands that can help:
docker compose up --build pgbouncer -d
docker logs -f pgbouncer

#### Troubleshootig:
docker network ls
docker network rm <network-ID>
docker network inspect <network-ID>
docker compose up --force-recreate # Recreate the network.
docker network prune
docker volume prune
docker system prune

%%%%
When any command before it doesn't work then do:
=====> sudo service docker restart <=======
systemctl enable docker
systemctl start docker
%%%%


### Checking Docker engine configuration
sudo systemctl daemon-reload


# Other useful docker commands ####

# tail logs:
sudo docker logs -f <container/Idcontainer>

# Today's logs:
sudo docker logs --since=$(dat -I)<container>

# Time limit logs
sudo docker logs --since=$(date -I)T08 --until=$(date -I)
T08:13 <container>

# Tail watchdog:
sudo docker exec <container> drush watchdog:tail

#Adm login:
sudo docker exec <container> drush -l w4.uib.no uli

# Clear cache:
sudo docker exec <container> drush cache:rebuild


###### Access the container ####################

# Shell access (bad practice, don't do this in prod)

docker exec -it <name> sh



#Get a hold on files from of the container
#If you need to fetch file(s) from the container, you can #copy them out.

docker exec <name>  tar c  /srcdir > /tmp/tarfile.tar
docker cp <name>:/srcdir/filename /targetdir/filename


#If you have mounted the original files into the container, #the files will appear in local git repo.

#Exporting taxonomies to keep all environments in sync
#In Drupal, taxonomies are treated as content, not configuration and is therefore by default not exported
and version controlled. To export taxonomies as well, we use drush the command provided by the contrib structure sync module.
If you create taxonomy terms meant for all environments, remember to both drush et and drush cex to export the taxonomies.
To import, use drush it, and the regular drush cim for the rest of the configuration.