update:
	@echo "Updating OS packages"
	sudo apt-get -y update && sudo apt-get -y upgrade && sudo snap refresh

start-mfp:
	@echo "Start my finances planner project"
	cd projects/my-finances-planner-api && vendor/bin/sail up -d && cd ../my-finances-planner-app && ionic serve

.PHONY: update


