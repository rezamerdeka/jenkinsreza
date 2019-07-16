#load docker image

docker load -i reza.docker

#build docker image
docker build -t rezamerdeka:node .

#membuat docker container
docker run -d -it --privileged --name node_coba rezamerdeka:node
