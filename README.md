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

In the project root directory run the following command to use Terragrunt in the docker container:

```
docker run -ti --rm -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/apps alpine/terragrunt:1.1.7 bash
```

Enter `live/demo/ecr` directory:

```
cd live/demo/ecr
```

Initialize module:

```
terragrunt init
```

Run `apply` command:

```
terragrunt apply
```
