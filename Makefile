test:
	echo "Starting image with testdata"
	docker stop test-image || true
	docker rm test-image || true
	docker image rm test-image -f
	docker build -t test-image .
	docker run --detach -p 8080:8080 -v $$(pwd)/data:/usr/share/nginx/html --name test-image test-image
	sleep 1
	curl -sf 'http://localhost:8080/api/files' > /dev/null
	curl -sf 'http://localhost:8080/api/files/index.json' > /dev/null
	curl -sf 'http://localhost:8080/bin/files' > /dev/null
	echo "Test OK. Stopping image."
	docker stop test-image || true
	docker rm test-image || true