set shell := ["bash", "-c"]

login token="":
  echo -n "{{token}}" | docker login --username danieltate888 --password-stdin

# Logout
logout:
  docker logout

# Build Docker image
build:
  docker build -t danieltate888/personal-website:latest .

# Push image to Docker Hub
push:
  security unlock-keychain ~/Library/Keychains/login.keychain-db && \
  docker push danieltate888/personal-website:latest

# Start containers (without build)
up:
  docker compose up -d personal-website

# Start containers (with build)
up-build:
  docker compose up -d personal-website --build

# Stop containers
down:
  docker compose stop personal-website

# View logs
logs:
  docker compose logs -f

deploy:
  docker compose --env-file .env up -d --force-recreate
  
  