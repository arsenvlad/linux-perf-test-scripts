# Install tools that are available via repo
yum install -y epel-release
yum install -y dstat iperf3 iperf fio qperf sockperf

# Install development tools including git, make, gcc to compile other tools as needed
yum groupinstall -y "Development Tools"

# Install ntttcp for Linux
cd ~
git clone https://github.com/Microsoft/ntttcp-for-linux.git
cd ntttcp-for-linux/src 
make
make install

# Download AzCopy v10
cd ~
wget https://azcopyvnext.azureedge.net/release20181102/azcopy_linux_amd64_10.0.4.tar.gz
tar xvf azcopy_linux_amd64_10.0.4.tar.gz
mv -f azcopy_linux_amd64_10.0.4/azcopy /usr/bin

# End