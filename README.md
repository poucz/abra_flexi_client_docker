# abra_flexi_client_docker
Unofficial abra-flexi client docker file




# Docker Compose
-






# Spuštění bez RDP - 
na hostu:
- xhost +local:docker
- export DISPLAY=:0


docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    abra-abra flexibee

