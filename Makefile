.PHONY: $(MAKECMDGOALS)

# `make setup` will be used after cloning or downloading to fulfill
# dependencies, and setup the the project in an initial state.
# This is where you might download rubygems, node_modules, packages,
# compile code, build container images, initialize a database,
# anything else that needs to happen before your server is started
# for the first time
setup:
	docker build -t url-shortener-api ./api
	docker build -t url-shortener-ui ./ui

# `make server` will be used after `make setup` in order to start
# an http server process that listens on any unreserved port
#	of your choice (e.g. 8080). 
server:
	docker network create url
	docker run --net url -p 27017:27017 -h mongodb --name mongodb -d mongo:3.4.24-xenial
	docker run --net url -p 8080:8080 -h api --name api -e "MONGO_URL=mongodb://mongodb/my_database" -d url-shortener-api
	docker run --net url -p 3000:3000 --name ui -e "API_HOST=http://api:8080" -d url-shortener-ui

# `make test` will be used after `make setup` in order to run
# your test suite.
test:
	docker exec api npm run test
	docker exec ui npm run test

clean:
	docker rm -f ui | true
	docker rm -f api | true
	docker rm -f mongodb | true
	docker network rm url | true