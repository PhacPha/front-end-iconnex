<?php
require_once 'admin-backup/config/db_connect.php';

// ตรวจสอบว่าเป็น POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method Not Allowed']);
    exit;
}

// ตรวจสอบ Referer header เพื่อป้องกันการเรียกจากภายนอก
$allowed_referer = 'http://localhost/iconnex_thailand_db/';
if (!isset($_SERVER['HTTP_REFERER']) || strpos($_SERVER['HTTP_REFERER'], $allowed_referer) !== 0) {
    http_response_code(403);
    echo json_encode(['status' => 'error', 'message' => 'Forbidden']);
    exit;
}

// รับข้อมูลจาก front-end
$data = json_decode(file_get_contents('php://input'), true);

// ตรวจสอบข้อมูลที่จำเป็น
if (empty($data['page_url']) || empty($data['referrer'])) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Missing required data']);
    exit;
}

$page_url = $data['page_url'] ?? '';
$keyword = $data['keyword'] ?? '';
$referrer = $data['referrer'] ?? '';
$dwell_time = $data['dwell_time'] ?? 0;
$bounced = $data['bounced'] ?? true;

// บันทึกข้อมูลในตาราง search_referrals
$stmt = $pdo->prepare("INSERT INTO search_referrals (page_url, keyword, referrer, visit_time, dwell_time, bounced) VALUES (?, ?, ?, NOW(), ?, ?)");
$stmt->execute([$page_url, $keyword, $referrer, $dwell_time, $bounced ? 1 : 0]);

// ประเมินอันดับจากพฤติกรรมผู้ใช้
$position = 10; // ค่าเริ่มต้น (อันดับต่ำสุด)
if ($dwell_time > 60 && !$bounced) {
    $position = 3; // ถ้าอยู่ในหน้านานและไม่เด้งกลับ สมมติว่าอันดับสูง (Top 3)
} elseif ($dwell_time > 30 && !$bounced) {
    $position = 5; // อันดับกลาง ๆ
} elseif ($bounced) {
    $position = 8; // ถ้าเด้งกลับ สมมติว่าอันดับต่ำ
}

// ตรวจสอบ SERP Features
$serp_features = 'None';
if (stripos($referrer, 'featured') !== false) {
    $serp_features = 'Featured Snippet';
    $position = 0; // ถ้ามี Featured Snippet นับเป็นอันดับ 0
}

// อัปเดตตาราง page_rankings (เปลี่ยน estimated_position เป็น position)
$stmt = $pdo->prepare("INSERT INTO page_rankings (page_url, keyword, position, serp_features, last_updated) VALUES (?, ?, ?, ?, NOW()) ON DUPLICATE KEY UPDATE position = ?, serp_features = ?, last_updated = NOW()");
$stmt->execute([$page_url, $keyword, $position, $serp_features, $position, $serp_features]);

echo json_encode(['status' => 'success']);
?>