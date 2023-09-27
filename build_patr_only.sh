


# docker-compose -f dcompose-consul.yml down -v
# docker-compose -f dcompose-patroni.yml down -v

docker-compose -f dcompose-patroni.yml down 

# docker build  --network=host -t patroni:pg14 .

# docker-compose -f dcompose-consul.yml up --detach 

sleep 5 
docker-compose -f dcompose-patroni.yml up -d patroni1
 
# sleep 5
 
# docker-compose -f dcompose-patroni.yml up -d patroni2 
 
#docker-compose -f ./dcompose-patroni.yml  logs --follow
