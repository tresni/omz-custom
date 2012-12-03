function _make_and_change_to_dir() { 
  mkdir -p "$1" && cd "$1"; 
}

# mkdir & cd to it
if [[ $(whence mcd) = "" ]]; then
    alias mcd=_make_and_change_to_dir
fi
if [[ $(whence mkcd) = "" ]]; then
    alias mkcd=_make_and_change_to_dir
fi