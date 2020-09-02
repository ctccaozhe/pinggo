<?php
include "sqlLoading.php";

class sqlAdd
{
    function addIp($ip,$mac,$bz,$owner,$system){
        $sqlLoading = new sqlLoading();
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());
        $sql = "INSERT INTO `ipld`.`host` (ip,mac,bz,owner,system) VALUES ('$ip', '$mac', '$bz', '$owner', '$system')";
        if (mysqli_query($conn,$sql)){
            return "<br />添加成功！";
        }else{
            return "<br />添加失败！";
        }
        mysqli_close($conn);
    }
}