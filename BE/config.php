<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
include 'database.php';
$host = $servername;

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
define('VNPAY_TMN_CODE', '0CSNLB9F');
define('VNPAY_HASH_SECRET', 'K636U3VB4NF7RO4B51TYEVAT9N8JXPFZ');
define('VNPAY_URL', 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html');
define('VNPAY_RETURN_URL', 'http://localhost/webnhahang/BE/vnpay_return.php');

// Session configuration
session_start();
?> 