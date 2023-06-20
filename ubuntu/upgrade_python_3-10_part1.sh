#!/bin/bash

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update -y

apt list | grep python3.10

echo
echo =====================
echo "Install Python 3.10"
echo =====================
read -p "Press [ENTER] to continue or Ctrl-c to quit."
echo
echo ========================
echo "Installing Python 3.10"
echo ========================
echo

sudo apt install python3.10 -y
echo
echo "Changing the default alternatives for Python will break your Gnome terminal."
echo "To avoid this, you need to edit the gnome-terminal configuration file."
echo
echo "Open the terminal and run:"
echo
echo "sudo nano /usr/bin/gnome-terminal"
echo "In first line, change #!/usr/bin/python3 to #!/usr/bin/python3.8. Press Ctrl +X followed by enter to save and exit."
echo
echo "Then save and close the file."

echo "Then run:"
echo "bash upgrade_python_3-10_part2.sh to finish the setup"
rm upgrade_python_3-10_part1.sh
