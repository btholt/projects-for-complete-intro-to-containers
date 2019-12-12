# use this to start the docker contanier with docker running in it connected to host docker daemon
# docker run -ti -v /var/run/docker.sock:/var/run/docker.sock --privileged --rm --name docker-host docker:18.06.1-ce

# run stock alpine container
docker run --rm -dit --name my-alpine alpine:3.10 sh

# export running container's file system and then kill to container
docker export -o dockercontainer.tar my-alpine
docker kill my-alpine

# make container-root directory, export contents of container into it
mkdir container-root
tar xf dockercontainer.tar -C container-root/

echo "mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp" >> container-root/mounts.sh

# make a contained user, mount in name spaces
unshare --mount --uts --ipc --net --pid --fork --user --map-root-user chroot $PWD/container-root ash # this also does chroot for us

# run mounts.sh inside of chroot'd env

# here's where you'd do all the cgroup rules making with the settings you wanted to, outside of the running chroot