<?php
session_start();
require_once 'db_connect.php';

if (isset($_SESSION['admin_id'])) {
    header("Location: dashboard.php");
    exit();
}

if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$error = '';
$modal_error = '';
$modal_success = '';
$name = '';
$password = '';
$forgot_name = '';
$forgot_email = '';
$show_reset_form = false;
$new_password = '';
$confirm_password = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['forgot_password']) && !isset($_POST['reset_password'])) {
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        $error = "การตรวจสอบความปลอดภัยล้มเหลว!";
    } else {
        $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
        $password = trim($_POST['password']);

        if (empty($name) || empty($password)) {
            $error = "กรุณากรอกชื่อและรหัสผ่าน!";
        } else {
            $stmt = $pdo->prepare("SELECT id, password_hash FROM admins WHERE name = ?");
            $stmt->execute([$name]);
            $admin = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($admin && password_verify($password, $admin['password_hash'])) {
                $_SESSION['admin_id'] = $admin['id'];
                $session_token = bin2hex(random_bytes(16));
                $stmt = $pdo->prepare("INSERT INTO sessions (admin_id, session_token, created_at) VALUES (?, ?, NOW())");
                $stmt->execute([$admin['id'], $session_token]);
                header("Location: dashboard.php");
                exit();
            } else {
                $error = "ชื่อหรือรหัสผ่านไม่ถูกต้อง!";
                $password = '';
            }
        }
    }
}

// ตรวจสอบชื่อและอีเมลสำหรับลืมรหัสผ่าน
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['forgot_password'])) {
    $forgot_name = filter_input(INPUT_POST, 'forgot_name', FILTER_SANITIZE_STRING);
    $forgot_email = filter_input(INPUT_POST, 'forgot_email', FILTER_SANITIZE_EMAIL);

    if (empty($forgot_name) || empty($forgot_email)) {
        $modal_error = "กรุณากรอกชื่อและอีเมล!";
    } else {
        $stmt = $pdo->prepare("SELECT id FROM admins WHERE name = ? AND email = ?");
        $stmt->execute([$forgot_name, $forgot_email]);
        $admin = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($admin) {
            $show_reset_form = true; // แสดงฟอร์มรีเซ็ตรหัสผ่าน
            $_SESSION['reset_admin_id'] = $admin['id']; // เก็บ ID ผู้ใช้ชั่วคราว
        } else {
            $modal_error = "ชื่อหรืออีเมลไม่ถูกต้อง!";
        }
    }
}

// อัปเดตรหัสผ่านใหม่
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reset_password'])) {
    $forgot_name = filter_input(INPUT_POST, 'forgot_name', FILTER_SANITIZE_STRING);
    $forgot_email = filter_input(INPUT_POST, 'forgot_email', FILTER_SANITIZE_EMAIL);
    $new_password = trim($_POST['new_password']);
    $confirm_password = trim($_POST['confirm_password']);

    if (empty($new_password) || empty($confirm_password)) {
        $modal_error = "กรุณากรอกรหัสผ่านทั้งสองช่อง!";
        $show_reset_form = true;
    } elseif ($new_password !== $confirm_password) {
        $modal_error = "รหัสผ่านไม่ตรงกัน!";
        $show_reset_form = true;
    } else {
        $admin_id = $_SESSION['reset_admin_id'] ?? null;
        if ($admin_id) {
            $new_password_hash = password_hash($new_password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("UPDATE admins SET password_hash = ? WHERE id = ?");
            $stmt->execute([$new_password_hash, $admin_id]);
            $modal_success = "รีเซ็ตรหัสผ่านสำเร็จ! กรุณาใช้รหัสผ่านใหม่ในการเข้าสู่ระบบ";
            unset($_SESSION['reset_admin_id']); // ล้างข้อมูลหลังสำเร็จ
        } else {
            $modal_error = "เกิดข้อผิดพลาด กรุณาลองใหม่!";
            $show_reset_form = true;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ Admin - Iconnex Thailand</title>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        body {
            background: radial-gradient(circle, #0d1b2a, #000);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }
        .container {
            background: rgba(13, 27, 42, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
            border: 1px solid #1b263b;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            color: #e0e0e0;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #b0b0b0;
            font-weight: 500;
        }
        input {
            width: 100%;
            padding: 12px;
            border: 2px solid #1b263b;
            border-radius: 8px;
            font-size: 16px;
            background: #0d1b2a;
            color: #fff;
            transition: border-color 0.3s ease;
        }
        input:focus {
            border-color: #415a77;
            outline: none;
            box-shadow: 0 0 5px rgba(65, 90, 119, 0.5);
        }
        button {
            width: 100%;
            padding: 12px;
            background: #1b263b;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background: #415a77;
            transform: translateY(-2px);
        }
        button:active { transform: translateY(0); }
        .error {
            color: #e63946;
            font-size: 14px;
            margin-bottom: 15px;
            animation: shake 0.3s ease;
        }
        .success {
            color: #00cc00;
            font-size: 14px;
            margin-bottom: 15px;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
        .forgot-password {
            margin-top: 10px;
            font-size: 14px;
        }
        a {
            color: #415a77;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #778da9;
            text-decoration: underline;
        }
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background: rgba(13, 27, 42, 0.9);
            padding: 20px;
            border-radius: 15px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            color: #fff;
        }
        .close {
            float: right;
            font-size: 24px;
            cursor: pointer;
        }
        .password-container {
            position: relative;
            width: 100%;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(40%);
            cursor: pointer;
            color: #b0b0b0;
            font-size: 18px;
            line-height: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>เข้าสู่ระบบ Admin</h2>
        <?php if ($error) echo "<p class='error'>$error</p>"; ?>
        <form method="POST" action="">
            <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
            <div class="form-group">
                <label for="name">ชื่อ:</label>
                <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($name); ?>" required>
            </div>
            <div class="form-group password-container">
                <label for="password">รหัสผ่าน:</label>
                <input type="password" id="password" name="password" required>
                <i class="fa-regular fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>
            <button type="submit">เข้าสู่ระบบ</button>
        </form>
        <p class="forgot-password"><a href="#" onclick="showModal()">ลืมรหัสผ่าน?</a></p>
    </div>

    <div id="forgotModal" class="modal" <?php if ($_SERVER['REQUEST_METHOD'] === 'POST' && (isset($_POST['forgot_password']) || isset($_POST['reset_password']))) echo 'style="display: flex;"'; ?>>
        <div class="modal-content">
            <span class="close" onclick="hideModal()">×</span>
            <h2>ลืมรหัสผ่าน</h2>
            <?php if ($modal_error) echo "<p class='error'>$modal_error</p>"; ?>
            <?php if ($modal_success) echo "<p class='success'>$modal_success</p>"; ?>

            <?php if ($show_reset_form && !$modal_success): ?>
                <form method="POST" action="">
                    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
                    <input type="hidden" name="reset_password" value="1">
                    <input type="hidden" name="forgot_name" value="<?php echo htmlspecialchars($forgot_name); ?>">
                    <input type="hidden" name="forgot_email" value="<?php echo htmlspecialchars($forgot_email); ?>">
                    <div class="form-group password-container">
                        <label for="new_password">รหัสผ่านใหม่:</label>
                        <input type="password" id="new_password" name="new_password" required>
                        <i class="fa-regular fa-eye toggle-password" onclick="toggleNewPassword()"></i>
                    </div>
                    <div class="form-group password-container">
                        <label for="confirm_password">ยืนยันรหัสผ่าน:</label>
                        <input type="password" id="confirm_password" name="confirm_password" required>
                        <i class="fa-regular fa-eye toggle-password" onclick="toggleConfirmPassword()"></i>
                    </div>
                    <button type="submit">บันทึก</button>
                </form>
            <?php elseif (!$modal_success): ?>
                <form method="POST" action="">
                    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
                    <input type="hidden" name="forgot_password" value="1">
                    <div class="form-group">
                        <label for="forgot_name">ชื่อ:</label>
                        <input type="text" id="forgot_name" name="forgot_name" value="<?php echo htmlspecialchars($forgot_name); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="forgot_email">อีเมล:</label>
                        <input type="email" id="forgot_email" name="forgot_email" value="<?php echo htmlspecialchars($forgot_email); ?>" required>
                    </div>
                    <button type="submit">ส่ง</button>
                </form>
            <?php endif; ?>
        </div>
    </div>

    <script>
        function showModal() {
            document.getElementById('forgotModal').style.display = 'flex';
        }
        function hideModal() {
            document.getElementById('forgotModal').style.display = 'none';
        }
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
        function toggleNewPassword() {
            const newPasswordInput = document.getElementById('new_password');
            const toggleIcon = newPasswordInput.nextElementSibling;
            if (newPasswordInput.type === 'password') {
                newPasswordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                newPasswordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
        function toggleConfirmPassword() {
            const confirmPasswordInput = document.getElementById('confirm_password');
            const toggleIcon = confirmPasswordInput.nextElementSibling;
            if (confirmPasswordInput.type === 'password') {
                confirmPasswordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                confirmPasswordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>