#Change if necessary
work_proxy="http://web-proxy:8080"
git_email=jjhowey@gmail.com
git_name=jonovate
git_cred_helper=cache


###
{
if [[ -f ./$0.lok ]]; then
   echo "Script already has been run! Remove $0.lok to run again..."
   exit 0
fi
}

echo -e "----- START -----"
echo -e "\n\n###########\n# .workrc #\n###########" >> ~/.bashrc

echo -e "\nexport WORK_PROXY=\"$work_proxy\"" >> ~/.bashrc

echo "Adding extract...."
echo -e "\nif [[ -s \"~/.workrc/extract\" ]]; then
    source ~/.workrc/extract
fi" >> ~/.bashrc
echo " DONE"

echo "Adding proxy...."

export WORK_PROXY=$work_proxy
echo -e "if [[ -s \"~/.workrc/proxy\" ]]; then
    source ~/.workrc/proxy
fi" >> ~/.bashrc

echo " DONE"

source ~/.bashrc

echo "Configuring git...."
git config --global http.proxy $work_proxy
git config --global user.email $git_email
git config --global user.name $git_name
git config --global credential.helper $git_credhelper
echo " DONE"

echo "Configuring npm...."
npm config set proxy $work_proxy
npm config set https-proxy $work_proxy
echo " DONE"

echo -e "----- DONE -----"
echo "DONE" >> $0.lok

echo -e "extract \"filename.ext\" on any compressed file"
echo -e "proxy_on to enable proxy, proxy_off to disable it"