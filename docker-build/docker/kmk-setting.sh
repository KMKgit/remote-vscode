#!/bin/bash

set_apt()
{

    sudo apt-get -y update
    sudo apt-get -y install vim
    sudo apt-get -y install zsh
    sudo apt-get -y install fonts-powerline
    sudo apt-get -y install lsof
}

set_zsh()
{
    #export CHSH=no
    #curl -Lo ohmyzsh_install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
    #sudo chmod +x ohmyzsh_install.sh
    #0>/dev/null ./ohmyzsh_install.sh
    #sudo chsh -s /bin/zsh
    mkdir -p ~/.zsh
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
    mv zsh-syntax-highlighting ~/.zsh/
    mv zsh-autosuggestions ~/.zsh/
    echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
    echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
    echo 'export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=180"' >> ~/.zshrc

    zsh
}

set_vim()
{
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    chmod +x ~/.vim_runtime/install_awesome_vimrc.sh
    0>/dev/null ~/.vim_runtime/install_awesome_vimrc.sh
}

set_node()
{
    curl -Lo nvm_install.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh
    sudo chmod +x nvm_install.sh
    0>/dev/null ./nvm_install.sh

    #export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    #source ~/.zshrc

    #nvm install 12.13.0
    #yes | npm install -g @angular/cli nodemon forever
}

set_go()
{
    wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
    sudo tar -xvf go1.13.3.linux-amd64.tar.gz
    rm -rf go1.13.3.linux-amd64.tar.gz
    sudo mv go /usr/local

    echo 'export GOROOT=/usr/local/go' >> ~/.zshrc
    echo 'export GOPATH=$HOME/Project' >> ~/.zshrc
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.zshrc
}

set_path()
{
    echo 'export CDPATH="$HOME/Project/src"' >> ~/.zshrc
    echo 'export CDPATH="$CDPATH:$HOME/Project/src/gitlab.smartm2m.co.kr"' >> ~/.zshrc
    echo 'export gitlab="$HOME/Project/src/gitlab.smartm2m.co.kr"' >> ~/.zshrc

    echo 'alias kill-port = killbyport() {
            if [ "$1" != "" ]
            then
                kill -9 $(lsof -t -i:$1)
            else
            echo "ERROR : you must enter param : port number"
            echo "ex: kill-port 4444"
            fi
         }' >> ~/.zshrc
}

set_all()
{
    set_apt
    set_zsh
    set_vim
    set_go
    set_path
    set_node
}

set()
{
    case $1 in
        apt | zsh | vim | node | go | path | all | clean)
            cmd=set_$1
            shift
            $cmd
            exit
            ;;
        *)
			exit
            ;;
    esac
}

set "$@"
