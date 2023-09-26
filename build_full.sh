
 docker network create --subnet=172.18.0.0/24 postgres-backend

 docker volume create --name=pgdata
 
 docker-compose -f ./dcompose-consul.yml up --detach

 docker build -t patroni:pg14 .

 docker-compose -f dcompose-patroni.yml up -d patroni1
 
 sleep 5
 
 docker-compose -f dcompose-patroni.yml up -d patroni2 
 
# docker-compose -f ./dcompose-patroni.yml  logs --follow