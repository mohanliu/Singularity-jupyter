## This installation script is dedicated for AWS EC2 instance running on AWS Linux (CentOS)
# Target version
VERSION=2.6.0

# Install prerequsite
sudo yum install squashfs-tools libarchive-devel -y -q
wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
tar xvf singularity-$VERSION.tar.gz
cd singularity-$VERSION
./configure --prefix=/usr/local
make
sudo make install

# Test version
singularity --version
sudo singularity --version
