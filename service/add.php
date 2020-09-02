<?php
include "../sqlmod/sqlAdd.php";

$ip = $_POST["ip"];
$mac = $_POST["mac"];
$bz = $_POST["bz"];
$owner = $_POST["owner"];
$system = $_POST["system"];

if($ip != null){
    $ipadd = new sqlAdd();
    $ipadd->addIp($ip,$mac,$bz,$owner,$system);
    header("Location:/ui/fromm.html");
    exit;
}else{
    echo "ip为空";
    header("Location:/ui/fromm.html");
    exit;
}
