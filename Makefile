.PHONY: lint        # Sem isso, se existir um arquivo ou diretório com o nome "lint", o make acha que o alvo já está atualizado.

lint:
	docker run --rm -v $(CURDIR):/app -w /app golangci/golangci-lint:latest golangci-lint run controllers/ database/ models/ routes/
test:
	docker compose exec app go test main_test.go
start:
	docker compose up -d
ci: start lint test
