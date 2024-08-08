update:
	@echo "Updating OS packages"
	sudo apt-get -y update && sudo apt-get -y upgrade && sudo snap refresh

docker-clean:
	@echo "Cleaning container, images and volumes not in use"
	docker rm $$(docker ps -a -f status=exited -f status=created -q) && docker volume prune -a -f && docker image prune -a -f

.PHONY: update start-mfp docker-clean
