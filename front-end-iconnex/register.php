<?php
session_start();
require_once 'db_connect.php';

if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        $error = "การตรวจสอบความปลอดภัยล้มเหลว!";
    } else {
        $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        $password = trim($_POST['password']);
        $confirm_password = trim($_POST['confirm_password']);

        if (empty($name) || empty($email) || empty($password) || empty($confirm_password)) {
            $error = "ต้องกรอกข้อมูลทุกช่อง!";
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error = "รูปแบบอีเมลไม่ถูกต้อง!";
            $email = ''; // Clear invalid email
        } elseif (strlen($password) < 8) {
            $error = "รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร!";
            $password = ''; // Clear password only
            $confirm_password = ''; // Clear confirm password
        } elseif ($password !== $confirm_password) {
            $error = "รหัสผ่านและการยืนยันรหัสผ่านไม่ตรงกัน!";
            $password = ''; // Clear password
            $confirm_password = ''; // Clear confirm password
        } else {
            $stmt = $pdo->prepare("SELECT email FROM admins WHERE email = ?");
            $stmt->execute([$email]);
            if ($stmt->rowCount() > 0) {
                $error = "อีเมลนี้มีอยู่แล้ว!";
                $email = ''; // Clear duplicate email
            } else {
                $password_hash = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $pdo->prepare("INSERT INTO admins (name, email, password_hash) VALUES (?, ?, ?)");
                $stmt->execute([$name, $email, $password_hash]);
                $success = "การลงทะเบียนสำเร็จ! กำลังเปลี่ยนเส้นทางไปยังหน้าเข้าสู่ระบบ...";
                header("Refresh: 2; url=login.php");
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ลงทะเบียน Admin - Iconnex Thailand</title>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="img/2.png" type="image/x-icon">
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
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
            height: 44px;
            box-sizing: border-box;
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

        button:active {
            transform: translateY(0);
        }

        .error {
            color: #e63946;
            font-size: 14px;
            margin-bottom: 15px;
            animation: shake 0.3s ease;
        }

        .success {
            color: #2a9d8f;
            font-size: 14px;
            margin-bottom: 15px;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .login-link {
            margin-top: 15px;
            font-size: 14px;
            color: #b0b0b0;
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

        .password-container {
            position: relative;
            width: 100%;
        }

        .password-container input {
            padding-right: 40px;
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
        <h2>ลงทะเบียน Admin</h2>
        <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
        <?php if (isset($success)) echo "<p class='success'>$success</p>"; ?>
        <form method="POST" action="">
            <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
            <div class="form-group">
                <label for="name">ชื่อ:</label>
                <input type="text" id="name" name="name" value="<?php echo isset($name) ? htmlspecialchars($name) : ''; ?>" required>
            </div>
            <div class="form-group">
                <label for="email">อีเมล:</label>
                <input type="email" id="email" name="email" value="<?php echo isset($email) ? htmlspecialchars($email) : ''; ?>" required>
            </div>
            <div class="form-group password-container">
                <label for="password">รหัสผ่าน:</label>
                <input type="password" id="password" name="password" required>
                <i class="fa-regular fa-eye toggle-password" onclick="togglePassword('password')"></i>
            </div>
            <div class="form-group password-container">
                <label for="confirm_password">ยืนยันรหัสผ่าน:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
                <i class="fa-regular fa-eye toggle-password" onclick="togglePassword('confirm_password')"></i>
            </div>
            <button type="submit">สมัครสมาชิก</button>
        </form>
        <p class="login-link">มีบัญชีแล้ว? <a href="login.php">เข้าสู่ระบบที่นี่</a></p>
    </div>

    <script>
        function togglePassword(fieldId) {
            const passwordInput = document.getElementById(fieldId);
            const toggleIcon = passwordInput.nextElementSibling;
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
    </script>
</body>
</html>