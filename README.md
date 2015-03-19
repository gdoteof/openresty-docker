see: https://github.com/torhve/openresty-docker

Requires redis. gestures.lua must be updated to point to redis db 


to run:

```
mkdir logs
sudo docker run -t -i -p 8080:8080 -v `pwd`:/helloproj -w=/helloproj gdoteof/openresty
```
