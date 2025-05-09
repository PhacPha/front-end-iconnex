<?php
$host = '127.0.0.1';
$dbname = 'iconnex_thailand_db';
$username = 'root'; // เปลี่ยนตาม username ของคุณ
$password = '';     // เปลี่ยนตาม password ของคุณ

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // ถ้าเชื่อมต่อสำเร็จ แสดงข้อความ
    echo "เชื่อมต่อฐานข้อมูลสำเร็จ!";
} catch (PDOException $e) {
    // ส่งข้อผิดพลาดในรูปแบบ JSON แทนการพิมพ์ข้อความธรรมดา
    header('Content-Type: application/json');
    echo json_encode(['success' => false, 'message' => 'การเชื่อมต่อฐานข้อมูลล้มเหลว: ' . $e->getMessage()]);
    exit;
}
?>