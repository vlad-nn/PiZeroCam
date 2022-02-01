echo ----- Installing FAR
sudo add-apt-repository -y ppa:far2l-team/ppa
sudo apt -qq update
sudo apt -qq install far2l

echo ----- Installing CMake
sudo apt -qq install cmake

echo ----- Installing VS Code
sudo snap install code --classic

echo ----- Installing git
sudo apt -qq install git-all

echo ----- Installing gcc for ARM
sudo apt -qq install g++-arm-linux-gnueabi

echo ----- Installing clang-format-9
sudo apt -qq install clang-format-9

echo ----- Installing xrdp
sudo apt -qq install xrdp
sudo adduser xrdp ssl-cert
echo gnome-session > ~/.xsession

echo ----- Installation done for host:
cat /etc/hostname
