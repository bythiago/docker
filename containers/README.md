-- sudo systemctl start docker
-- sudo systemctl enable docker

--sudo groupadd docker
--sudo usermod -aG docker $USER
--newgrp docker
--sudo chmod 777 /var/run/docker.sock


--docker run -d -v "$(pwd)/website":/usr/share/nginx/html -p 8888:80 --rm --name ngix-container nginx
--docker container exec -it ngix-container bash

--docker-compose up -d

--https://manjaro.site/how-to-install-docker-on-manjaro-18-0/
--https://stackoverflow.com/questions/52310471/running-docker-compose-in-a-dockerfile
--https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes-pt
--https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose-pt
git remote add origin git@github.com:bythiago/docker.git
--https://stackoverflow.com/questions/29480099/docker-compose-vs-dockerfile-which-is-better
--https://github.com/programadorabordo/docker-introducao

docker rmi $(docker images -q)
docker rm -f $(docker ps -a -q)