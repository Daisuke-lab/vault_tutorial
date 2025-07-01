kind create cluster --name daisuke
docker exec $(docker ps -aqf "name=^daisuke-control-plane$") bash -c "echo 'alias k="kubectl"' >> ~/.bashrc"