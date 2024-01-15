# docker build -t custom_ubuntu20_image .

# docker network create -d macvlan \
#     --subnet=192.168.1.0/24 \
#     --gateway=192.168.1.1 \
#     -o parent=eth0 my_macvlan
# --network host
docker run --rm --gpus -it -p 2222:22 -p 5920-5930:5900-5910 --name custom_container your_custom_image
