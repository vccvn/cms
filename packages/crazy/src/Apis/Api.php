<?php

namespace Crazy\Apis;

class Api extends BaseApi{
    // test
    public function __call($name, $arguments)
    {
        $method = strtoupper($name);
        return $this->makeRequest($method, ...$arguments);
    }
}