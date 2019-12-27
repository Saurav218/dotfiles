export PATH="/usr/local/mysql/bin:$PATH"
export PATH=/usr/local:$PATH

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
export PATH="/usr/local/opt/ruby/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

exec fish
