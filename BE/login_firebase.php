<?php
include('database.php');
session_start();
header('Content-Type: application/json; charset=utf-8');

// Demo: dùng sau khi Firebase đã xác thực phone trên FE.
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Phương thức không hỗ trợ']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);
$phone = $input['phone'] ?? '';
$phone = trim($phone);

if ($phone === '') {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Thiếu số điện thoại']);
    exit;
}

// TODO: Ở production cần verify Firebase ID token ở backend để đảm bảo phone đã xác thực.

$stmtUser = $conn->prepare("SELECT user_id, lastname, firstname, rank_id FROM users WHERE phone = ? LIMIT 1");
$stmtUser->bind_param('s', $phone);
$stmtUser->execute();
$userRes = $stmtUser->get_result();

if ($user = $userRes->fetch_assoc()) {
    $user_id = $user['user_id'];
    $lastname = $user['lastname'];
    $firstname = $user['firstname'];
    $rank_id = $user['rank_id'];
} else {
    $rank_id = 1;
    $stmtInsert = $conn->prepare("INSERT INTO users (lastname, firstname, phone, rank_id) VALUES ('', '', ?, ?)");
    $stmtInsert->bind_param('si', $phone, $rank_id);
    $stmtInsert->execute();
    $user_id = $conn->insert_id;
    $lastname = '';
    $firstname = '';
    $stmtInsert->close();
}
$stmtUser->close();

$rank_name = null;
$discount = 0;
$stmtRank = $conn->prepare("SELECT rank_name, discount FROM ranks WHERE rank_id = ? LIMIT 1");
$stmtRank->bind_param('i', $rank_id);
$stmtRank->execute();
$rankRes = $stmtRank->get_result();
if ($rankRow = $rankRes->fetch_assoc()) {
    $rank_name = $rankRow['rank_name'];
    $discount = $rankRow['discount'];
}
$stmtRank->close();

$_SESSION['user_id'] = $user_id;
$_SESSION['lastname'] = $lastname;
$_SESSION['firstname'] = $firstname;
$_SESSION['rank_id'] = $rank_id;

$response = [
    'success' => true,
    'message' => 'Đăng nhập thành công!',
    'user_id' => $user_id,
    'rank_name' => $rank_name,
    'discount' => $discount,
    'redirect' => '../FE/index-login.html'
];

echo json_encode($response);
$conn->close();

