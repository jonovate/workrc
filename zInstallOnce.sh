#!/bin/bash
{
if [ -f ./$0.lok ]; then
   echo "Script already has been run! Remove $0.lok to run again..."
   exit 1
fi
}

echo -e "----- START -----"

#Change if necessary
if [ -z ${WORK_PROXY+x} ]; then work_proxy="http://web-proxy:8080"; else work_proxy=$WORK_PROXY; fi
git_email=jjhowey@gmail.com
git_name=jonovate
git_cred_helper=cache
vim_git_url=https://github.com/jonovate/vimrc.git
vim_runtime=~/.vim_runtime


echo -e "\n\n###########\n# .workrc #\n###########" >> ~/.bashrc

echo "Adding proxy...."
echo "   Proxy: $work_proxy"
echo -e "\nexport WORK_PROXY=\"$work_proxy\"\n" >> ~/.bashrc

export WORK_PROXY=$work_proxy
echo -e "if [ -s ~/.workrc/proxy ]; then
    source ~/.workrc/proxy
fi" >> ~/.bashrc
echo "   DONE"

echo "Adding extract...."
echo -e "\nif [ -s ~/.workrc/extract ]; then
    source ~/.workrc/extract
fi" >> ~/.bashrc
echo "   DONE"

source ~/.bashrc

#GIT
echo "Configuring git...."
if hash git 2>/dev/null; then
   git config --global user.email $git_email
   git config --global user.name $git_name
   git config --global credential.helper $git_cred_helper
   echo "   DONE"
else
   echo "   WARNING: git was not found"
fi

#MVN
echo "Configuring maven...."
if hash mvn 2>/dev/null; then
   echo "   NO ACTION - Check settings.xml. See ./samples/maven/"
else
   echo "   WARNING: mvn was not found"
fi


#NPM
echo "Configuring npm...."
if hash npm 2>/dev/null; then
   echo "   NO ACTION"
else
   echo "   WARNING: npm was not found"
fi


echo "Configuring vim..."
if [[ -d  $vim_runtime/ ]]; then
    echo "   (already setup)"
else
    mkdir $vim_runtime && cd $vim_runtime
    git clone --quiet $vim_git_url .
    sh install_awesome_vimrc.sh > /dev/null 2>&1
    echo "   DONE"
fi

echo -e "----- DONE -----\n"
echo "DONE" >> $0.lok

echo -e "extract \"file\" on any compressed file"
echo -e "proxy_on to enable proxy, proxy_off to disable it"
