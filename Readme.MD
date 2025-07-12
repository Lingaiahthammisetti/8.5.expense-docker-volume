# Installing Roboshop Docker:
* creating docker images
```
for i in mysql backend frontend debug ; do cd $i ; docker build -t $i:v1.1 . ; cd ..; done

```

```
docker build -t mysql:v1.1 .
```

```
docker build -t backend:v1.1 .
```

```
docker build -t frontend:v1.1 .
```

```
docker build -t debug:v1.1 .

```

```
docker images
```

* running docker images
```
docker run -d -p 3306:3306 --name mysql --network expense mysql:v1.1
```

```
docker run -d -p 8080:8080 --name backend --network expense backend:v1.1
```

```
docker run -d -p 80:80 --name frontend --network expense frontend:v1.1
```

```
docker run -d -p 81:81 --name debug --network expense debug:v1.1
```

```
docker ps -a
```



