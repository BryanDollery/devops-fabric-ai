default: clean deploy install

clean:
	@echo "Cleaning patterns"
	@rm -rf ~/.config/fabric/patterns/devops

deploy:
	@echo "Deploying patterns"
	@cp -r patterns/* ~/.config/fabric/patterns

install:
	@echo "Installing functions"
	@exec ./functions.sh

list:
	@fabric --list
