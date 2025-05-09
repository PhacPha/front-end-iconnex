// header.js
window.addEventListener('scroll', () => {
    const header = document.querySelector('header');
    header.classList.toggle('shrink', window.scrollY > 50);
});

function toggleMenu() {
    const burger = document.querySelector('.burger-menu');
    const navList = document.querySelector('.nav-list');
    const navItems = navList.querySelectorAll('li');

    burger.classList.toggle('active');
    navList.classList.toggle('active');

    if (navList.classList.contains('active')) {
        navItems.forEach((item, index) => {
            setTimeout(() => {
                item.style.opacity = '1';
                item.style.transform = 'translateY(0)';
            }, index * 100);
        });
        document.body.style.overflow = 'hidden';
    } else {
        navItems.forEach((item) => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(-20px)';
        });
        document.body.style.overflow = 'auto';
    }
}

document.addEventListener('click', (e) => {
    const burger = document.querySelector('.burger-menu');
    const navList = document.querySelector('.nav-list');
    if (!burger.contains(e.target) && !navList.contains(e.target) && navList.classList.contains('active')) {
        toggleMenu();
    }
});

// Particle Effect
document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('header');
    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');

    canvas.style.position = 'fixed';
    canvas.style.top = '0';
    canvas.style.left = '0';
    canvas.style.zIndex = '999';
    canvas.style.pointerEvents = 'none';
    document.body.appendChild(canvas);

    let particles = [];
    const particleCount = 30;

    class Particle {
        constructor() {
            this.x = Math.random() * window.innerWidth;
            this.y = Math.random() * -100;
            this.size = Math.random() * 2 + 1;
            this.speedX = (Math.random() - 0.5) * 1.5;
            this.speedY = Math.random() * 1.5 + 0.5;
            this.life = 1;
            this.color = `hsla(${Math.random() * 360}, 70%, 50%, ${this.life})`;
        }

        update() {
            this.x += this.speedX;
            this.y += this.speedY;
            this.life -= 0.015;
            this.color = `hsla(${Math.random() * 360}, 70%, 50%, ${this.life})`;
            if (this.y > window.innerHeight || this.x < 0 || this.x > window.innerWidth) this.reset();
        }

        draw() {
            ctx.fillStyle = this.color;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }

        reset() {
            this.x = Math.random() * window.innerWidth;
            this.y = Math.random() * -100;
            this.life = 1;
        }
    }

    function initParticles() {
        for (let i = 0; i < particleCount; i++) {
            particles.push(new Particle());
        }
    }

    function animateParticles() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        if (header.classList.contains('shrink')) {
            particles.forEach((particle, index) => {
                particle.update();
                particle.draw();
                if (particle.life <= 0) particles.splice(index, 1);
            });
            if (particles.length < particleCount) particles.push(new Particle());
        }
        requestAnimationFrame(animateParticles);
    }

    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }

    window.addEventListener('resize', resizeCanvas);
    initParticles();
    resizeCanvas();
    animateParticles();
});

// Cosmic Slider Animation
const cosmicSliders = document.querySelectorAll('.cosmic-slider');

cosmicSliders.forEach(slider => {
    const items = slider.querySelectorAll('.cosmic-item');
    const itemWidth = items[0].offsetWidth + 20;
    const totalWidth = itemWidth * items.length / 2;
    let currentPosition = 0;

    function animateSlider() {
        if (slider.classList.contains('top-slider')) {
            currentPosition -= 1.5;
            if (currentPosition <= -totalWidth) currentPosition = 0;
        } else if (slider.classList.contains('bottom-slider')) {
            currentPosition += 1.5;
            if (currentPosition >= totalWidth) currentPosition = 0;
        }

        items.forEach((item, index) => {
            const offset = (index * itemWidth + currentPosition) % totalWidth;
            const normalizedOffset = offset / totalWidth;
            const zDepth = Math.sin(normalizedOffset * Math.PI * 2) * 50;
            const scale = 1 + Math.sin(normalizedOffset * Math.PI * 2) * 0.2;
            item.style.transform = `translateX(${offset}px) translateZ(${zDepth}px) scale(${scale})`;
        });

        requestAnimationFrame(animateSlider);
    }

    animateSlider();
});

// Cosmic Particles
const cosmicCanvas = document.getElementById('cosmicParticles');
const cosmicCtx = cosmicCanvas.getContext('2d');
cosmicCanvas.width = window.innerWidth;
cosmicCanvas.height = 400;

const cosmicParticles = [];

class CosmicParticle {
    constructor() {
        this.x = Math.random() * cosmicCanvas.width;
        this.y = Math.random() * cosmicCanvas.height;
        this.size = Math.random() * 3 + 1;
        this.speedX = (Math.random() - 0.5) * 0.5;
        this.speedY = (Math.random() - 0.5) * 0.5;
        this.life = Math.random() * 0.5 + 0.5;
        this.color = `rgba(0, 212, 255, ${this.life})`;
    }

    update() {
        this.x += this.speedX;
        this.y += this.speedY;
        this.life -= 0.005;
        this.color = `rgba(0, 212, 255, ${this.life})`;
        if (this.x < 0 || this.x > cosmicCanvas.width) this.speedX *= -1;
        if (this.y < 0 || this.y > cosmicCanvas.height) this.speedY *= -1;
    }

    draw() {
        cosmicCtx.beginPath();
        cosmicCtx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        cosmicCtx.fillStyle = this.color;
        cosmicCtx.shadowBlur = 10;
        cosmicCtx.shadowColor = '#00aaff';
        cosmicCtx.fill();
    }
}

function initCosmicParticles() {
    for (let i = 0; i < 50; i++) {
        cosmicParticles.push(new CosmicParticle());
    }
}

function animateCosmicParticles() {
    cosmicCtx.clearRect(0, 0, cosmicCanvas.width, cosmicCanvas.height);
    cosmicParticles.forEach((p, index) => {
        p.update();
        p.draw();
        if (p.life <= 0) {
            cosmicParticles.splice(index, 1);
            cosmicParticles.push(new CosmicParticle());
        }
    });
    requestAnimationFrame(animateCosmicParticles);
}

initCosmicParticles();
animateCosmicParticles();

window.addEventListener('resize', () => {
    cosmicCanvas.width = window.innerWidth;
    cosmicCanvas.height = 400;
});

function toggleMenu() {
    const burger = document.querySelector('.burger-menu');
    const navList = document.querySelector('.nav-list');
    const navItems = navList.querySelectorAll('li');

    burger.classList.toggle('active');
    navList.classList.toggle('active');

    if (navList.classList.contains('active')) {
        navItems.forEach((item, index) => {
            setTimeout(() => {
                item.style.opacity = '1';
                item.style.transform = 'translateY(0) scale(1)'; // ปรับให้สอดคล้องกับ CSS
            }, index * 100 + 200); // ดีเลย์เพิ่ม 200ms เพื่อรอให้กระดาษคลายก่อน
        });
        document.body.style.overflow = 'hidden';
    } else {
        navItems.forEach((item) => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(-10px) scale(0.9)'; // กลับไปเหมือนพับ
        });
        document.body.style.overflow = 'auto';
    }
}