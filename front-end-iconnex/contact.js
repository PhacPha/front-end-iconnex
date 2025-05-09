// Initialize EmailJS ด้วย Public Key
(function(){
    if (typeof emailjs === 'undefined') {
        console.error('EmailJS SDK not loaded');
        return;
    }
    emailjs.init("TtF2E1tdmpTlRnvw2");
})();

// Footer
fetch('footer.html')
    .then(response => response.text())
    .then(data => {
        document.getElementById('footer-placeholder').innerHTML = data;
    })
    .catch(error => {
        console.error('Error loading footer:', error);
    });

// ตรวจสอบ User Agent และกำหนดลิงก์ให้เหมาะสม
document.addEventListener('DOMContentLoaded', function () {
    const mapOverlay = document.getElementById('map-overlay-link');
    const userAgent = navigator.userAgent || navigator.vendor || window.opera;

    const googleMapsLink = 'https://maps.app.goo.gl/7VZZ5kjiQj3LqDws5';
    const appleMapsLink = 'https://maps.apple.com/place?address=954%20Sukhumvit%20Road%0ASamrong%20Nuea,%20Mueang%20Samut%20Prakan%0ASamut%20Prakan%2010270%0AThailand&coordinate=13.646313,100.595144&name=The%20Metropolis%20Samrong%20Interchange&place-id=I970B0F4638EC2241&map=h';

    if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream) {
        mapOverlay.href = appleMapsLink;
    } else {
        mapOverlay.href = googleMapsLink;
    }

    const form = document.getElementById('contactForm');
    const modalOverlay = document.getElementById('modalOverlay');
    const modalTitle = document.getElementById('modalTitle');
    const modalMessage = document.getElementById('modalMessage');
    const modalButton = document.getElementById('modalButton');
    const resendButton = document.getElementById('resendButton');
    const resendRow = document.querySelector('.resend-row');
    const sendButton = form.querySelector('button[type="submit"]');
    const inputs = form.querySelectorAll('input, textarea');

    let canSend = true;
    let canResend = true;
    const originalSendText = sendButton.textContent;

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!canSend) {
            sendButton.classList.add('hardShake');
            setTimeout(() => sendButton.classList.remove('hardShake'), 300);
            return;
        }

        const formData = new FormData(form);
        const data = {
            name: formData.get('name'),
            email: formData.get('email'),
            subject: formData.get('subject'),
            message: formData.get('message')
        };

        console.log('Sending data:', data);

        canSend = false;

        // ส่งข้อมูลไปยัง backend เพื่อบันทึกในฐานข้อมูล
        fetch('submit_contact.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => {
            console.log('Response status:', response.status); // ดูสถานะ HTTP
            return response.text(); // ใช้ text() ก่อนเพื่อดู raw response
        })
        .then(text => {
            console.log('Raw response:', text); // ดูข้อมูลดิบที่ส่งกลับมา
            const result = JSON.parse(text); // แปลงเป็น JSON
            if (result.success) {
                return emailjs.send("service_acfu2iu", "template_bekz7fd", data);
            } else {
                throw new Error(result.message || 'Failed to save to database');
            }
        })
        .then(function(response) {
            console.log('EmailJS SUCCESS!', response.status, response.text);
            modalTitle.textContent = "ส่งข้อความสำเร็จ!";
            modalMessage.textContent = "ขอบคุณที่ติดต่อ Iconnex Thailand! เราจะติดต่อกลับโดยเร็วที่สุด";
            modalOverlay.style.display = "flex";
            modalButton.textContent = "กลับไปที่หน้าหลัก";
            modalButton.onclick = function () {
                window.location.href = 'index.php';
            };
            resendRow.style.display = "block";
            form.reset();
        })
        .catch(function(error) {
            console.error('FAILED...', error);
            modalTitle.textContent = "เกิดข้อผิดพลาด";
            modalMessage.textContent = "ไม่สามารถส่งข้อความได้ กรุณาลองใหม่: " + (error.message || JSON.stringify(error));
            modalOverlay.style.display = "flex";
            modalButton.textContent = "ตกลง";
            modalButton.onclick = function () {
                modalOverlay.style.display = "none";
            };
            resendRow.style.display = "none";
            canSend = true;
        });
    });

    // ฟังก์ชันจัดการปุ่ม "พิมพ์ข้อความใหม่"
    resendButton.addEventListener('click', function () {
        if (!canResend) {
            resendButton.classList.add('shake');
            setTimeout(() => resendButton.classList.remove('shake'), 300);
            return;
        }

        canResend = false;
        canSend = false;
        sendButton.classList.add('disabled');

        inputs.forEach(input => {
            input.classList.add('disabled');
            input.disabled = true;
            const lockIcon = input.nextElementSibling || document.createElement('svg');
            lockIcon.classList.add('lock-icon');
            lockIcon.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#888" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>`;
            if (!input.nextElementSibling) input.parentElement.appendChild(lockIcon);
            lockIcon.style.display = 'block';
        });

        resendButton.classList.add('disabled');
        modalOverlay.style.display = "none";

        let timeLeft = 60; // ทดสอบ 10 วินาที (ปกติใช้ 60)
        sendButton.textContent = `จะส่งข้อความได้อีกครั้งใน 00:${timeLeft.toString().padStart(2, '0')}`;

        const countdown = setInterval(() => {
            timeLeft--;
            sendButton.textContent = `จะส่งข้อความได้อีกครั้งใน 00:${timeLeft.toString().padStart(2, '0')}`;
            if (timeLeft <= 0) {
                clearInterval(countdown);
                canResend = true;
                canSend = true;
                resendButton.classList.remove('disabled');
                sendButton.classList.remove('disabled');
                sendButton.textContent = originalSendText;

                inputs.forEach(input => {
                    input.classList.remove('disabled');
                    input.disabled = false;
                    const lockIcon = input.nextElementSibling;
                    if (lockIcon) lockIcon.style.display = 'none';
                });
            }
        }, 1000);
    });

    function toggleMenu() {
        const navList = document.querySelector('.nav-list');
        navList.classList.toggle('active');
    }
});

