<?php
require_once 'config.php';

$vnp_HashSecret = VNPAY_HASH_SECRET;

// Debug: log incoming VNPAY GET params and session for troubleshooting
@file_put_contents(__DIR__ . '/vnpay_return_debug.txt', "---\n" . date('Y-m-d H:i:s') . "\nGET:\n" . print_r($_GET, true) . "\nSESSION:\n" . print_r($_SESSION, true) . "\n", FILE_APPEND);

$vnp_SecureHash = $_GET['vnp_SecureHash'];
$inputData = array();
foreach ($_GET as $key => $value) {
    if (substr($key, 0, 4) == "vnp_") {
        $inputData[$key] = $value;
    }
}
unset($inputData['vnp_SecureHash']);
ksort($inputData);
$i = 0;
$hashData = "";
foreach ($inputData as $key => $value) {
    if ($i == 1) {
        $hashData = $hashData . '&' . urlencode($key) . "=" . urlencode($value);
    } else {
        $hashData = urlencode($key) . "=" . urlencode($value);
        $i = 1;
    }
}

$secureHash = hash_hmac('sha512', $hashData, $vnp_HashSecret);

if ($secureHash == $vnp_SecureHash) {
    if ($_GET['vnp_ResponseCode'] == '00') {
        // Determine order_id and phone. Prefer session, fallback to vnp_TxnRef parsing.
        $order_id = null;
        $phone = null;
        if (!empty($_SESSION['user_id'])) {
            $user_id = $_SESSION['user_id'];
            $stmt = $conn->prepare("SELECT order_id FROM orders WHERE user_id = ? AND status = 'pending' ORDER BY order_date DESC LIMIT 1");
            $stmt->execute([$user_id]);
            $order_id = $stmt->fetchColumn();
            $stmt2 = $conn->prepare("SELECT phone FROM users WHERE user_id = ?");
            $stmt2->execute([$user_id]);
            $phone = $stmt2->fetchColumn();
        }
        // Fallback: try to parse order_id from vnp_TxnRef
        if (empty($order_id) && !empty($_GET['vnp_TxnRef'])) {
            if (preg_match('/order_(\d+)/', $_GET['vnp_TxnRef'], $matches)) {
                $order_id = $matches[1];
                // find user_id from order and then phone
                $stmtx = $conn->prepare("SELECT user_id FROM orders WHERE order_id = ?");
                $stmtx->execute([$order_id]);
                $found_user = $stmtx->fetchColumn();
                if ($found_user) {
                    $stmtp = $conn->prepare("SELECT phone FROM users WHERE user_id = ?");
                    $stmtp->execute([$found_user]);
                    $phone = $stmtp->fetchColumn();
                }
            }
        }
        // If we still don't have order_id, redirect as invalid
        if (empty($order_id)) {
            header('Location: ../FE/index-login.html?payment=invalid');
            exit;
        }
        // Số tiền thanh toán (VNPay trả về nhân 100)
        $amount = $_GET['vnp_Amount'] / 100;
        $stmt3 = $conn->prepare("INSERT INTO payments (order_id, payment_method, amount) VALUES (?, 'online', ?)");
        $stmt3->execute([$order_id, $amount]);
        $stmt4 = $conn->prepare("UPDATE orders SET status = 'in_progress' WHERE order_id = ?");
        $stmt4->execute([$order_id]);
        header('Location: ../FE/index-login.html?payment=success&phone=' . urlencode($phone));
        exit;
    } else {
        header('Location: ../FE/index-login.html?payment=failed');
        exit;
    }
} else {
    header('Location: ../FE/index-login.html?payment=invalid');
    exit;
}
?> 