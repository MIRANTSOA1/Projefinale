<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT");
    header("Access-Control-Allow-Headers: Content-Type");

    $request = json_decode(file_get_contents("php://input"));
    $Email = $request -> Email;
    $Password = $request -> Password;
    // var_dump($request);
    try{
        $pdo_option[PDO::ATTR_ERRMODE]=PDO::ERRMODE_EXCEPTION;
        $bdd= new PDO('mysql:host=localhost;dbname=formulaire_vue','root','mianja',$pdo_option);
        // extract($_POST);
        $test1 = $bdd->query("SELECT email from information where email=\"$Email\"");
        $test2 = $bdd->query("SELECT pass from information where pass=\"$Password\"");
        $test3 = $test1->fetch();
        $test4 = $test2->fetch();
        if($test3['email']==$Email && $test4['pass']==$Password){
          echo "<h1 style=\"font-size:150px;color:#55f\;margin-left:5%;\">😝Vous êtes connectés😉</h1>";
        //   header('Refresh:2.4;url=../livre.php');
        }
        else{
        //   $req = $bdd->prepare('INSERT INTO information (Matricule, nom, email, pass) values (:Matricule, :nom ,:email, :pass)');
        //   $req->execute(array(
        //   ':Matricule'=> $Matricule,
        //   ':nom'=> $Name,
        //   ':email' => $Email,
        //   ':pass' => $Password
        // ));
        // header('location: ../livre.php');
        echo "<h1 style=\"font-size:150px;color:#55f\;margin-left:5%;\">😝accès refusé😉</h1>";
        }
     }
     catch(exception $e){
         echo "ERROR 69 :".$e->getMessage(); 
     }
 ?>