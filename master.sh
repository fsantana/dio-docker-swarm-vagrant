docker swarm init --advertise-addr=10.10.10.100
docker swarm join-token worker | grep docker > /vagrant/worker.sh