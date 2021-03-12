# DockerApi

Example of a dotnet core API running in a docker container.

## references

- [sqlpackage reference](https://docs.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-publish?view=sql-server-ver15)
- [sqlcommand reference](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver15)

## requirements

- Dotnet 5.0 SDK
- Docker

## getting started

- Build the API locally by running `dotnet build -c Release -o dist`
- Build the docker image by running 
	- On VPN: `docker build -t docker-api:latest -f Dockerfile ./DockerApi`
	- Off VPN: `docker build -t docker-api:latest -f ./DockerApi/ext.Dockerfile ./DockerApi
- Run the docker image as a container with `docker run --name docker-api --detach -p 8080:80 docker-api`
- Once the container is running you can hit the endpoint with `curl http://localhost:8080/WeatherController`

- Build the dacpac with visual studio (TODO: build from the command line)

- Build the SQL server image by running `docker build -t docker-db -f ./DockerDb/Dockerfile ./DockerDb`
- Start the SQL server
  with `docker run --name docker-db -h docker-db -e "SA_PASSWORD=<password>" -p 1433:1433 -d docker-db`

## cleaning up

- Stop the running container with `docker kill docker-api`
- Remove the container completely with `docker rm docker-api`
- Remove the image with `docker rmi docker-api`