update:
	@echo "Updating OS packages"
	sudo apt-get -y update && sudo apt-get -y upgrade && sudo snap refresh
	@echo "Update is done!"

docker-clean:
	@echo "Cleaning container, images and volumes not in use"
	docker rm $$(docker ps -a -f status=exited -f status=created -q) && docker volume prune -a -f && docker image prune -a -f

clean:
        sudo rm -rf ~/.cache/* && docker system prune && docker system prune -a --volumes

.PHONY: update docker-clean clean
