update:
	@echo "Updating OS packages"
	sudo apt-get -y update && sudo apt-get -y upgrade && sudo snap refresh

start-mfp:
	@echo "Start my finances planner project"
	cd projects/my-finances-planner-api && vendor/bin/sail up -d && cd ../my-finances-planner-app && ionic serve

docker-clean:
	@echo "Clearning container, images and volumes not in use"
	docker rm $$(docker ps -a -f status=exited -f status=created -q) && docker volume prune -a -f && docker image prune -a -f

update:
	@echo "Updating"
	sudo apt-get update && sudo apt-get upgrade && sudo snap refresh

.PHONY: update start-mfp docker-clean update
