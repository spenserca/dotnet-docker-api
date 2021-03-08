# DockerApi

Example of a dotnet core API running in a docker container.

## requirements

- Dotnet 5.0 SDK
- Docker

## getting started

- Build the API locally by running `dotnet build -c Release -o dist`
- Build the docker image by running `docker build -t docker-api-image -f Dockerfile .`
- Run the docker image as a container with `docker run --name docker-api-container -p 8080:80 docker-api-image`
- Once the container is running you can hit the endpoint with `curl http://localhost:8080/WeatherController`

- Build the SQL server image by running `docker build -t docker-sql-iamge -f sql/Dockerfile .`
- Start the SQL server
  with `docker run --name docker-sql-container -h docker-sql-container -e "SA_PASSWORD=<password>" -p 1433:1433 -d docker-sql-image`

## cleaning up

- Stop the running container with `docker kill docker-api-container`
- Remove the container completely with `docker rm docker-api-container`
- Remove the image with `docker rmi docker-api-image`