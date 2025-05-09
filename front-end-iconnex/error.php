<?php
// db_connect.php

// เปิดการแสดง error เพื่อช่วย debug (ใช้ตอนพัฒนาเท่านั้น)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// กำหนดข้อมูลการเชื่อมต่อ
$host = 'iconnexthailand.com'; // ถ้า MySQL อยู่บนเซิร์ฟเวอร์เดียวกัน ใช้ localhost หรือ 127.0.0.1
$dbname = 'iconnex1_iconnex_thailand_db';
$username = 'iconnex1_iconnex_thailand';
$password = '@Iconnexthailand23';

try {
    // เชื่อมต่อฐานข้อมูลด้วย PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    
    // ถ้าเชื่อมต่อสำเร็จ แสดงข้อความ
    echo "เชื่อมต่อฐานข้อมูลสำเร็จ!";
} catch (PDOException $e) {
    // แสดงข้อความ error ถ้าการเชื่อมต่อล้มเหลว
    die("การเชื่อมต่อฐานข้อมูลล้มเหลว: " . $e->getMessage());
}
?>