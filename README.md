# CS452 Lab 8 - Docker WebSearch

Go WebSearch frontend and RPC indexserver deployed with Docker.

## Build and run

```bash
docker build -t websearch_webserver -f webserver.Dockerfile .
docker build -t websearch_indexserver -f indexserver.Dockerfile .
docker compose up -d
```

Open `http://<HOST_PUBLIC_ADDRESS>:8888` and search for a keyword such as `adventure`, or run:

```bash
curl 'http://localhost:8888/api/search?q=adventure'
```

## Deployment

- Multi-stage Dockerfiles separate compilation from runtime.
- The frontend publishes port 8080 through host port 8888.
- Services communicate over a shared bridge network at `indexserver:9090`.
- Index files are mounted read-only from `test/data` into `/index`.

## Logs and cleanup

```bash
docker compose logs
docker compose down
```

Verified keyword searches through the web interface with both manual Docker networking and Docker Compose.
