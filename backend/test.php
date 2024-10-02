<?php
$frontend_host = getenv('NODEJS_HOST');
$frontend_port = getenv('NODEJS_PORT');
$url = "http://{$frontend_host}:{$frontend_port}/api/endpoint";

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

echo $response;
?>