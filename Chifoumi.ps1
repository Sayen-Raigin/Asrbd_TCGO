#Variables
#Fonction permettant de faire une comparaison et retourne la valeur déterminant le gagnant de la manche
function Rule{
    param($ChoixIA, $ChoixPlayer)
    
    if($ChoixIA -eq 'Pierre' -and $ChoixPlayer -eq 'Ciseaux'){
        return 'Win_IA'
    }
    elseif($ChoixIA -eq 'Pierre' -and $ChoixPlayer -eq 'Pierre'){
        return 'Aucun'
    }
    elseif($ChoixIA -eq 'Pierre' -and $ChoixPlayer -eq 'Feuille'){
        return 'Win_Player'
    }
    
    elseif($ChoixIA -eq 'Ciseaux' -and $ChoixPlayer -eq 'Feuille'){
        return 'Win_IA'
    }
    elseif($ChoixIA -eq 'Ciseaux' -and $ChoixPlayer -eq 'Pierre'){
        return 'Win_Player'
    }
    elseif($ChoixIA -eq 'Ciseaux' -and $ChoixPlayer -eq 'Ciseaux'){
        return 'Aucun'
    }
    
    elseif($ChoixIA -eq 'Feuille' -and $ChoixPlayer -eq 'Feuille'){
        return 'Aucun'
    }
    elseif($ChoixIA -eq 'Feuille' -and $ChoixPlayer -eq 'Pierre'){
        return 'Win_IA'
    }
    elseif($ChoixIA -eq 'Feuille' -and $ChoixPlayer -eq 'Ciseaux'){
        return 'Win_Player'
    }
}




$Player.Name=Read-Host "Comment appel tu ? "
$i=0;
while($true){
    Write-Host ('Manche N°'+$i) -ForegroundColor green
    echo "------------------------"
    echo "0) Pierre"
    echo "1) Feuille"
    echo "2) Ciseaux"
    echo "------------------------"
    
    [int]$ChoixPlayer= Read-Host "Votre attaque ";
    
    [int]$ChoixIA = Get-Random -Minimum 0 -Maximum 3;
   
    Write-Host $Player.Name 'choisit' $chifoumi[$ChoixPlayer]
    Write-Host $IA.Name 'choisit' $chifoumi[$ChoixIA]
    
    
    $Win = Rule -ChoixIA $chifoumi[$ChoixIA] -ChoixPlayer $chifoumi[$ChoixPlayer];
    
    if($Win -eq 'Win_Player'){
        $Player.Point = $Player.Point +1
    }
    
    if($Win -eq 'Win_IA'){
        $IA.Point = $IA.Point +1
    }
    
    Write-Host ($Player.Name + " à " +$Player.Point)
    Write-Host ($IA.Name + " à " +$IA.Point)
    $i++
    
    if($Player.Point -eq 3){
        $Winer  = $Player.Name
        break
    }
    if($IA.Point -eq 3){
        $Winer  = $IA.Name
        break
    }
}

echo ("Félicitation à "+$Winer)
sleep(3)