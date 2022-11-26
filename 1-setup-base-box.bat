cd base-box
del package.
vagrant box remove base-docker-swarm
vagrant up
vagrant halt
vagrant package --base base-docker-swarm
vagrant box add --name base-docker-swarm package.box