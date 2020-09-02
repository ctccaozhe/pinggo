<?php
include "sqlLoading.php";

class flagc
{
    #检测存活状态
    function testingIp(){
        $this->ipLive("10.10.100.223",0);
    }

    #写入存活状态
    function ipLive($ip,$filg){
        #实例化sql参数
        $sqlLoading = new sqlLoading();
        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());
        #检测old状态
        $coMd = "select survival from host WHERE `host`.`ip` = '$ip';";
        $sql = mysqli_query($conn,$coMd);
        $row = mysqli_fetch_object($sql);
        $oldFlaGc = $row->survival;
        $time = date("Y年m月d日 h:i:sa");

        if ($filg == 1 && $oldFlaGc == 0) {
            echo $filg . "以前死亡,现在存活" . $oldFlaGc;
            $sql = "UPDATE `ipld`.`host` SET `survival` = '$filg',`detection` = '$time',`survivaltime` = '$time' WHERE `host`.`ip` = '$ip';";
            mysqli_query($conn, $sql);
        }
        if ($filg == 1 && $oldFlaGc == 1) {
            echo $filg . "以前存活,现在存活" . $oldFlaGc;
            $sql = "UPDATE `ipld`.`host` SET `survival` = '$filg',`detection` = '$time' WHERE `host`.`ip` = '$ip';";
            mysqli_query($conn, $sql);
        }
        if ($filg == 1 && $oldFlaGc == null) {
            echo $filg . "未获取到从前状态,现在存活" . $oldFlaGc;
            $sql = "UPDATE `ipld`.`host` SET `survival` = '$filg',`detection` = '$time',`survivaltime` = '$time' WHERE `host`.`ip` = '$ip';";
            mysqli_query($conn, $sql);
        }
        if ($filg == 0 && $oldFlaGc == 0) {
            echo $filg . "以前死亡,现在死亡" . $oldFlaGc;
            $sql = "UPDATE `ipld`.`host` SET `survival` = '$filg',`detection` = '$time' WHERE `host`.`ip` = '$ip';";
            mysqli_query($conn, $sql);
        }
        if ($filg == 0 && $oldFlaGc == 1) {
            echo $filg . "以前存活,现在死亡" . $oldFlaGc;
            $sql = "UPDATE `ipld`.`host` SET `survival` = '$filg',`detection` = '$time',`dietime` = '$time' WHERE `host`.`ip` = '$ip';";
            mysqli_query($conn, $sql);
        }
        if ($filg == 0 && $oldFlaGc == null) {
            echo $filg . "未获取到从前状态,现在死亡" . $oldFlaGc;
            $sql = "UPDATE `ipld`.`host` SET `survival` = '$filg',`detection` = '$time',`dietime` = '$time' WHERE `host`.`ip` = '$ip';";
            mysqli_query($conn, $sql);
        }
    }
}

$a = new flagc();
$a->testingIp();