# aws-lambda-go

## Testing locally

In the `src` directory run the following commands to build, run and test your Lambda function:

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

In the `infrastructure` directory run the following command to use Terragrunt in the docker container:

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

In the `src` directory run the following commands to build and push your image to ECR:

```
docker build -t aws_account_id.dkr.ecr.region.amazonaws.com/demo-aws-lambda-go:latest .
```

```
docker push aws_account_id.dkr.ecr.region.amazonaws.com/demo-aws-lambda-go:latest
```

### Provisioning AWS Lambda Function

In the `infrastructure` directory run the following command to use Terragrunt in the docker container:

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
