default: clean deploy

clean:
	@echo "Cleaning patterns"
	@rm -rf ~/.config/fabric/patterns/devops

deploy:
	@echo "Deploying patterns"
	@cp -r patterns/* ~/.config/fabric/patterns
	@echo "Don't forget to source functions.sh"

list:
	@fabric --list
