# Abra flexi client - RDP
Neoficiální docker-compose pro účetní program od společnosti ABRA.
Dockerfile vytvoří kontejner s XRDP serverem, snáhne a nainstaluje nejnovější verzi Abra Flexi clientu ze stránex společnosti.

Připojení např:

```
xfreerdp /v:localhost:3388 /u:pou /p:pou
```



# Spuštění bez RDP - 
na hostu:
- xhost +local:docker
- export DISPLAY=:0


docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    abra-abra flexibee

