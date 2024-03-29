# Install tools that are available via repo
yum install -y epel-release
yum install -y dstat iperf3 iperf fio qperf sockperf

# Install development tools including git, make, gcc to compile other tools as needed
yum groupinstall -y "Development Tools"

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