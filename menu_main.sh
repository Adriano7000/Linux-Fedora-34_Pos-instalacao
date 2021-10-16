#!/usr/bin/env bash

# ============================================
# ------ Main Menu Function Definition -------
# ============================================

flatPak() {
	echo "Hell0" # arguments are accessible through $1, $2,...

}

snap() {
	echo "Hello snap" 

}

dnf_install() {
	echo "Hell0 dnf_install" 
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

#########################################################################################3
head() {
	cat << EOF
 ============================================
 ------------------ Main Menu  --------------
 ============================================
EOF
}

main() {

	times=0
	choices=( 'dnf_install' repositorio "flatpak" snap "app image" wget exit)
	#rodar=true
	#while [ $rodar == true ] ; do
		head
		PS3="Enter choice: "
		select op in "${choices[@]}"
		do
			case $op in
				"dnf_install") dnf_install
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






