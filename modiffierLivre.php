<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT");
header("Access-Control-Allow-Headers: Content-Type");

$request = json_decode(file_get_contents("php://input"));
$NumLivre = $request -> NumLivre;
$Titre = $request -> Titre;
$Auteur = $request -> Auteur;
$Date_edition = $request -> Date_edition;
$Disponibilité = $request -> Disponibilité;
$Quantité = $request -> Quantité;
        try{
           $pdo_option[PDO::ATTR_ERRMODE]=PDO::ERRMODE_EXCEPTION;
           $bdd= new PDO('mysql:host=localhost;dbname=gestionbibliothèque','root','mianja',$pdo_option);
        //    extract($_POST);
           $req = $bdd->prepare("UPDATE  Livre set NumLivre='$NumLivre',Titre='$Titre',Auteur='$Auteur',Date_edition='$Date_edition',Quantité = '$Quantité',Disponible='$Disponibilité'
            where NumLivre=\"$NumLivre\"");
         //   $bdd->exec("INSERT INTO lecteur values(null,\"$nomCli\")") or die(print_r($bdd->errorInfo()));
                $req->execute();
            //  $bdd->exec("UPDATE lecteur set nom= '$nomModif' where numLecteur= \"$numModif\"")or die(print_r($bdd ->errorInfo()));

        //  header('location: ../livre.php');
   
        }
        catch(exception $e){
            echo "ERROR 69 :".$e->getMessage(); 
        }
?> 
