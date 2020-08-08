source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Install Ruby Gems to ~/gems
#export GEM_HOME=$HOME/gems
#export PATH=$HOME/gems/bin:$PATH

# go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

proxy() {
    export http_proxy=localhost:3128
    export https_proxy=localhost:3128
    export no_proxy=localhost
}
proxy

unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset no_proxy
}

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export GROOVY_HOME=/usr/local/opt/groovy/libexec

load_jenv() {
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
}

#export NVM_NODEJS_ORG_MIRROR=https://artifactory.service.anz/artifactory/nodejs-dist
#export PHANTOMJS_CDNURL=https://dcartifactory.service.dev/artifactory/cnpmjs-cache

export NPM_CONFIG_REGISTRY=https://artifactory.service.anz/artifactory/api/npm/cd-online-npmorg

load_nvm() {
    export NVM_NODEJS_ORG_MIRROR=https://artifactory.gcp.anz/artifactory/nodejs-dist
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
}

open_backend_services() {
    kitty --session ~/backend_services.conf
}
