FROM golang:1.18 as build

WORKDIR /usr/src/app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
RUN go build -v -o main

FROM  public.ecr.aws/lambda/go:1

COPY --from=build /usr/src/app/main ${LAMBDA_TASK_ROOT}/main
CMD ["main"]
