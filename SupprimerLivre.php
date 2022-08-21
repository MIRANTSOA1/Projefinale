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
        // extract($_POST);
        $req = $bdd->prepare("DELETE FROM Livre where NumLivre= \"$NumLivre\"");
      //   $bdd->exec("INSERT INTO lecteur values(null,\"$nomCli\")") or die(print_r($bdd->errorInfo()));
      $req->execute();
      
    //   header('location: ../livre.php');

     }
     catch(exception $e){
         echo "ERROR 69 :".$e->getMessage(); 
     }
?>