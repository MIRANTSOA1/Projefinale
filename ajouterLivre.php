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
        $test = $bdd->query("SELECT NumLivre from livre where NumLivre=\"$NumLivre\"");
        $test1 = $test->fetch();
        if($test1['NumLivre']==$NumLivre){
          echo "<h1 style=\"font-size:150px;color:#55f\;margin-left:5%;\">😝ce numero existe deja😉</h1>";
          // header('Refresh:2.4;url=../livre.php');
        }
        else{
          $req = $bdd->prepare('INSERT INTO livre(NumLivre,Titre,Auteur,Date_edition,Disponible,Quantité) values( :num, :titre ,:auteur, :dat,:disp,:qte)');
      $req->execute(array(
          ':num'=>$NumLivre,
          ':titre'=>$Titre,
          ':auteur' => $Auteur,
          ':dat' => $Date_edition,
          ':disp' => $Disponibilité,
          ':qte' =>$Quantité,
        ));
        // header('location: ../livre.php');

        }
     }
     catch(exception $e){
         echo "ERROR 69 :".$e->getMessage(); 
     }
?>