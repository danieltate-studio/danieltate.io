# Log in to Docker Hub
login:
  mkdir -p ~/.docker
  echo '{ "auths": {}, "credsStore": "" }' > ~/.docker/config.json
  docker login -u danieltate888

# Build Docker image
build:
  docker build -t danieltate888/personal-website:latest .

# Push image to Docker Hub
push:
  docker push danieltate888/personal-website:latest

# Start containers (without build)
up:
  docker compose up -d

# Start containers (with build)
up-build:
  docker compose up -d --build

# Stop containers
down:
  docker compose down

# View logs
logs:
  docker compose logs -f

# Build → Start → Push
deploy:
  docker build -t danieltate888/personal-website:latest . && \
  docker compose up -d && \
  docker push danieltate888/personal-website:latest