#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file

jv_pg_ct_pucetique() {
varchempucetique="/home/pi/jarvis/plugins_installed/jarvis-pucetique/pucetique.txt";
varchempucetique_etape="$jv_dir/plugins_installed/jarvis-pucetique/pucetique_etape.txt";
varchempucetique_sauv="$jv_dir/plugins_installed/jarvis-pucetique/pucetique_dujour.txt";

# ETAPEMOMO=$(( $ETAPEMOMO + 1 )); 

if test -e "$varchempucetique_etape"; then
ETAPEMOMO=`cat $varchempucetique_etape`;
else
echo "0" > $varchempucetique_etape;
ETAPEMOMO="0";
fi

ETAPEMOMO=`cat $varchempucetique_etape`
ETAPEMOMO=$(( $ETAPEMOMO + 1 )); 
echo "$ETAPEMOMO" > $varchempucetique_etape;

if [[ "$ETAPEMOMO" == "1" ]] ; then
	if [ ! -e "$varchempucetique" ]; then #$RENOUVPUCETIQUE
	say "Quel est le dernier jour,  mois et année ou vous avez mis $PRODUITPUCETIQUE anti puces et tiques à $NOMPUCETIQUE ?";
	return;
	fi
jv_pg_ct_pucetique_prochain;

fi

if [[ "$ETAPEMOMO" == "2" ]] ; then
	if [ ! -e "$varchempucetique" ]; then #$RENOUVPUCETIQUE
	date_utilisateur_puetique=$REPONSEMOMO;
	jv_pg_ct_enreg_puetique_nouvelldate;
	return;
	fi

	if [[ "$ilfautraiter_puetique" =~ "oui" ]]; then
	ilfautraiter_puetique="rep";
	say "souhaitez-vous appliquer le traitement aujourd'hui ?";
	return
	fi

	if [[ "$REPONSEMOMO" =~ "non" ]]; then
		if [ -e "$varchempucetique_sauv" ]; then
		sudo rm "$varchempucetique_sauv";
		date_utilisateur_puetique=""
		date_utilisateur_puetique_jour=""
		date_utilisateur_puetique_mois_long=""
		date_utilisateur_puetique_annee=""
		fi
	jv_pg_ct_pucetique
	return;
	fi
fi

if [[ "$ETAPEMOMO" == "3" ]] ; then
	if [ ! -e "$varchempucetique" ]; then #$RENOUVPUCETIQUE
		if [[ "$REPONSEMOMO" =~ "oui" ]]; then 
		date_utilisateur_puetique=`cat $varchempucetique_sauv`
		date -d $date_utilisateur_puetique "+%m/%d/%y" > $varchempucetique;
		ETAPEMOMO="0";
		echo "$ETAPEMOMO" > $varchempucetique_etape;
		jv_pg_ct_pucetique;
		return;
		fi
	fi
	
	if [[ "$ilfautraiter_puetique" == "rep" ]]; then
		if [[ "$REPONSEMOMO" =~ "oui" ]]; then 
ilfautraiter_puetique="";
echo "$date_cycle_mois_puetique_court/$date_cycle_jour_puetique/$date_cycle_annee_puetique" > $varchempucetique;
say "Le traitement de $NOMPUCETIQUE,est reparti pour $RENOUVPUCETIQUE jour de tranquilité";
GOTOSORTIPUCETIQUE="Fin";
return;
		fi	
	fi

	if [[ "$REPONSEMOMO" =~ "non" ]] || [[ "$REPONSEMOMO" == "" ]]; then
			if [ -e "$varchempucetique_sauv" ]; then
			sudo rm "$varchempucetique_sauv";
			date_utilisateur_puetique=""
			date_utilisateur_puetique_jour=""
			date_utilisateur_puetique_mois_long=""
			date_utilisateur_puetique_annee=""
			fi
	ETAPEMOMO="0";
	echo "$ETAPEMOMO" > $varchempucetique_etape;
	jv_pg_ct_pucetique
	return;
	fi

		
fi

if [[ "$ETAPEMOMO" -gt "3" ]] ; then
echo "$ETAPEMOMO" > $varchempucetique_etape;
jv_pg_ct_pucetique;
fi
}

jv_pg_ct_pucetique_dernier() {
varchempucetique="/home/pi/jarvis/plugins_installed/jarvis-pucetique/pucetique.txt";
derniere_puetique_long="";
if [ -e "$varchempucetique" ]; then 
On_est_le_puetique;
say "Le dernier traitement pour $NOMPUCETIQUE avec $PRODUITPUCETIQUE a été fait le $derniere_puetique_long.";
GOTOSORTIPUCETIQUE="Fin";
else
say "veuillez commencer par la commande en disant, prochain traitement pour les puces, afin d'enregistrer la date du dernier traitement effectué.";
GOTOSORTIPUCETIQUE="Fin";
fi
}


jv_pg_ct_pucetique_prochain() {
varchempucetique="/home/pi/jarvis/plugins_installed/jarvis-pucetique/pucetique.txt";
On_est_le_puetique;
diff_date_puetique=$(( ($derniere_puetique_seconde - $prochain_puetique_seconde)/86400 ));


# 2) puis calcul date dubtoire moins aujourd'hui = jours restant

# echo " $diff_date_puetique-------------"

diff_date_puetique=$(( ($prochain_puetique_seconde - $date_aujourdhui_puetique_sec )/86400 ));

		if [[ "$diff_date_puetique" == "0" ]]; then say "C'est aujourd'hui qu'il faut soigner $NOMPUCETIQUE, veuillez le faire !!!";
		ilfautraiter_puetique="oui";
		jv_pg_ct_pucetique;
		fi

		if [[ "$diff_date_puetique" -lt "0" ]]; then 
		# en retrard de aujourd'hui moins $prochain_puetique_long;
		diff_date_puetique_retard=$(( ($date_aujourdhui_puetique_sec -  $prochain_puetique_seconde)/86400 ));
		say "Le traitement pour $NOMPUCETIQUE aurai du être déja aplliqué le $prochain_puetique_long, vous êtes en retard de $diff_date_puetique_retard jours.";
		ilfautraiter_puetique="oui";
		jv_pg_ct_pucetique;
		return;
		fi

		if [[ "$diff_date_puetique" -gt "0" ]]; then 
		say  "Le Prochain traitement pour $NOMPUCETIQUE doit être le $prochain_puetique_long soit dans $diff_date_puetique jours.";
			if [[ "$diff_date_puetique" -le "7" ]]; then
			ilfautraiter_puetique="oui";
			jv_pg_ct_pucetique;
			return;
			fi
		GOTOSORTIPUCETIQUE="Fin";
		return;
		fi

}

jv_pg_ct_pucetiqueazero() {
varchempucetique_etape="$jv_dir/plugins_installed/jarvis-pucetique/pucetique_etape.txt";
ETAPEMOMO="0";
if [ -e "$varchempucetique_etape" ]; then
sudo rm "$varchempucetique_etape";
fi

if [ -e "$varchempucetique_sauv" ]; then
date_utilisateur_puetique=""
date_utilisateur_puetique_jour=""
date_utilisateur_puetique_mois_long=""
date_utilisateur_puetique_annee=""
sudo rm "$varchempucetique_sauv";
fi




}

On_est_le_puetique() {
date_cycle_jour_puetique=`date +%d`;
date_aujourdhui_puetique_sec=`date +%s`;
date_cycle_mois_puetique_court=`date +%m`;
date_cycle_mois_puetique_long=`date +%B`;
date_cycle_annee_puetique=`date +%y`;
derniere_puetique=`cat $varchempucetique`;
derniere_puetique_seconde=`date -d "$derniere_puetique" "+%s"`;
derniere_puetique_long=`date -d "$derniere_puetique" "+%A %d %B %Y"`;
prochain_puetique_court=`date -d "$derniere_puetique $RENOUVPUCETIQUE days" "+%m/%d/%Y"`;
prochain_puetique_long=`date -d "$prochain_puetique_court" "+%A %d %B %Y"`;
prochain_puetique_seconde=`date -d "$prochain_puetique_court" "+%s"`;
}

jv_pg_ct_enreg_puetique_nouvelldate() {
if [[ "$date_utilisateur_puetique" =~ "aujourd" ]]; then
date_utilisateur_puetique=`date "+%d %B %Y"`;
fi

date_utilisateur_puetique=`echo "$date_utilisateur_puetique" | sed -e "s/le //g" | sed -e "s/c'est //g" | sed -e "s/1er /1 /g"`;
if [[ "`echo $date_utilisateur_puetique |  wc -w`" == "3" ]]; then
date_utilisateur_puetique_jour="";
date_utilisateur_puetique_mois_long="";
date_utilisateur_puetique_mois_court="";
date_utilisateur_puetique_annee="";
date_utilisateur_puetique_jour=`echo "$date_utilisateur_puetique" | cut -d" " -f1`;
date_utilisateur_puetique_mois_long=`echo "$date_utilisateur_puetique" | cut -d" " -f2`;
date_utilisateur_puetique_annee=`echo "$date_utilisateur_puetique" | cut -d" " -f3`;
# echo "$date_utilisateur_puetique";
testlemoisinverse_puetique;
testlejourinverse_puetique;
fi

if [[ "$date_utilisateur_puetique_jour"  =~ [0-9] ]]; then
ETAPEMOMO=$ETAPEMOMO;
else
say "J'ai un problème de reconnaissance avec le jour énnoncée, veuillez reformuler";
ETAPEMOMO="0";
echo "$ETAPEMOMO" > $varchempucetique_etape;
jv_pg_ct_pucetique;
return;
fi

if [[ "$date_utilisateur_puetique_mois_court" =~ [0-9] ]]; then
ETAPEMOMO=$ETAPEMOMO;
else
say "J'ai un problème de reconnaissance avec le mois énnoncée, veuillez reformuler";
ETAPEMOMO="0";
echo "$ETAPEMOMO" > $varchempucetique_etape;
jv_pg_ct_pucetique;
return;
fi

if [[ "$date_utilisateur_puetique_annee" =~ [0-9] ]]; then
ETAPEMOMO=$ETAPEMOMO;
else
say "J'ai un problème de reconnaissance avec l'année énnoncée, veuillez reformuler";
ETAPEMOMO="0";
echo "$ETAPEMOMO" > $varchempucetique_etape ;
jv_pg_ct_pucetique;
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "" ]]; then
say "J'ai un problème de reconnaissance avec le mois énnoncée, veuillez reformuler";
jv_pg_ct_pucetique;
ETAPEMOMO="0";
echo "$ETAPEMOMO" > $varchempucetique_etape;
return;
fi


if [[ "$date_utilisateur_puetique_annee" == "" ]]; then
date_utilisateur_puetique_annee=`date "+%y"`;
fi


say "vous me demandez d'enregistrer le $date_utilisateur_puetique_jour $date_utilisateur_puetique_mois_long $date_utilisateur_puetique_annee est-ce bien cela ?";
date_utilisateur_puetique="$date_utilisateur_puetique_mois_court/$date_utilisateur_puetique_jour/$date_utilisateur_puetique_annee";
echo "$date_utilisateur_puetique" > $varchempucetique_sauv
}

testlemoisinverse_puetique() {
if [[ "$date_utilisateur_puetique_mois_long" == "janvier" ]]; then
date_utilisateur_puetique_mois_court="01";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "fevrier" ]]; then
date_utilisateur_puetique_mois_court="02";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "mars" ]]; then
date_utilisateur_puetique_mois_court="03";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "avril" ]]; then
date_utilisateur_puetique_mois_court="04";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "mai" ]]; then
date_utilisateur_puetique_mois_court="05";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "juin" ]]; then
date_utilisateur_puetique_mois_court="06";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "juillet" ]]; then
date_utilisateur_puetique_mois_court="07";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "aout" ]]; then
date_utilisateur_puetique_mois_court="08";
return;
fi


if [[ "$date_utilisateur_puetique_mois_long" == "septembre" ]]; then
date_utilisateur_puetique_mois_court="09";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "octobre" ]]; then
date_utilisateur_puetique_mois_court="10";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "novembre" ]]; then
date_utilisateur_puetique_mois_court="11";
return;
fi

if [[ "$date_utilisateur_puetique_mois_long" == "decembre" ]]; then
date_utilisateur_puetique_mois_court="12";
return;
fi
}

testlejourinverse_puetique() {
if [[ "$date_utilisateur_puetique_jour" == "1" ]]; then
date_utilisateur_puetique_jour="01";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "2" ]]; then
date_utilisateur_puetique_jour="02";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "3" ]]; then
date_utilisateur_puetique_jour="03";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "4" ]]; then
date_utilisateur_puetique_jour="04";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "5" ]]; then
date_utilisateur_puetique_jour="05";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "6" ]]; then
date_utilisateur_puetique_jour="06";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "7" ]]; then
date_utilisateur_puetique_jour="07";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "8" ]]; then
date_utilisateur_puetique_jour="08";
return;
fi

if [[ "$date_utilisateur_puetique_jour" == "9" ]]; then
date_utilisateur_puetique_jour="09";
return;
fi
}

jv_pg_ct_aurevoirpuetique() {
citations=("faites lui une caresse de ma part !" "soignez le bien..." "Miaou Miaou !?" "Dites lui bonjour de ma part !" "Calinez-le bien !" "Passez un agréable moment avec lui !" "faites lui un tendre câlin !" "dites lui que je l'aime autant que vous !")
say "${citations[$RANDOM % ${#citations[@]} ]}"
}
