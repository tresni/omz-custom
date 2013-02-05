if [[ $(whence st) != "" ]]; then
    function _st() { 
        st
    }
    export EDITOR=_st
else
    export EDITOR=nano
fi