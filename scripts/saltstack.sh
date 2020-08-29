echo "==> Installing salt-minion"

if [ "$DISTRO" == "bionic" ]; then
  number="18.04"
elif [ "$DISTRO" == "focal" ]; then
  number="20.04"
fi

apt-get install -y software-properties-common
wget -O - https://repo.saltstack.com/py3/ubuntu/$number/amd64/3001/SALTSTACK-GPG-KEY.pub | apt-key add -
echo "deb http://repo.saltstack.com/py3/ubuntu/$number/amd64/3001 $DISTRO main" > /etc/apt/sources.list.d/saltstack.list
apt-get update
apt-get install -y salt-common

echo "==> Basic salt-minion configuration"
echo "sift_version: ${SIFT_VERSION}" > /etc/salt/grains

sleep 60
