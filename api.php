<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT");
    header("Access-Control-Allow-Headers: Content-Type");

    $request = json_decode(file_get_contents("php://input"));
    $Matricule = $request -> Matricule;
    $Name = $request -> Name;
    $Email = $request -> Email;
    $Password = $request -> Password;
    // var_dump($request);
    try{
        $pdo_option[PDO::ATTR_ERRMODE]=PDO::ERRMODE_EXCEPTION;
        $bdd= new PDO('mysql:host=localhost;dbname=formulaire_vue','root','mianja',$pdo_option);
        // extract($_POST);
        $test = $bdd->query("SELECT Matricule from information where Matricule=\"$Matricule\"");
        $test1 = $test->fetch();
        if($test1['Matricule']==$Matricule){
          echo "<h1 style=\"font-size:150px;color:#55f\;margin-left:5%;\">😝Vous existez dejà😉</h1>";
        //   header('Refresh:2.4;url=../livre.php');
        }
        else{
          $req = $bdd->prepare('INSERT INTO information (Matricule, nom, email, pass) values (:Matricule, :nom ,:email, :pass)');
          $req->execute(array(
          ':Matricule'=> $Matricule,
          ':nom'=> $Name,
          ':email' => $Email,
          ':pass' => $Password
        ));
        // header('location: ../livre.php');

        }
     }
     catch(exception $e){
         echo "ERROR 69 :".$e->getMessage(); 
     }
 ?>