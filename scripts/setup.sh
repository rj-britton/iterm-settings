function msgy() {
  printf "\033[1;33m $1 \033[0m\n"
}

function msgg() {
  printf "\033[1;32m $1 \033[0m\n"
}

msgy "🍻 installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
msgg "homebrew installed 🍻"

msgy "🚰 tapping homebrew bundle"
brew tap Homebrew/bundle
msgg "homebrew bundle tapped 🚰 "

msgy "📦 installing homebrew packages and casks"
brew bundle
msgg "homebrew packages and casks installed 📦"

msgy "👤 setting iterm2 profile"
cp ../com.googlecode.iterm2.plist ~/Library/Preferences/
msgg "iterm2 profile set 👤"

msgy "🖥 installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
msgg "oh-my-zsh installed 🖥 "

msgy "🖋 installing powerlevel10k fonts"
curl -o ~/Library/Fonts/MesloLGS\ NF\ Regular.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -o ~/Library/Fonts/MesloLGS\ NF\ Bold.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -o ~/Library/Fonts/MesloLGS\ NF\ Italic.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -o ~/Library/Fonts/MesloLGS\ NF\ Bold\ Italic.ttf  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
msgg "powerlevel10k fonts installed 🖋"

msgy "🔌 installing powerlevel10k"
brew install romkatv/powerlevel10k/powerlevel10k
msgg "powerlevel10k installed 🔌"

msgy "🎨 installing powerlevel10k omz theme"
cp ~/.zshrc ~/.zshrc.bak
awk '!/source \/opt\/homebrew\/opt\/powerlevel10k\/powerlevel10k.zsh-theme/' ~/.zshrc > temp && mv temp ~/.zshrc
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
cp ~/.p10k.zsh ~/.p10k.zsh.bak
cp ../p10k.zsh ~/.p10k.zsh
msgg "powerlevel10k omz theme installed 🎨"

msgy "🔧 installing golang environment manager"
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
msgg "golang environment manager installed 🔧"