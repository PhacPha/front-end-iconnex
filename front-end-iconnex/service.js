// รอให้หน้าเว็บโหลดเสร็จก่อนรันโค้ด
document.addEventListener('DOMContentLoaded', () => {
    // ดึง canvas สำหรับ Hero Section
    const heroCanvas = document.getElementById('particleCanvas');
    const heroCtx = heroCanvas.getContext('2d');
    heroCanvas.width = window.innerWidth; // ความกว้างเต็มหน้าจอ
    heroCanvas.height = window.innerHeight; // ความสูงเต็มหน้าจอ

    // ดึง canvas สำหรับ Contact Section
    const contactCanvas = document.getElementById('contactParticleCanvas');
    const contactCtx = contactCanvas.getContext('2d');
    contactCanvas.width = window.innerWidth; // ความกว้างเต็มหน้าจอ
    contactCanvas.height = document.querySelector('.contact-button-section').offsetHeight; // ความสูงตาม section

    // อาร์เรย์สำหรับเก็บอนุภาค
    const particles = []; // สำหรับ Hero Section
    const contactParticles = []; // สำหรับ Contact Section
    const particleCount = 50; // จำนวนอนุภาค

    // คลาสสำหรับสร้างอนุภาค
    class Particle {
        constructor(canvasWidth, canvasHeight) {
            this.x = Math.random() * canvasWidth; // ตำแหน่ง x แบบสุ่ม
            this.y = Math.random() * canvasHeight; // ตำแหน่ง y แบบสุ่ม
            this.size = Math.random() * 2 + 1; // ขนาดอนุภาค (1-3 พิกเซล)
            this.speedX = (Math.random() - 0.5) * 1; // ความเร็วในแนว x
            this.speedY = (Math.random() - 0.5) * 1; // ความเร็วในแนว y
        }
        // อัปเดตตำแหน่งอนุภาค
        update(canvasWidth, canvasHeight) {
            this.x += this.speedX;
            this.y += this.speedY;
            // เด้งกลับเมื่อชนขอบ
            if (this.x < 0 || this.x > canvasWidth) this.speedX *= -1;
            if (this.y < 0 || this.y > canvasHeight) this.speedY *= -1;
        }
        // วาดอนุภาคลงบน canvas
        draw(ctx) {
            ctx.fillStyle = 'rgba(0, 170, 255, 0.8)'; // สีน้ำเงินโปร่งแสง
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2); // วาดวงกลม
            ctx.fill();
        }
    }

    // ฟังก์ชันสร้างอนุภาคเริ่มต้น
    function initParticles(targetArray, canvasWidth, canvasHeight) {
        for (let i = 0; i < particleCount; i++) {
            targetArray.push(new Particle(canvasWidth, canvasHeight));
        }
    }

    // ฟังก์ชันแอนิเมชันอนุภาค
    function animateParticles(ctx, particleArray, canvasWidth, canvasHeight) {
        ctx.clearRect(0, 0, canvasWidth, canvasHeight); // ล้าง canvas
        particleArray.forEach(p => {
            p.update(canvasWidth, canvasHeight); // อัปเดตตำแหน่ง
            p.draw(ctx); // วาดอนุภาค
        });
        requestAnimationFrame(() => animateParticles(ctx, particleArray, canvasWidth, canvasHeight)); // เรียกซ้ำเพื่อแอนิเมชัน
    }

    // ปรับขนาด canvas เมื่อหน้าต่างเปลี่ยนขนาด (responsive)
    window.addEventListener('resize', () => {
        heroCanvas.width = window.innerWidth; // ปรับความกว้าง Hero Canvas
        heroCanvas.height = window.innerHeight; // ปรับความสูง Hero Canvas
        contactCanvas.width = window.innerWidth; // ปรับความกว้าง Contact Canvas
        contactCanvas.height = document.querySelector('.contact-button-section').offsetHeight; // ปรับความสูงตาม section
        // รีเซ็ตและสร้างอนุภาคใหม่เมื่อ resize
        particles.length = 0;
        contactParticles.length = 0;
        initParticles(particles, heroCanvas.width, heroCanvas.height);
        initParticles(contactParticles, contactCanvas.width, contactCanvas.height);
    });

    // เริ่มต้นและรันแอนิเมชันสำหรับ Hero Section
    initParticles(particles, heroCanvas.width, heroCanvas.height);
    animateParticles(heroCtx, particles, heroCanvas.width, heroCanvas.height);

    // เริ่มต้นและรันแอนิเมชันสำหรับ Contact Section
    initParticles(contactParticles, contactCanvas.width, contactCanvas.height);
    animateParticles(contactCtx, contactParticles, contactCanvas.width, contactCanvas.height);

    // ฟังก์ชันเลื่อนไปยังส่วน Services
    window.scrollToServices = () => {
        document.getElementById('services').scrollIntoView({ behavior: 'smooth' });
    };

    // ฟังก์ชันเปิดโมดัลติดต่อ
    window.openContactModal = () => {
        document.getElementById('contactModal').style.display = 'flex';
    };

    // ฟังก์ชันปิดโมดัลติดต่อ
    window.closeContactModal = () => {
        document.getElementById('contactModal').style.display = 'none';
    };

    // จัดการการส่งฟอร์มติดต่อ
    const contactForm = document.getElementById('contactForm');
    contactForm.addEventListener('submit', (e) => {
        e.preventDefault(); // ป้องกันการรีเฟรชหน้า
        alert('ขอบคุณที่ติดต่อเรา! ทีมงานจะติดต่อกลับโดยเร็วที่สุด');
        contactForm.reset(); // ล้างฟอร์ม
        closeContactModal(); // ปิดโมดัล
    });
});