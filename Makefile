lint:
	docker run --rm -itv $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
test:
	docker compose exec app go test main_test.go
start:
	docker compose up -d
ci: start lint test
cd:
	docker run --rm -itv $(CURDIR):/app -w /app golang:1.22-alpine go build main.go
	tar -cvf build.tar ./assets ./templates ./main
	scp -i "~/.ssh/curso-cd.pem" build.tar ec2-user@ec2-54-198-0-120.compute-1.amazonaws.com:/home/ec2-user
	# No servidor de PROD
	# tar -xvf build.tar
	# ./main