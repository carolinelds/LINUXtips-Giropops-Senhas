## How to run

### Without docker-compose (day-02)

Redis as a container, as required:

```
docker container run --name redis -p 6379:6379 -d redis:alpine
```

Save redis IP in variable:

```
export "REDIS_HOST=$(docker container inspect redis | jq -r '.[0].NetworkSettings.IPAddress')" 
```

Build app image:

```
docker image build -t carolinelds/linuxtips-giropops-senhas:1.0 --build-arg="REDIS_HOST=$REDIS_HOST" -f Dockerfile.day2 .
```

Run app container:

```
docker container run -d -p 5000:5000 --name giropops-senhas carolinelds/linuxtips-giropops-senhas:1.0
```

Check app in localhost:5000.


### Using distroless base image (day-03)

Redis as a container, as required:

```
docker container run --name redis -p 6379:6379 -d redis:alpine
```

Save redis IP in variable:

```
export "REDIS_HOST=$(docker container inspect redis | jq -r '.[0].NetworkSettings.IPAddress')" 
```

Build app image:

```
docker image build -t carolinelds/linuxtips-giropops-senhas:2.0 --build-arg="REDIS_HOST=$REDIS_HOST" -f Dockerfile.day3 .
```

Run app container:

```
docker container run -d -p 5000:5000 --name giropops-senhas carolinelds/linuxtips-giropops-senhas:2.0
```

Check app in localhost:5000.