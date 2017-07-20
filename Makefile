default:
	docker build -t icersong/gitit-rpi .
build:
	docker build -t icersong/gitit-rpi .
run:
	docker run -d -p 3000:3000 -h gitit-rpi --name gitit icersong/gitit
clean:
	docker rm -f gitit
log:
	docker logs -f gitit
port:
	docker port gitit 80
enter:
	docker exec -it gitit /bin/bash

md2rst:
	pandoc README.md -f markdown -t rst -o README.rst
	cp README.rst index.rst
	cp README.rst docs/README.rst
	cp README.rst docs/index.rst

