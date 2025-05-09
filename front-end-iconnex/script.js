// Loading Screen Logic
const mainContent = document.getElementById('main-content');
const transitionCanvas = document.getElementById('transition-canvas');
const transitionCtx = transitionCanvas.getContext('2d');
transitionCanvas.width = window.innerWidth;
transitionCanvas.height = window.innerHeight;

// Header Shrink on Scroll
function throttle(func, limit) {
    let inThrottle;
    return function() {
        if (!inThrottle) {
            func.apply(this, arguments);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

window.addEventListener('scroll', throttle(() => {
    const header = document.querySelector('header');
    if (window.scrollY > 50) {
        header.classList.add('shrink');
    } else {
        header.classList.remove('shrink');
    }
}, 100));

// Toggle Burger Menu
function toggleMenu() {
    const burger = document.querySelector('.burger-menu');
    const navList = document.querySelector('.nav-list');
    burger.classList.toggle('active');
    navList.classList.toggle('active');
}

// Particle Canvas
const canvas = document.getElementById("particleCanvas");
const ctx = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

const particles = [];
const mouse = { x: null, y: null, radius: 300 };

class Particle {
    constructor(x, y, dx, dy, size) {
        this.x = x;
        this.y = y;
        this.dx = dx;
        this.dy = dy;
        this.size = size;
    }
    draw() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fillStyle = "rgba(255, 255, 255, 0.8)";
        ctx.fill();
    }
    update() {
        if (this.x + this.size > canvas.width || this.x - this.size < 0) this.dx = -this.dx;
        if (this.y + this.size > canvas.height || this.y - this.size < 0) this.dy = -this.dy;
        this.x += this.dx;
        this.y += this.dy;
        this.draw();
    }
}

function init() {
    particles.length = 0;
    for (let i = 0; i < 35; i++) {
        let size = Math.random() * 3;
        let x = Math.random() * canvas.width;
        let y = Math.random() * canvas.height;
        let dx = (Math.random() - 0.5) * 0.8;
        let dy = (Math.random() - 0.5) * 0.8;
        particles.push(new Particle(x, y, dx, dy, size));
    }
}

function drawLines() {
    ctx.strokeStyle = "rgba(255, 255, 255, 0.2)";
    ctx.lineWidth = 1;
    for (let i = 0; i < particles.length; i++) {
        for (let j = i + 1; j < particles.length; j++) {
            let dx = particles[i].x - particles[j].x;
            let dy = particles[i].y - particles[j].y;
            let distance = Math.sqrt(dx * dx + dy * dy);
            if (distance < 150) {
                ctx.beginPath();
                ctx.moveTo(particles[i].x, particles[i].y);
                ctx.lineTo(particles[j].x, particles[j].y);
                ctx.stroke();
            }
        }
    }
    particles.forEach(particle => {
        let dx = particle.x - mouse.x;
        let dy = particle.y - mouse.y;
        let distance = Math.sqrt(dx * dx + dy * dy);
        if (distance < mouse.radius && mouse.x && mouse.y) {
            ctx.beginPath();
            ctx.moveTo(particle.x, particle.y);
            ctx.lineTo(mouse.x, mouse.y);
            ctx.stroke();
        }
    });
}

function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    particles.forEach(p => p.update());
    drawLines();
    requestAnimationFrame(animate);
}

window.addEventListener("mousemove", (event) => {
    mouse.x = event.x;
    mouse.y = event.y;
});

window.addEventListener("resize", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    init();
});

init();
animate();

// Glitch Effect
function getRandomBlinkTime() {
    return Math.random() * 150 + 20; // 20-170ms
}

function flickerEffect() {
    const text = document.getElementById("glitchText");
    const state = Math.random();
    if (state < 0.4) {
        text.style.opacity = "1";
        text.style.transform = "translate(0, 0)";
        text.style.textShadow = "0 0 5px #00aaff, 0 0 10px #0077cc";
    } else if (state < 0.7) {
        text.style.opacity = "0.3";
        text.style.transform = "translate(0, 0)";
        text.style.textShadow = "0 0 2px #00aaff";
    } else {
        text.style.opacity = "0.8";
        text.style.transform = `translate(${Math.random() * 10 - 5}px, ${Math.random() * 10 - 5}px)`;
        text.style.textShadow = "0 0 15px #00ccff, 0 0 25px #00ffdd, 0 0 5px #ff0000";
    }
    setTimeout(flickerEffect, getRandomBlinkTime());
}

setTimeout(flickerEffect, getRandomBlinkTime());

// Typing Effect for Dynamic Text
const dynamicText = document.getElementById("dynamic-text");
const phrases = [
    "เก่งรอบด้านอย่างมืออาชีพ",
    "มีทีมครีเอทีฟที่พร้อมลุย",
    "มีกลยุทธ์เด่นไม่เหมือนใคร",
    "มีแผนธุรกิจที่ดีเยี่ยม",
    "เจาะกลุ่มแม่นยำทุกครั้ง",
    "กำหนดกลุ่มชัดเจนยิ่งขึ้น",
    "มีเนื้อหาดีดึงดูดใจ",
    "สร้างเนื้อหาเฉพาะกลุ่มได้ลงตัว",
    "วางงบประมาณดีมีประสิทธิภาพ",
    "กำหนดเวลาได้คุ้มค่าทุกนาที",
    "วิเคราะห์ผลได้ดีขึ้นทุกวัน",
    "ตามเทรนด์ทันสมัยตลอด",
    "มียอดขายได้อย่างมั่นใจ",
    "มีสัมพันธ์ดีกับลูกค้า",
    "มีกำไรสูงสุดในฝันของคุณ",
    "เติบโตมั่นคงแบบยั่งยืน",
    "มีศักยภาพที่ดีเยี่ยม",
    "บรรลุเป้าหมายไวทันใจคุณ"
];
let phraseIndex = 0;
let charIndex = 0;
let isDeleting = false;

async function typeEffect() {
    const currentPhrase = phrases[phraseIndex];
    dynamicText.textContent = currentPhrase.substring(0, charIndex);

    if (!isDeleting && charIndex < currentPhrase.length) {
        charIndex++;
        await new Promise(resolve => setTimeout(resolve, 100));
    } else if (isDeleting && charIndex > 0) {
        charIndex--;
        await new Promise(resolve => setTimeout(resolve, 50));
    } else {
        isDeleting = !isDeleting;
        if (!isDeleting) phraseIndex = (phraseIndex + 1) % phrases.length;
        await new Promise(resolve => setTimeout(resolve, 1000));
    }
    typeEffect();
}

typeEffect();

// Modal Functions
function closeModal() {
    document.getElementById('modal').style.display = "none";
}

window.addEventListener('click', function(event) {
    const modal = document.getElementById('modal');
    if (event.target === modal) {
        modal.style.display = "none";
    }
});

// Fade-in Observer
document.addEventListener("DOMContentLoaded", () => {
    const fadeElements = document.querySelectorAll(".fade-in");
    const observerOptions = {
        threshold: 0.3,
        rootMargin: "0px"
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach((entry) => {
            if (entry.isIntersecting) {
                entry.target.classList.add("visible");
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    fadeElements.forEach((el) => observer.observe(el));
});

// Meteor Shower Effect
document.addEventListener("DOMContentLoaded", () => {
    const worksSection = document.querySelector(".works-section");
    const maxMeteors = 10;
    let activeMeteors = 0;

    const createMeteor = () => {
        if (activeMeteors >= maxMeteors) return;

        const meteor = document.createElement("div");
        meteor.classList.add("meteor");

        const size = Math.random() * 2 + 1;
        const angle = Math.random() * 20 + 20;
        const duration = Math.random() * 2 + 1;
        const translateX = Math.random() * 200 + 200;
        const translateY = Math.random() * 300 + 400;

        meteor.style.setProperty("--size", `${size}px`);
        meteor.style.setProperty("--angle", `${angle}deg`);
        meteor.style.setProperty("--duration", `${duration}s`);
        meteor.style.setProperty("--translateX", `${translateX}px`);
        meteor.style.setProperty("--translateY", `${translateY}px`);

        const startX = Math.random() * (worksSection.offsetWidth - 60);
        const startY = -20;
        meteor.style.left = `${startX}px`;
        meteor.style.top = `${startY}px`;

        if (duration < 1.5) {
            meteor.classList.add("fast");
        }

        worksSection.appendChild(meteor);
        activeMeteors++;

        meteor.addEventListener("animationend", () => {
            meteor.remove();
            activeMeteors--;
            setTimeout(createMeteor, Math.random() * 1000 + 500);
        });

        if (duration < 1.5) {
            setTimeout(createMeteor, Math.random() * 3000 + 2000);
        } else {
            setTimeout(createMeteor, Math.random() * 1500 + 500);
        }
    };

    for (let i = 0; i < 3; i++) {
        setTimeout(createMeteor, Math.random() * 1000);
    }
});

// เพิ่มใน script.js หลังจากส่วนที่มีอยู่แล้ว

// Logos Slider Animation
document.addEventListener('DOMContentLoaded', () => {
    const logosSlider = document.querySelector('.logos-slider');

    // ฟังก์ชันสำหรับรีเซ็ตการเลื่อนแบบ seamless
    function resetSlider() {
        const sliderWidth = logosSlider.scrollWidth; // ความกว้างของ slider
        const containerWidth = logosSlider.parentElement.offsetWidth; // ความกว้างของ container
        if (logosSlider.getBoundingClientRect().right <= containerWidth) {
            logosSlider.style.transition = 'none'; // ปิด transition ชั่วคราว
            logosSlider.style.transform = 'translateX(0)'; // รีเซ็ตตำแหน่ง
            setTimeout(() => {
                logosSlider.style.transition = 'transform 40s linear'; // กลับมาใช้ transition เดิม
            }, 0);
        }
    }

    // เริ่ม animation
    logosSlider.style.transition = 'transform 40s linear'; // ตั้งค่า transition ให้ช้า

    // ตรวจสอบการเลื่อนทุก frame
    function checkPosition() {
        requestAnimationFrame(checkPosition);
        resetSlider();
    }
    checkPosition();

    // หยุดการเลื่อนเมื่อ hover (แต่ไม่กระทบความเร็วเมื่อเลิก hover)
    logosSlider.addEventListener('mouseenter', () => {
        logosSlider.style.transition = 'none'; // หยุดการเลื่อนชั่วคราว
    });

    logosSlider.addEventListener('mouseleave', () => {
        logosSlider.style.transition = 'transform 40s linear'; // กลับมาเลื่อนด้วยความเร็วปกติ
        resetSlider(); // รีเซ็ตตำแหน่งถ้าจำเป็น
    });
});

// Scroll to Top Button Logic
const scrollToTopBtn = document.getElementById('scrollToTopBtn');

// แสดง/ซ่อนปุ่มตามตำแหน่งการเลื่อน
window.addEventListener('scroll', throttle(() => {
    if (window.scrollY > 300) { // แสดงปุ่มเมื่อเลื่อนลงเกิน 300px
        scrollToTopBtn.classList.add('visible');
    } else {
        scrollToTopBtn.classList.remove('visible');
    }
}, 100));

// เลื่อนขึ้นด้านบนเมื่อคลิก
scrollToTopBtn.addEventListener('click', () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth' // เลื่อนแบบนุ่มนวล
    });
});

