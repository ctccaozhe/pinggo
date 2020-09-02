<?php


class sqlLoading
{
    private $servername = "localhost";
    private $username = "ipld";
    private $password = "LYWeGdSJKEtWJCjR";
    private $database = "ipld";

    /**
     * @return string
     */
    public function getServername()
    {
        return $this->servername;
    }

    /**
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @return string
     */
    public function getDatabase()
    {
        return $this->database;
    }

    #连接sql
    public function loadingSql(){
        #实例化sql参数
        $sqlLoading = new sqlLoading();
        #建立连接
        $conn = mysqli_connect($sqlLoading->getServername(), $sqlLoading->getUsername(), $sqlLoading->getPassword(), $sqlLoading->getDatabase());
        return $conn;
    }
}
