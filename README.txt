1. centos 首先安装依赖 
sudo yum install -y autoconf automake bzip2 bzip2-devel  libtool mercurial zlib-devel
sudo yum install centos-release-scl -y && sudo yum install devtoolset-9 -y && echo "source /opt/rh/devtoolset-9/enable"  >> ~/.bashrc && source ~/.bashrc && sudo ln -s /opt/rh/devtoolset-9/root/usr/bin/g++ /usr/bin/c++ 

sudo yum install -y git mesa-libGLES-devel libX11-devel xz-devel bzip2-devel libva-devel java-1.8.0-openjdk java-1.8.0-openjdk-devel libva-vdpau-driver

sudo yum install epel-release -y && sudo yum install -y cmake3 && sudo ln -s /usr/bin/cmake3 /usr/bin/cmake 

sudo yum install -y  http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm && sudo yum install -y git


2. ubuntu 安装依赖
sudo add-apt-repository ppa:ubuntu-toolchain-r/test && sudo apt update && sudo apt-get install -y gcc-9 g++-9

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 900 && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 900

sudo apt-get install -y git cmake libgles2-mesa-dev libbz2-dev liblzma-dev libva-dev openjdk-8-jdk libvdpau-dev

sudo apt-get install -y autoconf automake build-essential libtool zlib1g-dev

3. sh unpackage.sh
4. sh compile.sh