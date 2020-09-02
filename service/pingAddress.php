<?php
/**
 * PHP命令行ping
 * @param [str] $address 域名或者IP
 * @return [arr] ['status'=>1|0,'data'=>'响应信息']
 */

function pingAddress($address) {
    $status = -1;
    if (strcasecmp(PHP_OS, 'WINNT') === 0) {
        // Windows 服务器下
        $pingresult = exec("ping -n 1 {$address}", $outcome, $status);
    } elseif (strcasecmp(PHP_OS, 'Linux') === 0) {
        // Linux 服务器下
        $pingresult = exec("ping -w 1 -c 1 {$address}", $outcome, $status);
    }
    if (0 == $status) {
        $status = true;
    } else {
        $status = false;
    }
    return $status;
}