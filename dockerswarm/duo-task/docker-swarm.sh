docker login

docker swarm init
docker swarm join --token ....

docker network create --driver overlay duo-swarm-network
docker build -t ahsansabir30/swarm-app .
docker push ahsansabir30/swarm-app

docker service create --name flask-app --replicas 10 --network duo-swarm-network ahsansabir30/swarm-app
docker service create --name nginx --replicas 2 --network duo-swarm-network --publish 80:80 --mount type=bind,source=$(pwd)/nginx.conf,target=/etc/nginx/nginx.conf nginx:latest