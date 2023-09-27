


# docker-compose -f dcompose-consul.yml down -v
# docker-compose -f dcompose-patroni.yml down -v

docker-compose -f dcompose-patroni.yml down -v 

docker build -t patroni:pg14 .

docker exec  -it patroni_setup-consul-1 consul kv delete /service/cluster_1/initialize

rm -rf /var/lib/docker/volumes/pgdata/_data/pgdata_n1/*
rm -rf /var/lib/docker/volumes/pgdata/_data/pgdata_n2/*

sleep 5

docker-compose -f dcompose-patroni.yml up -d patroni1
 
# sleep 5
 
# docker-compose -f dcompose-patroni.yml up -d patroni2 
 
docker-compose -f ./dcompose-patroni.yml  logs --follow