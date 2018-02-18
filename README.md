# Minimalistic blog engine

https://grumpy.website

## Development

```
mkdir grumpy_data
echo "nikitonsky" >> grumpy_data/FORCED_USER
echo "http://localhost:8080" >> grumpy_data/HOSTNAME
lein figwheel
open http://localhost:8080
```

## Docker
```
docker build -t grumpy .
docker run -p 8080:8080 grumpy
open http://localhost:8080
```