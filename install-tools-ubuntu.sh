# Install tools that are available via repo
sudo apt update
sudo apt install -y dstat iperf3 fio qperf sockperf build-essential

# Install ntttcp for Linux
cd ~
git clone https://github.com/Microsoft/ntttcp-for-linux.git
cd ntttcp-for-linux/src 
sudo make
sudo make install

# Download AzCopy v10
cd ~
wget https://aka.ms/downloadazcopy-v10-linux
tar xvf downloadazcopy-v10-linux
sudo mv -f azcopy_linux_amd64*/azcopy /usr/bin

# End