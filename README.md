# Workrc

## Background

My Defaults For New Install:
* Extract bash function
* Work HTTP Proxy (Environmental variables, proxy on/off function including Git, maven, NPM)
* Git Setup (User, Credential Caching)
* Maven Setup (Nothing Yet)
* NPM Setup (Nothing Yet)
* VIM Setup (Clone from git and setup .vimrc)

## First Use

```
export $WORK_PROXY="<proxy>"

mkdir ~/.workrc && cd ~/.workrc
git clone https://github.com/jonovate/workrc.git .
sh zInstallOnce.sh
```
