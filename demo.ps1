# Connaitre un nombre de users dans une unité d'organisation spécifique et ses sous-unités d'organisation
#######################################################
# PREMIER SIMPLE SIMPLE                             #
#######################################################
#(Get-ADUser -Filter * -SearchBase “OU=Direction,OU=Personnel,DC=sprincipe,DC=sn”).count

# Connaitre un nombre de users dans une unité d'organisation spécifique et ses sous-unités d'organisation
#######################################################################################
# DEUXIEME SCRIPT                                                                     #
#Qui me permettra: le contenu de chaque unité d'organisation suivi de ses utilisateurs#
#######################################################################################


$ous = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=Direction,OU=Personnel,DC=sprincipe,DC=sn" | Select-Object -ExpandProperty DistinguishedName
$ous | ForEach-Object{
    [psobject][ordered]@{
        OU = $_
        Count = (Get-ADUser -Filter * -SearchBase "$_").count
    }
}