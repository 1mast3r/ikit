sudo apt-get install \
	build-essential \
	pkg-config \
	checkinstall \
	git \
	autoconf \
	automake \
	libtool-bin \
	libplist-dev \
	libusbmuxd-dev \
	libimobiledevice-glue-dev \
	libssl-dev \
	usbmuxd
sudo apt-get install \
	doxygen \
	cython
git clone https://github.com/libimobiledevice/libimobiledevice.git
cd libimobiledevice
./autogen.sh
make
sudo make install
sudo apt-get update -y
sudo apt-get install -y ideviceinstaller
sudo apt-get -y install idevicerestore
cd ..
bash ikit.sh