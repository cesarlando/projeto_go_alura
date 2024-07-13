FROM golang:1.22

EXPOSE 8080

WORKDIR /app

COPY ./main /app/main

CMD [ "./main" ]