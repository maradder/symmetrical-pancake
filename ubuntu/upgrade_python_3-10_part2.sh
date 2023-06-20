#!/bin/bash

echo "================================="
echo "Update the default Python to 3.10"
echo "================================="
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
sudo update-alternatives --config python3
echo
echo "The current version of Python is:"
python3 --version
echo

echo "==========================================="
echo "Update pip and distutils to use Python 3.10"
echo "==========================================="
echo
echo "-------------------"
echo "Remove old packages"
echo "-------------------"
sudo apt remove --purge python3-apt -y
echo
sudo apt autoclean
echo
sudo apt install python3-apt
echo
echo "-----------------"
echo "Install distutils"
echo "-----------------"
sudo apt install python3.10-distutils -y
echo

echo "-----------"
echo "Install pip"
echo "-----------"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.10 get-pip.py
rm get-pip.py
echo

echo "-----------------------"
echo "Install python3.10-venv"
echo "-----------------------"
sudo apt install python3.10-venv
echo
echo "============"
echo "--- Done ---"
echo "============"
rm upgrade_python_3-10_part2.sh
