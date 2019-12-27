osx() {
    if cat /etc/shells | grep fish; then
        echo "fish is already installed.\nSkipping fish install phase..."
    else
        echo "fish will be installed." && \
        brew install -y fish && \
        echo /usr/local/bin/fish | sudo tee -a /etc/shells
    fi
}

linux() {
    if cat /etc/shells | grep fish; then
        echo "fish is already installed.\nSkipping fish install phase..."
    else
        echo "fish will be installed." && \
        cd /etc/yum.repos.d/ && \
        sudo wget https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo && \
        sudo yum install -y fish  && \
        echo /usr/local/bin/fish | sudo tee -a /etc/shells
    fi
}

bsd() {
    if cat /etc/shells | grep fish; then
        echo "fish is already installed.\nSkipping fish install phase..."
    else
        echo "fish will be installed." && \
        sudo apt-add-repository ppa:fish-shell/release-3 && \
        sudo apt-get update && \
        sudo apt-get install -y fish && \
        echo /usr/local/bin/fish | sudo tee -a /etc/shells
    fi
}
$1
