#!/usr/bin/env bash
observation(){
	
	if [ "$1" == "y" ];
	then
	echo "Criando arquivo para adição de observações"
	touch "${software}".sh
	cat <<EOF > "${software}".sh
#!/usr/bin/env bash

#Installed ${software}
dnf install "$software" -y

EOF
	vi "${software}".sh
	echo "Arquivo ${software}.sh criado com êxito"
	fi

}

verifica_instalacao(){
	if [ "$1" -eq 0 ];
	then
	echo "$software" >> software_installed_dnf.txt

	cat << EOF
	======================================================================
	---------- * ${software} * software installed with success! ----------
	======================================================================
EOF
	else
	echo "$software" >> software_not_installed_dnf.txt
	cat << EOF
	=======================================================================
	------------- * ${software} * software  not installed! ----------------
	=======================================================================
EOF
fi
}


read -p "Enter the software: " software
read -p "Add observations [y/n]" obs
observation "$obs"
	
dnf install "$software"
verifica_instalacao "$1"




