docker login

docker swarm init
docker swarm join --token ....

docker network create --driver overlay swarm-network

docker build -t ahsansabir30/noise ./noise
docker push ahsansabir30/noise

docker build -t ahsansabir30/animal ./animal
docker push ahsansabir30/animal

docker service create --name noise --replicas 2 --publish 9000:9000 --network swarm-network ahsansabir30/noise
docker service create --name animal --replicas 2 --publish 9001:9001 --network swarm-network ahsansabir30/animal
