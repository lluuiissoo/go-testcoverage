build:
	@echo "  >  Building binary..."
	go build -o myapp

test:
	@echo "  >  Validating code..."
	golint ./...
	go vet ./...
	go test ./...

test-cov:
	@echo "  >  Running tests and generating coverage output ..."
	@go test ./... -coverprofile coverage.out -covermode count
	@sleep 2 # Sleeping to allow for coverage.out file to get generated
	@echo "Current test coverage : $(shell go tool cover -func=coverage.out | grep total | grep -Eo '[0-9]+\.[0-9]+') %"