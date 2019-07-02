.PHONY: build-prod
build-prod:
	sudo docker build -t rails-resume-prod --build-arg TARGET_ENVIRONMENT=production -f docker/Dockerfile .

.PHONY: dev
dev: build-dev run-dev

.PHONY: build-dev
build-dev:
	sudo docker build -t rails-resume-dev --build-arg TARGET_ENVIRONMENT=development -f docker/Dockerfile .

.PHONY: run-dev
run-dev:
	sudo docker run --name rails-resume-dev -p 3000:3000 rails-resume-dev &

.PHONY: stop-dev
stop-dev:
	sudo docker stop rails-resume-dev
	sudo docker rm rails-resume-dev

.PHONY: ssh-dev
ssh-dev:
	sudo docker exec -it rails-resume-dev bash
