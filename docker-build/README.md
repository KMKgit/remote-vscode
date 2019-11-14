# Remote VSCODE
- oh-my-zsh
- nvm, nodejs
- golang
- 

## Configuration
```sh
vi .env
```

## Command
```sh
kmk-vscode.sh up
docker exec -it vscode bash
```

```sh
cd ~
./setting.sh apt
```

```sh
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
./setting.sh zsh
vi ~/.zshrc
...
ZSH_THEME="agnoster"
...

vi ~/.oh-my-zsh/themes/agnoster.zsh-theme
...
 prompt_dir() {
   #prompt_segment blue $CURRENT_FG '%~'
   prompt_segment blue $CURRENT_FG '%2~'
 }
 ...
 ```

```sh
./setting.sh vim
./setting.sh go
./setting.sh path
```

```sh
./setting.sh node

source ~/.zshrc
nvm install 12.13.0
npm install -g @angular/cli nodemon forever
```

vscode font
`cmd` + `,`
terminal.integrated.fontFamily
: `Meslo LG M DZ for Powerline`

### zsh theme
* zsh theme "https://github.com/robbyrussell/oh-my-zsh/wiki/Themes"

`localhost:9999`
