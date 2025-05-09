<?php
session_start();
require_once 'db_connect.php';

// ลบเซสชันในฐานข้อมูล
if (isset($_SESSION['admin_id'])) {
    $stmt = $pdo->prepare("DELETE FROM sessions WHERE admin_id = ?");
    $stmt->execute([$_SESSION['admin_id']]);
}

// ล้างเซสชันทั้งหมด
session_unset();
session_destroy();
header("Location: login.php");
exit();
?>