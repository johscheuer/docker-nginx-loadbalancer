# Loadbalancer Docker image for Docker Swarm

The Docker images contains an nginx web server and the [consul-template](https://github.com/hashicorp/consul-template) to write a dynamic configuration for the nginx. This repo is inspired by this one: <https://github.com/botleg/load-balancing-swarm>

## Usage

Set the following environment variables:

- `APP_NAME`: The container service name that we want to load balance.
- `CONSUL_URL`: URL endpoint for consul instance.

## Example

```Bash
docker run -d -p 80:80 -e APP_NAME="example" -e CONSUL_URL="127.0.0.1:8500" johscheuer/docker-nginx-loadbalancer
```

## Todo

Use nginx alpine instead of default nginx
