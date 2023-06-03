# Build n8n-debian image

docker build -f Dockerfile.n8n_debian -t n8n-debian-image .

# Run n8n-debian conteneur :

docker run -it --name n8n-debian-image-conteneur --env-file .env -p 443:443 -v n8n-debian:/home/node/ n8n-debian-image 

# for vps :

docker run -it --name n8n-debian-image-conteneur --env-file .env -p 5678:5678 -v n8n-debian:/home/node/ n8n-debian-image


export N8N_SSL_KEY=/opt/hostname.key
export N8N_SSL_CERT=/opt/hostname.crt
export N8N_PROTOCOL=https
export N8N_PORT=443

# remove and recreate

docker rm -f n8n-debian-image-conteneur && docker volume rm n8n-debian
docker build -f Dockerfile.n8n_debian -t n8n-debian-image .
docker run -it --name n8n-debian-image-conteneur --env-file .env -p 443:443 -v n8n-debian:/home/node/ n8n-debian-image

docker-compose down -v 

# Avec docker-compose (postgres) :

docker build -f Dockerfile.n8n_debian -t n8n-debian-image .
docker-compose up -d