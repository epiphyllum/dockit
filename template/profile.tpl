# 颜色加字体输出
function color()
{
    case "$1" in
        red)    nn="31";;
        green)  nn="32";;
        yellow) nn="33";;
        blue)   nn="34";;
        purple) nn="35";;
        cyan)   nn="36";;
    esac
    ff=""
    case "$2" in
        bold)   ff=";1";;
        bright) ff=";2";;
        uscore) ff=";4";;
        blink)  ff=";5";;
        invert) ff=";7";;
    esac
    color_begin=`echo -e -n "\033[${nn}${ff}m"`
    color_end=`echo -e -n "\033[0m"`
    while read line; do
        echo "${color_begin}${line}${color_end}"  
    done
}

use() {
   if  [ -f $HOME/.dockerdata/etc/$1.pl ]; then
       export DOCKIT_CONFIG=$HOME/etc/$1.pl;
       echo "Attention: now, we are operating on"  | color red bold;
       banner $1 | color red bold;
   else
       echo "File[$HOME/.dockerdata/etc/$1.pl] does not exist";
   fi
}

