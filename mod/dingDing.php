<?php
/**钉钉机器人API**/

class dingDing
{
    function request_by_curl($remote_server, $post_string)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $remote_server);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_HTTPHEADER,
            ['Content-Type: application/json;charset=utf-8']);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // 线下环境不用开启curl证书验证, 未调通情况可尝试添加该代码
        // curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
        // curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $data = curl_exec($ch);
        curl_close($ch);

        return $data;
    }
    function run($message)
    {
        // 机器人hook地址
        $webhook = "https://oapi.dingtalk.com/robot/send?access_token=2a7795251c10893355e1249896e739049ffb973b7a959c90cf92e6ee0ac06fd3";
        // @给谁的手机号
        $atMobile = ['13736871933'];
        $isAtAll = false;
        $data = [
            'msgtype' => 'text',
            'text' =>
                ['content' => $message],
            'at' => [
                'atMobiles' => $atMobile,
                'isAtAll' => $isAtAll,
            ],

        ];
        $data_string = json_encode($data);

        $result = $this->request_by_curl($webhook, $data_string);
        echo $result;
    }
}