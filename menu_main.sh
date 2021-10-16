#!/usr/bin/env bash

# ============================================
# ------ Main Menu Function Definition -------
# ============================================

flatpakExec() {
	echo "Hell0" # arguments are accessible through $1, $2,...

}

snapExec() {
	echo "Hello snap" 

}

dnfExec() {
	echo "Hell0 dnf" 
}

repoExec() {
	echo "Hell0 repo" 

}

appImageExec() {
	echo "Hell0 appimage"
}

wgetExec() {
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
	choices=( 'dnf' repositorio "flatpak" snap "app image" wget exit)
	#rodar=true
	#while [ $rodar == true ] ; do
		head
		PS3="Enter choice: "
		select op in "${choices[@]}"
		do
			case $op in
				"dnf") dnfExec
				   break;;

				"repositorio") repoExec
				   break;;

				flatpak) flatpakExec
				   break;;

				snap) snapExec
				   break;;

				"app image") appImageExec
				   break;;

				wget) wgetExec
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






