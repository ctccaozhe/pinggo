<?php
include "sqlmod/sqlRun.php";
function main(){
    $sqlRun = new sqlRun();
    $sqlRun->lookAll();
}
main();