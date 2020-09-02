<?php
include "sqlLoading.php";
include "service/pingAddress.php";

class sqlRun
{
    #查询内容
    function lookIp()
    {
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            echo $row->ip;
            echo "<br />";
        }
        mysqli_close($conn);
    }
    function lookMac()
    {
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            echo $row->mac;
            echo "<br />";
        }
        mysqli_close($conn);
    }
    #查询最后存活时间
    function lookDetection()
    {
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            echo $row->detection;
            echo "<br />";
        }
        mysqli_close($conn);
    }
    #查询存活状态
    function lookSurvival()
    {
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            echo $row->survival;
            echo "<br />";
        }
        mysqli_close($conn);
    }
    #查询存活时长
    function lookSurvialtime()
    {
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            echo $row->survialtime;
            echo "<br />";
        }
        mysqli_close($conn);
    }
    #查询上一次离线时间
    function lookDietime()
    {
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            echo $row->dietime;
            echo "<br />";
        }
        mysqli_close($conn);
    }

    #查看数据库中所有内容并返回表格
    function lookAll(){
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host order by ip";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        ?>
        <table border="1">
            <tbody>
            <tr>
                <th scope="col">IP地址</th>
                <th scope="col">MAC地址</th>
                <th scope="col">检测时间</th>
                <th scope="col">存活状态</th>
                <th scope="col">最近存活时间</th>
                <th scope="col">最近离线时间</th>
                <th scope="col">系统</th>
<!--                <th scope="col">备注信息</th>-->
                <th scope="col">拥有者</th>
            </tr>
        <?php
        while ($row = mysqli_fetch_object($sql)) {
            echo "<tr><td>";
            echo $row->ip;
            echo "</td>";
            echo "<td>";
            echo $row->mac;
            echo "</td>";
            echo "<td>";
            echo $row->detection;
            echo "</td>";
            echo "<td>";
            if($row->survival == "1"){
                echo "<font color=\"green\">存活";
            }else{
                echo "<font color=\"red\">离线</font>";
            }
            echo "</td>";
            echo "<td>";
            echo $row->survivaltime;
            echo "</td>";
            echo "<td>";
            echo $row->dietime;
            echo "</td>";
            echo "<td>";
            echo $row->system;
            echo "</td>";
//            echo "<td>";
//            echo $row->bz;
//            echo "</td>";
            echo "<td>";
            echo $row->owner;
            echo "</td></tr>";
        }
        ?>
            </tbody>
        </table>
        <?php
        mysqli_close($conn);
    }

    #检测存活状态
    function testingIp(){
        #实例化sql参数
        $sqlLoading = new sqlLoading();

        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());

        #设置sql语句
        $cmd = "select * from host";
        $sql = mysqli_query($conn, $cmd);

        #查询数据库内数据
        while ($row = mysqli_fetch_object($sql)) {
            #检测联通性
            $testing = pingAddress($row->ip);
            if ($testing){
                echo "正常";
                echo "---".$row->ip."---";
                $this->ipLive($row->ip,"1");
            }else{
                echo "异常";
                echo "---".$row->ip."---";
                $this->ipLive($row->ip,"0");
            }
            echo "<br />";
        }
        mysqli_close($conn);
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