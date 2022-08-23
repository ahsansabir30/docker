docker login

docker swarm init
docker swarm join --token ....

docker network create --driver overlay trio-swarm-network

docker build -t ahsansabir30/flask-app ./flask-app
docker push ahsansabir30/flask-app

docker build -t ahsansabir30/mysql ./db
docker push ahsansabir30/mysql

docker service create --name flask-app --replicas 10 --network trio-swarm-network ahsansabir30/flask-app
docker service create --name mysql --replicas 1 --network trio-swarm-network ahsansabir30/mysql
docker service create --name nginx --network trio-swarm-network --publish 80:80 --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf nginx:latest

