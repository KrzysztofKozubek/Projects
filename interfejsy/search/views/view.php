<?php
abstract class View
{
    protected $model;

    public function loadModel($name, $path = 'models/')
    {
        $path = $path . $name . '.php';
        $name = $name . 'Model';
        try {
            if (is_file($path)) {
                require $path;
                $ob = new $name();
            } else {
                throw new Exception('Can not open model ' . $name . ' in: ' . $path);
            }
        } catch (Exception $e) {
            echo $e->getMessage() . '<br />                File: ' . $e->getFile() . '<br />                Code line: ' . $e->getLine() . '<br />                Trace: ' . $e->getTraceAsString();
            exit;
        }
        return $ob;
    }

    public function render($name, $path = 'templates/')
    {
        $path = $path . $name . '.php';
        try {
            if (is_file($path)) {
                require $path;
            } else {
                throw new Exception('Can not open template ' . $name . ' in: ' . $path);
            }
        } catch (Exception $e) {
            echo $e->getMessage() . '<br />                File: ' . $e->getFile() . '<br />                Code line: ' . $e->getLine() . '<br />                Trace: ' . $e->getTraceAsString();
            exit;
        }
    }

    public function set($name, $value)
    {
        $this->$name = $value;
    }

    public function get($name)
    {
        return @$this->$name;
    }

    public function set1($name1, $value1)
    {
        $this->$name1 = $value1;
    }

    public function get1($name1)
    {
        return $this->$name1;
    }
} ?>