# pkg-config openssl - нужен для либы rust (вроде lettre)
pacman -Syu git openssh docker docker-compose unzip rustup gcc just cloc fish fastfetch nano pkg-config openssl

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

rustup default stable
cargo install cargo-watch
cargo install sqlx-cli --no-default-features --features postgres
