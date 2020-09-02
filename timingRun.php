<!--定时检测任务-->
<?php
include "sqlmod/sqlRun.php";
function main(){
    $sqlRun = new sqlRun();
    $sqlRun->testingIp();
}
while (true) {
    main();
}