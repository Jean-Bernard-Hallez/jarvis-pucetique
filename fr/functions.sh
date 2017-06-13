#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file

jv_pg_ct_pucetique() {
varchempucetique="/home/pi/jarvis/plugins_installed/jarvis-pucetique/pucetique.txt"

ETAPEMOMO=$(( $ETAPEMOMO + 1 )); 

if [[ "$ETAPEMOMO" == "1" ]] ; then
	if [ ! -e "$varchempucetique" ]; then #$RENOUVPUCETIQUE
	say "Quel est le dernier jour et mois ou vous mis le $PRODUITPUCETIQUE anti puces et tiques pour la dernière fois à $NOMPUCETIQUE ?"
	fi
jv_pg_ct_pucetique_prochain
fi

if [[ "$ETAPEMOMO" == "2" ]] ; then
	if [ ! -e "$varchempucetique" ]; then #$RENOUVPUCETIQUE
#	say "$REPONSEMOMO, ai-je bien compris ?"; 
	date_utilisateur_puetique=$REPONSEMOMO
	jv_pg_ct_enreg_puetique_nouvelldate
	fi

	if [[ "$ilfautraiter_puetique" == "oui" ]]; then
	ilfautraiter_puetique="rep"
	say "souhaitez-vous appliquer le traitement aujourd'hui ?"
	return
	fi

fi

if [[ "$ETAPEMOMO" == "3" ]] ; then
	if [ ! -e "$varchempucetique" ]; then #$RENOUVPUCETIQUE
		if [[ "$REPONSEMOMO" =~ "oui" ]]; then 
		date -d $date_utilisateur_puetique "+%m/%d/%y" > $varchempucetique
		ETAPEMOMO="0"
		jv_pg_ct_pucetique
		fi
	fi
	
	if [[ "$ilfautraiter_puetique" == "rep" ]]; then
		if [[ "$REPONSEMOMO" =~ "oui" ]]; then 
ilfautraiter_puetique=""
echo "$date_cycle_mois_puetique_court/$date_cycle_jour_puetique/$date_cycle_annee_puetique" > $varchempucetique
say "Ok c'est repati pour $NOMPUCETIQUE de tranquilité"
		fi	
	fi
fi

}

jv_pg_ct_pucetique_dernier() {
varchempucetique="/home/pi/jarvis/plugins_installed/jarvis-pucetique/pucetique.txt"
On_est_le_puetique
say "Le dernier traitement a été fait le $derniere_puetique_long."
}

jv_pg_ct_pucetique_prochain() {
On_est_le_puetique
diff_date_puetique=$(( ($derniere_puetique_seconde - $prochain_puetique_seconde)/86400 ))


# 2) puis calcul date dubtoire moins aujourd'hui = jours restant

# echo " $diff_date_puetique-------------"

diff_date_puetique=$(( ($prochain_puetique_seconde - $date_aujourdhui_puetique_sec )/86400 ))

		if [[ "$diff_date_puetique" == "0" ]]; then say "C'est aujourd'hui qu'il faut le faire !!!"
		ilfautraiter_puetique="oui"
		jv_pg_ct_pucetique
		fi

		if [[ "$diff_date_puetique" -lt "0" ]]; then 
		# en retrard de aujourd'hui moins $prochain_puetique_long
		diff_date_puetique_retard=$(( ($date_aujourdhui_puetique_sec -  $prochain_puetique_seconde)/86400 ))
		say "Le traitement aurai du être déja aplliqué le $prochain_puetique_long, vous êtes en retard de $diff_date_puetique_retard jours."
		ilfautraiter_puetique="oui"
		jv_pg_ct_pucetique
		return
		fi

		if [[ "$diff_date_puetique" -gt "0" ]]; then 
		say  "Le Prochain traitement pour $NOMPUCETIQUE doit être le $prochain_puetique_long soit dans $diff_date_puetique jours."
			if [[ "$diff_date_puetique" -le "7" ]]; then
			ilfautraiter_puetique="oui"	
			jv_pg_ct_pucetique
			return
			fi
		fi

}

On_est_le_puetique() {
date_cycle_jour_puetique=`date +%d`
date_aujourdhui_puetique_sec=`date +%s`
date_cycle_mois_puetique_court=`date +%m`
date_cycle_mois_puetique_long=`date +%B`
date_cycle_annee_puetique=`date +%y`
derniere_puetique=`cat $varchempucetique`
derniere_puetique_seconde=`date -d "$derniere_puetique" "+%s"`
derniere_puetique_long=`date -d "$derniere_puetique" "+%A %d %B %Y"`
prochain_puetique_court=`date -d "$derniere_puetique $RENOUVPUCETIQUE days" "+%m/%d/%Y"`
prochain_puetique_long=`date -d "$prochain_puetique_court" "+%A %d %B %Y"`
prochain_puetique_seconde=`date -d "$prochain_puetique_court" "+%s"`

}

jv_pg_ct_enreg_puetique_nouvelldate() {
date_utilisateur_puetique=`echo "$date_utilisateur_puetique" | sed -e "s/le //g" | sed -e "s/c'est //g"`
date_utilisateur_puetique_jour=`echo "$date_utilisateur_puetique" | cut -d" " -f1`
date_utilisateur_puetique_mois_long=`echo "$date_utilisateur_puetique" | cut -d" " -f2`
date_utilisateur_puetique_annee=`echo "$date_utilisateur_puetique" | cut -d" " -f3`
# echo "$date_utilisateur_puetique"
testlemoisinverse_puetique
testlejourinverse_puetique
if [[ "$date_utilisateur_puetique_mois_long" == "" ]]; then
say "J'ai un problème de reconnaissance avec le mois énnoncée, veuillez reformuler"
ETAPEMOMO="0"
return
fi

if [[ "$date_utilisateur_puetique_annee" == "" ]]; then
date_utilisateur_puetique_annee=`date "+%y"`
fi

say "vous me demandez d'enregistrer le $date_utilisateur_puetique_jour $date_utilisateur_puetique_mois_long $date_utilisateur_puetique_annee est-ce bien cela ?"
date_utilisateur_puetique="$date_utilisateur_puetique_mois_court/$date_utilisateur_puetique_jour/$date_utilisateur_puetique_annee"
}

testlemoisinverse_puetique() {
if [[ "$date_utilisateur_puetique_mois_long" == "janvier" ]]; then
date_utilisateur_puetique_mois_court="01"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "fevrier" ]]; then
date_utilisateur_puetique_mois_court="02"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "mars" ]]; then
date_utilisateur_puetique_mois_court="03"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "avril" ]]; then
date_utilisateur_puetique_mois_court="04"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "mai" ]]; then
date_utilisateur_puetique_mois_court="05"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "juin" ]]; then
date_utilisateur_puetique_mois_court="06"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "juillet" ]]; then
date_utilisateur_puetique_mois_court="07"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "aout" ]]; then
date_utilisateur_puetique_mois_court="08"
return
fi


if [[ "$date_utilisateur_puetique_mois_long" == "septembre" ]]; then
date_utilisateur_puetique_mois_court="09"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "octobre" ]]; then
date_utilisateur_puetique_mois_court="10"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "novembre" ]]; then
date_utilisateur_puetique_mois_court="11"
return
fi

if [[ "$date_utilisateur_puetique_mois_long" == "decembre" ]]; then
date_utilisateur_puetique_mois_court="12"
return
fi
}

testlejourinverse_puetique() {
if [[ "$date_utilisateur_puetique_jour" == "1" ]]; then
date_utilisateur_puetique_jour="01"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "2" ]]; then
date_utilisateur_puetique_jour="02"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "3" ]]; then
date_utilisateur_puetique_jour="03"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "4" ]]; then
date_utilisateur_puetique_jour="04"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "5" ]]; then
date_utilisateur_puetique_jour="05"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "6" ]]; then
date_utilisateur_puetique_jour="06"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "7" ]]; then
date_utilisateur_puetique_jour="07"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "8" ]]; then
date_utilisateur_puetique_jour="08"
return
fi

if [[ "$date_utilisateur_puetique_jour" == "9" ]]; then
date_utilisateur_puetique_jour="09"
return
fi
}

##################################################################
##################################################################
##################################################################
##################################################################


