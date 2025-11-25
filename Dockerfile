# Use a minimal base image (Alpine Linux)
FROM alpine:latest

# Install dependencies (bash, curl)
RUN apk add --no-cache bash curl

# Set the working directory inside the container
WORKDIR /app

# Copy the PocketBase binary and database files into the container
COPY pocketbase /usr/local/bin/pocketbase
COPY data.db /var/lib/pocketbase/data.db
COPY data.db-shm /var/lib/pocketbase/data.db-shm
COPY data.db-wal /var/lib/pocketbase/data.db-wal
COPY auxiliary.db /var/lib/pocketbase/auxiliary.db

# Expose the port PocketBase will listen on
EXPOSE 8080

# Start PocketBase with the database path
CMD ["/usr/local/bin/pocketbase", "serve", "--http", ":8080", "--db", "/var/lib/pocketbase/data.db"]
