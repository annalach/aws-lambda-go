# aws-lambda-go

## Testing locally

```
docker build -t aws-lambda-go:latest .
```

```
docker run -p 9000:8080 aws-lambda-go:latest
```

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{ "name": "Anna" }'
```

## Deploying

### Provisioning docker image repository

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

### Pushing a Docker image

Login to the Amazon ECR registry:

```
aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com
```

Build your image:

```
docker build -t aws_account_id.dkr.ecr.region.amazonaws.com/demo-aws-lambda-go:latest .
```

Push you image:

```
docker push aws_account_id.dkr.ecr.region.amazonaws.com/demo-aws-lambda-go:latest
```

### Provisioning AWS Lambda Function

In the project root directory run the following command to use Terragrunt in the docker container:

```
docker run -ti --rm -v $HOME/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/apps alpine/terragrunt:1.1.7 bash
```

Enter `live/demo/lambda` directory:

```
cd live/demo/lambda
```

Initialize module:

```
terragrunt init
```

Run `apply` command:

```
terragrunt apply
```
