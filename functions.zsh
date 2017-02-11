function pman() {
  man -t $* | open -f -a /Applications/Preview.app
}

function gman() {
  man -t $* | gv - 2>&1 > /dev/null &
}

function newproj()
{
  if [ ! -d $1 ]
  then
    mkdir -p $1
  fi
  cd $1
}

function get_password()
{
  security find-generic-password -w -s $1 2>&1 | tr -d '\n'
}

function copy_password() 
{
  security find-generic-password -w -s $1 2>&1 | tr -d '\n' | pbcopy
}
