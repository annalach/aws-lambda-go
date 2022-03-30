# aws-lambda-go

```
docker build -t aws-lambda-go:latest .
```

```
docker run -p 9000:8080 aws-lambda-go:latest
```

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{ "name": "Anna" }'
```

```
docker run -ti --rm -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/apps alpine/terragrunt:1.1.7 bash

```
