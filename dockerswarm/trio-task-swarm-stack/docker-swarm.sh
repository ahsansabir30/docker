# 1) Build the image 
docker-compose build
# 2) Push images 
docker-compose push
# 3) Deploy using docker stack
docker stack deploy --compose-file docker-compose.yaml app