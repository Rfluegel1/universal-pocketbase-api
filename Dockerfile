FROM alpine:latest

ARG PB_VERSION=0.26.6

RUN apk add --no-cache unzip ca-certificates

# Set working directory to match volume mount
WORKDIR /app

# Download and unzip PocketBase directly into /app
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d . && chmod +x pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
