#!/usr/bin/env bash

head(){
	echo -e "\nPara sair digite '0'"
	read -p "Enter the software: " software
	[ "$software" == "0" ] &&  { echo "GoodBy"; exit 0; }
	verifica_software "$software"
}

verifica_software(){
	
	if [ "$(flatpak search "$1" | cut -f3 | cut -d"." -f3- | wc -l)" -ne 1 ];
		then
			appFlat=$(flatpak search "$1" | cut -f3 | cut -d"." -f3-)
			echo -e "Foi encontrado os programas:\n $appFlat\n" 
			echo -e "\nExite mais de um programa para instalar.\n"
			read -p "Deseja sair, digite 'y|n'?: " sair
			[ "$sair" == "y" ] && { echo "Goodbye!"; exit 0; }
			head
		else
			appFlat=$(flatpak search "$1" | cut -f3 | cut -d"." -f3-)
			appFlat_D=$(flatpak search "$1" | cut -f3)

			echo -e "Foi encontrado o programa: $appFlat\n
					 Descrição $appFlat_D \n"

			read -p "Se estiver errado digite 'exit'" sair
			[ "$sair" == "exit" ] && { echo "Goodbye!"; exit 0; }
			read -p "Add observations [y/n]" obs
			observation "$obs"
			instalar_flat "$appFlat"
	fi	
}

observation(){
	
	if [ "$1" == "y" ];
	then
	echo "Criando arquivo para adição de observações"
	touch install/flatpak/"${software}".sh
	echo -e "
	#!/usr/bin/env bash \n
	#Descrição: \n
	# $appFlat_D \n\n
	#Installed ${software} \n
	flatpak install $appFlat -y \n\n

	" > install/flatpak/"${software}".sh

	vi install/flatpak/"${software}".sh
	echo -e "Arquivo ${software}.sh criado com êxito \n"
	fi

}

instalar_flat(){
	flatpak install flathub "$1" 
	verifica_instalacao "$?"

}
verifica_instalacao(){
	if [ "$1" == "0" ];
	then
	echo "$appFlat" >> install/flatpak_installed.txt

	cat << EOF
	======================================================================
	---------- * ${software} * software installed with success! ----------
	======================================================================
EOF
	else
	echo "$appFlat" >> install/flatpak_not_installed.txt
	cat << EOF
	=======================================================================
	------------- * ${software} * software  not installed! ----------------
	=======================================================================
EOF
fi
}

head 









