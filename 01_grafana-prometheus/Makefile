run_podman:
	podman compose -f podman-compose.yml up

run_docker:
	docker compose up -d

env:
	bash ./create_env.sh


remove_podman_containers:
	podman rm -f $(podman ps -aq) 