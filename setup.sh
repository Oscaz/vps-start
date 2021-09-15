#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt install -y tmux git zsh exa
cp ./sshd_config /etc/ssh/sshd_config
useradd oscaz -d /home/oscaz -m ;
usermod -aG sudo oscaz
echo "oscaz  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir -p /home/oscaz/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9Dnjua9BmE2ssFvW+hTo2DKTwYvYFMa1GW/xXn/qdF+/Zs6mckzex/q0SRsYrrgJEA8/RRtVQFtckZFP2gcuhctWv0eyW0AGZXtua1oWm3LNapr+cjVDKAMOZlVcxNg7N8+a1q59jWPKviC/ekFoMuFBLdSeBZ7zcobE1pYYZBCROaykN6EjqBFRWjXQQ6CanMMJWtLD9GebxdYFHza2nAZqik1HkmGR/2Xb1GHinWwkttaxoVaaHVQX6NnfHC+bVHqQKsmYv71qT+mjAB/1koV4umkjHZp3GBfTe2zdR5Ez4Z1xosCKMigy6/fc/k1PpNzHYgx2UXgpIPyJlPi96G70SQZ74jkJ8Vw/SMgJBC464aycpav2pALOzUxE83m3l6zJ24r/G7LT5fN3zq0qJhLOO8TELLhsxHUq3MnMbiVpgHtRhv470MPsT6kuz2RFI2mMccQ9FnhQnOEfsVHnT6jfkb9QaNrr5YRfOA7cy81eCbvfkKIn2xsnjOkkxvWM= oscar@oscar-ubuntu" >> /home/oscaz/.ssh/authorized_keys # Desktop
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDe4T8ZsnfsIwJ1+Z7AnRXrYXfRl3oLK/YhHYjKMYiTid94IvntvlesJxb325hBFKar3AxdRmKvn5ciamtUgcpE6fkSnTcp576W6hjjEMc7hctr94dJ/GzgKwh7+lVbefos5J7KSSvmQPqG0aTo6SDd9liAzHnXd5tjgSK6plcosnrezalo0TyNo0/S1TBB2BvO7LmNCph/FeU6OGhFP9cr2dienFlbX5Qf5YFYIoWjKXjYwM4Af4tr2a0SKL2/LhC7mWrvhEUDPADRmcOETYtPcp0+IV11YZzW56iVra5oQYuWnHjZ+jMH20cvEjsPUc8soBp6bCIyuEt0rWmaWwpUhwy8BAv/qNgaRQVKcSsWg3e7V6Wi/V2+UUh3BYkGsJyZsMN5clKXDQLyx7NUbCde+MToz+VD7OnrOz8gSha2S4kGfQ6AZVPVMicDkj+puDE5IoSY0jnFy/6XW2QkFJVfucIMZp4x4uknDIn8e6XhklHRH5+zH4YxCU1uHP79rLE= u0_a238@localhost" >> /home/oscaz/.ssh/authorized_keys # Phone
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUy0iXoTFXe+FlUaKfjHiIb62r/mrDjJW/GvYKKnHZhJeLEqHKtknqYzDnAAzHUFMfgKPoSSb36WrBE2Ap6o+heaMnJEWeMMFt6VYWyJ+MJFhjLxKhh1gY65zut7ND9PW8mGswxdKc0FULzKjnycRR+eLlSy678wwsIcvtK4BlkZHsm6v8nLgm1t+Tdl2AnCAJZZ7hTaJkWEJbXqxqR+oVOPFU1zs+Tk9LBkq4msD+vxlR5toQnt9/kAbubtG8JQ0Z3eSk+TbKUrKFLx76QMDaNPedY/Woe6qwUSKn9BPzLDV6BvAPSkKkZLpR8rggpXcr01um4f/NcxdMWYAaho24RsIV+NyGEPdLs005p9vYwgyWfB8LBt2E67I0NaeZABzKsxzJmeXi/JSJLK3hx22qLnLHsvmyO9zY066xbNxiO4rjUZwhlfH5UooN0HospUTMlzPf5y5EzOf89PoqoCO1WDYWUVP70IJI1TSRv3KiruG/Q8fGBShkCbxN2hM8hQs= oscaz@oscazs-MacBook-Pro.local" >> /home/oscaz/.ssh/authorized_keys # Laptop
sudo -u oscaz CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # ohmyzsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/oscaz/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/ptavares/zsh-z.git /home/oscaz/.oh-my-zsh/custom/plugins/zsh-z # zsh z
git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/oscaz/.oh-my-zsh/plugins/zsh-autosuggestions # zsh autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/oscaz/.oh-my-zsh/plugins/zsh-syntax-highlighting # zsh syntax highlighting
cp ./.p10k.zsh /home/oscaz/
cp ./.zshrc /home/oscaz/
cp ./.tmux.conf /home/oscaz/
git config --global user.name "oscaz"
git config --global user.email "oscaz45@gmail.com"
usermod --shell /usr/bin/zsh oscaz # still root
chown -R oscaz:oscaz /home/oscaz/
cd /home/oscaz/
su oscaz # yes this will leave the script hanging until i quit. do i care? no

