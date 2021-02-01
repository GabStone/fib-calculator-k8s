# Docker Build
docker build -t gabstone/fib-client:latest -t gabstone/fib-client:$SHA -f ./client/Dockerfile ./client
docker build -t gabstone/fib-server:latest -t gabstone/fib-server:$SHA -f ./server/Dockerfile ./server
docker build -t gabstone/fib-worker:latest -t gabstone/fib-worker:$SHA -f ./worker/Dockerfile ./worker

# Docker Push
docker push gabstone/fib-client:latest
docker push gabstone/fib-client:$SHA

docker push gabstone/fib-server:latest
docker push gabstone/fib-server:$SHA

docker push gabstone/fib-worker:latest
docker push gabstone/fib-worker:$SHA

# K8S Apply
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=gabstone/fib-client:$SHA
kubectl set image deployments/server-deployment server=gabstone/fib-server:$SHA
kubectl set image deployments/worker-deployment worker=gabstone/fib-worker:$SHA