#!/bin/bash -x

if [ -z "${USERNAME}" ]; then
    echo "The USERNAME enviroment variable is empty!" && exit 1
fi

if [ ! -f ".user-initialized" ]; then
    useradd --create-home --shell /bin/bash ${USERNAME}
    password=$(dd if=/dev/urandom count=32 bs=1 | md5sum | awk '{ print $1 }')
    echo -e "\n\n * Generated password: ${password}\n\n"
    echo -n ${USERNAME}:${password} | chpasswd
    touch ".user-initialized"
fi

exec shellinaboxd --disable-ssl --verbose
