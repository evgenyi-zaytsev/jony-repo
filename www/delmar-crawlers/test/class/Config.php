<?php

class Config {

    public $BASE_PATH;
    public $trace = array();

    public function set($confArr) {
        foreach ($confArr as $k => $v) {
            $this->{$k} = $v;
        }
    }

    public function add($key, $value) {
        $this->{$key} = $value;
    }

}

?>
