FROM golang:1.22

EXPOSE 8080

WORKDIR /app

ENV PORT 8080
ENV DB_HOST postgres
ENV DB_USER root
ENV DB_PASSWORD root
ENV DB_NAME root
ENV DB_PORT 5432

COPY ./assets/ /app/assets/
COPY ./controllers/ /app/controllers/
COPY ./database/ /app/database/
COPY ./models/ /app/models/
COPY ./routes/ /app/routes/
COPY ./templates/ /app/templates/
COPY ./main.go /app/main.go
COPY ./go.mod /app/go.mod
COPY ./go.sum /app/go.sum

CMD [ "go", "run", "main.go" ]