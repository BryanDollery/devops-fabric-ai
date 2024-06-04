

default: clean deploy

clean:
	@echo "Cleaning patterns"
	@rm -rf ~/.config/fabric/patterns/devops
	@echo "Done"

deploy:
	@echo "Deploying patterns"
	@cp -r patterns/* ~/.config/fabric/patterns
	@echo "Done"

list:
	@fabric --list