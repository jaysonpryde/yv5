# yv5
yv5 implementation for demo

---

## Manual Run
1. Build the docker image:
```
docker build -t yv5 .
```

2. Run the built docker image to run the webservice:
```
docker run --rm --name web_app -p 8080:8080 yv5
```

or add the **-d** to run in background

```
docker run -d --rm --name web_app -p 8080:8080 yv5
```
