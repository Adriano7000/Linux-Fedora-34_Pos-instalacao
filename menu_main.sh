#!/usr/bin/env bash

# ============================================
# ------ Main Menu Function Definition -------
# ============================================

flatPak() {
	clear
	head "Instalação FLATPAK!"
	bash flatpak.sh
}

snap() {
	echo "Hello snap" 

}

dnf_install() {
	bash /home/adrianodias/Documents/Pos_installation/Linux-Fedora-34_Pos-instalacao/dnf.sh
}

repository() {
	echo "Hell0 repo" 

}

appImage() {
	echo "Hell0 appimage"
}

wGet() {
	echo "Hell0 wget"

}

head() {
	titulo="Main Menu"
	[[ "$#" != 0 ]] && { titulo="$1"; }
	cat << EOF
 ============================================
 	 $titulo
 ============================================
EOF
}

main() {

	times=0
	choices=( 'dnf install' repositorio "flatpak" snap "app image" wget exit)
	#rodar=true
	#while [ $rodar == true ] ; do
		head
		PS3="Enter choice: "
		select op in "${choices[@]}"
		do
			case $op in
				"dnf install") dnf_install
				   break;;

				"repositorio") repository
				   break;;

				flatpak) flatPak
				   break;;

				snap) snap
				   break;;

				"app image") appImage
				   break;;

				wget) wGet
				   break;;

				exit) echo "GOODBYE"
				   break;;

				*) 	echo "Invalid choice"
					times=$((times + 1))
					if [ $times -eq 3 ]; then
						echo "Tentativas excedidas!"
						exit 0
					fi
					

					
			esac
		done
		
	#done
}

main

