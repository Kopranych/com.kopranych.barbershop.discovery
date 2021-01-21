####Собрать и зппустить сервис в docker контейнере
```
docker build . -t kopranovin/barbershop-discovery
docker run -d --rm -p 8761:8761 -e "PROFILE=test" kopranovin/barbershop-discovery
```