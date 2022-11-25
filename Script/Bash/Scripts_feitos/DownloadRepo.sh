#!/bin/bash 

mkdir meus-repositorios-git
cd meus-repositorios-git


repositorios=$(curl -s //api.github.com/user/victornico15/repos |  awk '/ssh_url/{print $2}' | sed 's/^"//g' | 's/",$//g')



for repositorio in $repositorios

do
	git clone $repositorio

done