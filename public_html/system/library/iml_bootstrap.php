<?php

include_once dirname(__FILE__) . "/iml-sdk-php/vendor/autoload.php";

function iml_autoloader($class) {


        $path = explode('\\', $class);

        if ($path[0] == 'IMLSdk') {
            array_shift($path);
            $filePath = dirname(__FILE__) . '/iml-sdk-php/src/' . implode('/', $path) . '.php';
            if (file_exists($filePath)) {
                require_once($filePath);
            }
        }elseif($path[0] == 'Iml')
        {
            array_shift($path);
            $filePath = dirname(__FILE__) . '/iml/' . implode('/', $path) . '.php';
            if (file_exists($filePath)) {
                require_once($filePath);
            }            
        }

        // $path[0] = 'includes';
}


spl_autoload_register('iml_autoloader' , true, true);




$developHosts = ['localhost', 'opencart-test.iml.ru'];
// $developHosts = [];

if(in_array($_SERVER['SERVER_NAME'], $developHosts))
{
    define('IS_DEVELOP_VERSION', true);
}




function ___p($var)
{
    if(defined( 'IS_DEVELOP_VERSION'))
    {
        echo '<pre>';
        var_dump($var);
        echo '</pre>';
    }else 
    {
        $dt = new \DateTime();
        $logFileName = $dt->format('d_m_Y').'_iml.log';    
        file_put_contents(DIR_LOGS . $logFileName, date('Y-m-d G:i:s') . ' - ' . print_r($var, true) . "\n", FILE_APPEND);
    }
}