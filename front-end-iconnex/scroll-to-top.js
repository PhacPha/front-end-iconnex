/* 
วิธีใช้งาน  

        <button id="scrollToTopBtn" class="scroll-to-top" aria-label="เลื่อนขึ้นด้านบน">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M12 19V5M5 12l7-7 7 7" />
            </svg>
        </button>

เอาไว้ด่านล่างสุด แต่ยังต้องอยู่ใน body 
*/

document.addEventListener('DOMContentLoaded', function () {
    const scrollToTopBtn = document.getElementById('scrollToTopBtn');

    // แสดง/ซ่อนปุ่มเมื่อเลื่อนหน้า
    window.addEventListener('scroll', function () {
        if (window.scrollY > 300) {
            scrollToTopBtn.classList.add('visible');
        } else {
            scrollToTopBtn.classList.remove('visible');
        }
    });

    // เลื่อนไปด้านบนเมื่อคลิก
    scrollToTopBtn.addEventListener('click', function () {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});