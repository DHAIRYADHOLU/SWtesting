#Create multi stage Docker

#BUILD STAGE

FROM golang:1.21.1-alpine as builder

#Set the working directory
WORKDIR /app


COPY . .

#Build the app

RUN go build -o myapp

#Use smaller image to reduce the size of final container

FROM alpine:latest

#Set working Directory

WORKDIR /root/

#Copy the binary from the BUILD STAGE

COPY --from=builder /app/myapp .

#Execute app

CMD ["./myapp"]