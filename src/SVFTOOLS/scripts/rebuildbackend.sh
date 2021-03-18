function highlight() {
    echo -e "\033[1;45;37m$1\033[0m"
}

function errorshow() {
    echo -e "\033[1;41;37m$1\033[0m"
}

npm i --silent svf-lib --prefix ${HOME}

cd ~
BACKENDFOLDER="SVF-example"
if [ -d ${BACKENDFOLDER} ]; then
    rm -rf ${BACKENDFOLDER}
fi

git clone https://github.com/SVF-tools/SVF-example.git
cd ~/SVF-example
source ./env.sh
cmake .
make

highlight "[BUILD BACKEND DONE.]"

cd ~
script="rebuildbackend.sh"
if [[ -f $script ]]; then
    rm $script
fi

cd ~