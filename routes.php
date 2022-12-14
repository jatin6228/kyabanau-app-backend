<?php
// https://www.taniarascia.com/the-simplest-php-router
// https://packagist.org/packages/pecee/simple-router


use Pecee\SimpleRouter\SimpleRouter as Router;
use Pecee\Http\Url;
use Pecee\Http\Response;
use Pecee\Http\Request;
use Pecee\SimpleRouter\SimpleRouter;
include_once('./vendor/autoload.php');

define("SUB_FOLDER", ""); // make it empty if your root dir is localhost
define("API_FOLDER", ""); // make it empty if your root dir is localhost

function view($page, $arr = array())
{
    $ar = extract($arr);
    compact($ar);
    require './views/'.$page.'.php';

}




SimpleRouter::get(SUB_FOLDER.'/', function() 
{
    view('index');
});

SimpleRouter::get(SUB_FOLDER.'/user/{id}', function ($userId) {
     view('user', ['userId' => $userId]);
});


SimpleRouter::post(SUB_FOLDER.'/auth/register', function () {
    view('auth/register');
});

SimpleRouter::get(SUB_FOLDER.'/dishes/get-by-category/{category}', function ($category) {
    view('dishes/get-by-category', ['category' => $category]);
});

SimpleRouter::get(SUB_FOLDER.'/dishes/search', function () {
    view('dishes/search');
});


?>