pacman -Syu git openssh docker docker-compose unzip go cloc fish fastfetch

git config --global user.name "deno.bun"
git config --global user.email "deno.bun@yandex.com"
git config --global init.defaultBranch main
ssh-keygen -t ed25519 -C "arch-wsl"

green_echo "### SSH-публичный ключ:"
cat ~/.ssh/id_ed25519.pub

green_echo "### Добавь этот ключ в GitHub"
read -r -p "### Нажми Enter, когда закончишь... " < /dev/tty

systemctl start docker
systemctl enable docker

chsh -s /usr/bin/fish

curl -fsSL https://bun.sh/install | bash

# Пробросить именно 0.0.0.0 порт, чтобы заходить на сайт с внешней и локальной сети
# netsh interface portproxy add v4tov4 `
#  listenaddress=0.0.0.0 listenport=80 `
# connectaddress=127.0.0.1 connectport=80