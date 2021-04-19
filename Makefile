# This what helps run the make command in the terminal. 

help:
	@echo " > get-gruyere              ...to docker pull the gruyere docker image"
	@echo " > gruyere-start            ...to start the gruyere docker image"
	@echo " > gruyere-kill             ...to docker kill the gruyere docker image"


get-gruyere:
	@docker pull karthequian/gruyere:latest

gruyere-start:
	@docker run --rm -d -p 8008:8008 karthequian/gruyere:latest
	@echo "Gruyere is now serving dairy at localhost:8008..."

gruyere-kill:
	@docker kill $$(docker ps -a -q --filter ancestor=karthequian/gruyere:latest --format="{{.ID}}")

.DEFAULT_GOAL := help