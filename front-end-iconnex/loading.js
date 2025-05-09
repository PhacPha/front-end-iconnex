// loading.js

function initializeLoadingScreen() {
    const loadingScreen = document.getElementById('loading-screen');
    const loadingVideo = document.getElementById('loading-video');
    const mainContent = document.getElementById('main-content');
    const transitionCanvas = document.getElementById('transition-canvas');
    const transitionCtx = transitionCanvas.getContext('2d');

    // ตั้งค่าขนาด canvas
    transitionCanvas.width = window.innerWidth;
    transitionCanvas.height = window.innerHeight;

    // ฟังก์ชันเล่นวิดีโอสำหรับหน้าโหลด
    function playVideoSegment() {
        loadingVideo.currentTime = 0;
        loadingVideo.play();
        setTimeout(() => {
            loadingVideo.pause();
            playVideoSegment();
        }, 3000);
    }

    // ฟังก์ชันจัดการเอฟเฟกต์ Swirl Particles
    function createSwirlEffect() {
        const swirlParticles = [];

        class SwirlParticle {
            constructor() {
                this.x = window.innerWidth / 2;
                this.y = window.innerHeight / 2;
                this.radius = Math.random() * 5 + 2;
                this.angle = Math.random() * Math.PI * 2;
                this.speed = Math.random() * 5 + 2;
                this.life = 1;
                this.color = `rgba(0, 212, 255, ${this.life})`;
            }
            update() {
                this.angle += 0.1;
                this.x += Math.cos(this.angle) * this.speed;
                this.y += Math.sin(this.angle) * this.speed;
                this.life -= 0.02;
                this.color = `rgba(0, 212, 255, ${this.life})`;
                this.radius += 0.2;
            }
            draw() {
                transitionCtx.beginPath();
                transitionCtx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
                transitionCtx.fillStyle = this.color;
                transitionCtx.fill();
            }
        }

        for (let i = 0; i < 150; i++) {
            swirlParticles.push(new SwirlParticle());
        }

        function animateSwirl() {
            transitionCtx.clearRect(0, 0, transitionCanvas.width, transitionCanvas.height);
            swirlParticles.forEach(p => {
                p.update();
                p.draw();
            });
            for (let i = swirlParticles.length - 1; i >= 0; i--) {
                if (swirlParticles[i].life <= 0) {
                    swirlParticles.splice(i, 1);
                }
            }
            if (swirlParticles.length > 0) {
                requestAnimationFrame(animateSwirl);
            }
        }

        animateSwirl();
    }

    // ตรวจสอบสถานะว่าเคยโหลดแล้วหรือไม่
    window.addEventListener('load', () => {
        const hasLoaded = sessionStorage.getItem('hasLoaded');

        if (!hasLoaded) {
            // ถ้ายังไม่เคยโหลด ให้แสดง loading screen
            playVideoSegment();

            setTimeout(() => {
                loadingVideo.style.transform = 'scale(1.5)';
                loadingVideo.style.filter = 'blur(10px)';

                createSwirlEffect();

                setTimeout(() => {
                    loadingScreen.classList.add('fade-out');
                    mainContent.style.display = 'block';
                    setTimeout(() => {
                        mainContent.classList.add('loaded');
                    }, 50);
                }, 1000);

                setTimeout(() => {
                    loadingScreen.style.display = 'none';
                    // ตั้งค่าสถานะว่าโหลดเสร็จแล้ว
                    sessionStorage.setItem('hasLoaded', 'true');
                }, 2000);
            }, 5000);
        } else {
            // ถ้าเคยโหลดแล้ว ข้าม loading screen และแสดงเนื้อหาทันที
            loadingScreen.style.display = 'none';
            mainContent.style.display = 'block';
            mainContent.classList.add('loaded');
        }
    });
}

// เรียกใช้งานฟังก์ชันทันทีเมื่อโหลดไฟล์
initializeLoadingScreen();