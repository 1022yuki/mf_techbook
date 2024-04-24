# Makefile for Ruby/Sinatra project

# Start the application server
run:
	@echo "Starting the Sinatra application..."
	@ruby server.rb

# Run rspec tests
test:
	@echo "Running rspec tests..."
	@./bin/rspec

# Install dependencies
install:
	@echo "Installing dependencies..."
	@gem install bundler
	@bundle install

# Clean up the project (remove database files)
clean:
	@echo "Cleaning up..."
	@rm -f *.db

# Help command to display available options
help:
	@echo "Available commands:"
	@echo "  make run       - Start the application server"
	@echo "  make test      - Run rspec tests"
	@echo "  make install   - Install dependencies"
	@echo "  make clean     - Clean up the project"
	@echo "  make help      - Display this help message"

.PHONY: run migrate test install clean help
