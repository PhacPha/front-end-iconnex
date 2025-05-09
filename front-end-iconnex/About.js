document.addEventListener("DOMContentLoaded", () => {
    console.log("About page loaded");

    // Fetch Header and Footer
    fetch("header.html")
        .then(response => response.text())
        .then(data => document.getElementById("header-placeholder").innerHTML = data)
        .catch(error => console.error('Error loading header:', error));

    fetch("footer.html")
        .then(response => response.text())
        .then(data => document.getElementById("footer-placeholder").innerHTML = data)
        .catch(error => console.error('Error loading footer:', error));

    // Fade-in Animation
    const fadeElements = document.querySelectorAll('.fade-in');
    const observerOptions = { root: null, rootMargin: '0px', threshold: 0.1 };
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);
    fadeElements.forEach(element => observer.observe(element));

    // Skill Bar Animation with Counter
    const skillBars = document.querySelectorAll('.bar');
    const skillObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const progressSpan = entry.target.querySelector('.progress-line span');
                const counterSpan = entry.target.querySelector('.counter');
                const percentage = parseInt(progressSpan.getAttribute('data-percentage'));
                console.log(`Setting width for ${entry.target.querySelector('.info span').textContent} to ${percentage}%`);

                if (progressSpan && counterSpan) {
                    setTimeout(() => {
                        progressSpan.style.width = `${percentage}%`;

                        let count = 0;
                        const duration = 1500;
                        const increment = percentage / (duration / 16);

                        const updateCounter = () => {
                            count += increment;
                            if (count >= percentage) {
                                counterSpan.textContent = `${percentage}%`;
                            } else {
                                counterSpan.textContent = `${Math.round(count)}%`;
                                requestAnimationFrame(updateCounter);
                            }
                        };

                        requestAnimationFrame(updateCounter);
                    }, 500);
                }
                skillObserver.unobserve(entry.target);
            }
        });
    }, observerOptions);
    skillBars.forEach(bar => skillObserver.observe(bar));

    // Video Popup
    const mp4Video = document.getElementById('mp4-video');
    const facebookVideo = document.getElementById('facebook-video');
    const videoButton = document.querySelector('.video-button');
    const videoPopup = document.getElementById('video-popup');
    const closeButton = document.querySelector('.close-button');

    if (videoButton && videoPopup && closeButton && mp4Video && facebookVideo) {
        const openVideoPopup = () => {
            videoPopup.style.display = 'flex';
            videoPopup.classList.add('active');
            videoPopup.classList.remove('inactive');
            facebookVideo.classList.remove('hidden');
            mp4Video.classList.add('hidden');
            mp4Video.pause();
            mp4Video.currentTime = 0;
            const baseSrc = "https://www.facebook.com/plugins/video.php?height=314&href=https%3A%2F%2Fwww.facebook.com%2FIconnexTH%2Fvideos%2F2007543403024465%2F&show_text=false&width=560&t=0";
            facebookVideo.src = baseSrc + '&autoplay=1&mute=0';
        };

        const closeVideoPopup = () => {
            videoPopup.classList.remove('active');
            videoPopup.classList.add('inactive');
            if (mp4Video) {
                mp4Video.pause();
                mp4Video.currentTime = 0;
            }
            if (facebookVideo) {
                facebookVideo.src = '';
                facebookVideo.classList.add('hidden');
            }
            setTimeout(() => videoPopup.style.display = 'none', 300);
        };

        videoButton.addEventListener('click', openVideoPopup);
        closeButton.addEventListener('click', closeVideoPopup);
        window.addEventListener('click', (event) => {
            if (event.target === videoPopup) closeVideoPopup();
        });
    } else {
        console.error("Video popup elements missing");
    }

    // Hover Effects for Interactive Elements
    const interactiveElements = document.querySelectorAll('.stat-box, .testimonial-card');
    interactiveElements.forEach(element => {
        element.addEventListener('mouseenter', () => {
            element.style.backgroundColor = '#E0F7FA';
            element.style.transition = 'background-color 0.3s ease';
            const headings = element.querySelectorAll('h2, .testimonial-quote');
            const texts = element.querySelectorAll('p, .testimonial-text, .author-name, .author-location');
            headings.forEach(h => h.style.color = '#00A1D6');
            texts.forEach(t => t.style.color = '#000000');
        });
        element.addEventListener('mouseleave', () => {
            element.style.backgroundColor = '';
            const headings = element.querySelectorAll('h2, .testimonial-quote');
            const texts = element.querySelectorAll('p, .testimonial-text, .author-name, .author-location');
            headings.forEach(h => h.style.color = '');
            texts.forEach(t => t.style.color = '');
        });
    });

    // Interactive Background with Particles
    const canvas = document.createElement('canvas');
    canvas.id = 'interactive-background';
    document.body.insertBefore(canvas, document.body.firstChild);

    const ctx = canvas.getContext('2d');
    let width = window.innerWidth;
    let height = window.innerHeight;
    canvas.width = width;
    canvas.height = height;
    canvas.style.position = 'fixed';
    canvas.style.top = '0';
    canvas.style.left = '0';
    canvas.style.zIndex = '-1';

    const particlesArray = [];
    const baseNumberOfParticles = 50;
    const maxParticles = 100;
    const minParticles = 30;

    const cShapePoints = [];
    const radius = 60;
    const centerX = 60;
    const centerY = 80;
    const startAngle = Math.PI * 0.25;
    const endAngle = Math.PI * 1.75;
    const steps = 60;

    for (let i = 0; i <= steps; i++) {
        const angle = startAngle + (endAngle - startAngle) * (i / steps);
        const x = centerX + radius * Math.cos(angle);
        const y = centerY + radius * Math.sin(angle);
        cShapePoints.push({ x: x, y: y });
    }

    class Particle {
        constructor() {
            this.x = Math.random() * width;
            this.y = Math.random() * height;
            this.size = Math.random() * 2.5 + 1;
            this.speedX = Math.random() * 0.4 - 0.2;
            this.speedY = Math.random() * 0.4 - 0.2;
            this.targetIndex = Math.floor(Math.random() * cShapePoints.length);
            this.scatter = false;
            this.opacity = 0.8;
        }

        update() {
            if (this.scatter) {
                this.x += this.speedX * 5;
                this.y += this.speedY * 5;
                this.opacity = Math.max(0.1, this.opacity - 0.03);
                if (this.x > width || this.x < 0) this.speedX = -this.speedX * 0.8;
                if (this.y > height || this.y < 0) this.speedY = -this.speedY * 0.8;
            } else {
                this.x += this.speedX;
                this.y += this.speedY;
                this.opacity = Math.min(1, this.opacity + 0.02);
                if (mouse.x !== undefined && mouse.y !== undefined) {
                    const targetX = mouse.x + cShapePoints[this.targetIndex].x - centerX;
                    const targetY = mouse.y + cShapePoints[this.targetIndex].y - centerY;
                    const dx = targetX - this.x;
                    const dy = targetY - this.y;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    if (distance > 5) {
                        this.x += dx * 0.05;
                        this.y += dy * 0.05;
                    }
                }
            }
        }

        draw() {
            ctx.fillStyle = `rgba(0, 161, 214, ${this.opacity})`;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }

        scatterParticle() {
            this.scatter = true;
            this.speedX = (Math.random() * 4 - 2);
            this.speedY = (Math.random() * 4 - 2);
            setTimeout(() => {
                this.scatter = false;
                this.speedX = Math.random() * 0.4 - 0.2;
                this.speedY = Math.random() * 0.4 - 0.2;
            }, 0);
        }
    }

    function init() {
        particlesArray.length = 0;
        const targetCount = particlesArray.length < minParticles ? baseNumberOfParticles : particlesArray.length;
        for (let i = 0; i < targetCount; i++) {
            particlesArray.push(new Particle());
        }
    }

    function adjustParticleCount() {
        if (mouse.x !== undefined && mouse.y !== undefined && mouse.speed <= 20) {
            if (particlesArray.length < maxParticles) {
                particlesArray.push(new Particle());
            }
        } else if (mouse.speed > 20) {
            if (particlesArray.length > minParticles) {
                particlesArray.splice(0, 1);
            }
        }
    }

    function animate() {
        ctx.clearRect(0, 0, width, height);
        adjustParticleCount();
        for (let i = 0; i < particlesArray.length; i++) {
            particlesArray[i].update();
            particlesArray[i].draw();
            for (let j = i; j < particlesArray.length; j++) {
                const dx = particlesArray[i].x - particlesArray[j].x;
                const dy = particlesArray[i].y - particlesArray[j].y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                if (distance < 80) {
                    ctx.beginPath();
                    ctx.strokeStyle = 'rgba(0, 161, 214, 0.15)';
                    ctx.lineWidth = 1;
                    ctx.moveTo(particlesArray[i].x, particlesArray[i].y);
                    ctx.lineTo(particlesArray[j].x, particlesArray[j].y);
                    ctx.stroke();
                }
            }
        }
        requestAnimationFrame(animate);
    }

    const mouse = {
        x: undefined,
        y: undefined,
        lastX: undefined,
        lastY: undefined,
        speed: 0
    };

    window.addEventListener('mousemove', (event) => {
        mouse.x = event.x;
        mouse.y = event.y;
        if (mouse.lastX !== undefined && mouse.lastY !== undefined) {
            const dx = mouse.x - mouse.lastX;
            const dy = mouse.y - mouse.lastY;
            mouse.speed = Math.sqrt(dx * dx + dy * dy);
            if (mouse.speed > 30) {
                particlesArray.forEach(particle => particle.scatterParticle());
            }
        }
        mouse.lastX = mouse.x;
        mouse.lastY = mouse.y;
    });

    window.addEventListener('resize', () => {
        width = window.innerWidth;
        height = window.innerHeight;
        canvas.width = width;
        canvas.height = height;
        init();
    });

    window.addEventListener('touchmove', (event) => {
        mouse.x = event.touches[0].clientX;
        mouse.y = event.touches[0].clientY;
        if (mouse.lastX !== undefined && mouse.lastY !== undefined) {
            const dx = mouse.x - mouse.lastX;
            const dy = mouse.y - mouse.lastY;
            mouse.speed = Math.sqrt(dx * dx + dy * dy);
            if (mouse.speed > 20) {
                particlesArray.forEach(particle => particle.scatterParticle());
            }
        }
        mouse.lastX = mouse.x; 
        mouse.lastY = mouse.y;
    });

    window.addEventListener('mouseleave', () => {
        mouse.x = undefined;
        mouse.y = undefined;
        mouse.lastX = undefined;
        mouse.lastY = undefined;
    });

    init();
    animate();
});