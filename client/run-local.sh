# docker build -t flask-client .
docker run --add-host=flask-server:$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' flask-server) \
             -p 5001:5001 flask-client

