<?php

use Illuminate\Support\Facades\Route;


Route::prefix('services')->middleware('client.auth')->group(function(){
    $controller = 'ServiceController@';
    $r = 'client.services.';

    Route::get('/',                             $controller.'getServices'          )->name($r.'list');
    Route::get('/list',                         $controller.'getServices'          )->name($r.'list');
    Route::get('/my-services',                  $controller.'getServices'          )->name($r.'my-service');
    
    Route::get('/add',                          $controller.'getServiceForm'       )->name($r.'add');
    Route::post('/add',                         $controller.'addService'           );
    
    
    $controller = 'ServicePaymentController@';
    
    Route::get('/payment',                      $controller.'payment'              )->name($r.'payment');
    Route::get('/check-payment',                $controller.'checkServicePayment'  )->name($r.'check-payment');
    Route::post('/check-payment',               $controller.'checkServicePayment'  );
    Route::post('/verify-payment',              $controller.'save'                 )->name($r.'verify-payment');
});    