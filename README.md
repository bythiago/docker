systemctl start docker

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 666 /var/run/docker.sock


docker run -d -v "$(pwd)/website":/usr/share/nginx/html -p 8888:80 --rm --name ngix-container nginx
docker container exec -it ngix-container /bin/sh


/usr/share/nginx/html/

--https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes-pt
--https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose-pt