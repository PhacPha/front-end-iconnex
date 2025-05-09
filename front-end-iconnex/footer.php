<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer - ICONNEX THAILAND</title>
    <link rel="stylesheet" href="footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="footer.js" defer></script>
</head>

<body>
    <?php
    require_once 'db_connect.php';
    ?>
    <footer>
        <div class="footer-container">
            <div class="footer-column brand-info">
                <h2>ICONNEX THAILAND</h2>
                <p>ในยุคเทคโนโลยี Iconnex Thailand มุ่งมั่นนำธุรกิจไทยสู่เวทีโลก ด้วยการตลาดดิจิทัลและส่งเสริมการค้า
                    เรามองอนาคตด้วยความภาคภูมิใจในพันธกิจของเรา</p>
                <div class="social-icons">
                    <a href="https://www.facebook.com/IconnexTH" class="social-icon" target="_blank"
                        aria-label="Facebook"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/iconnex.pr/" class="social-icon" target="_blank"
                        aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.youtube.com/@IconnexTH/featured" class="social-icon" target="_blank"
                        aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    <a href="https://www.linkedin.com/company/iconnex-thailand" class="social-icon" target="_blank"
                        aria-label="LinkedIn"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
            <div class="footer-column pages">
                <h3>Pages</h3>
                <ul>
                    <li><a href="index">Home</a></li>
                    <li><a href="about">About</a></li>
                    <li><a href="service">Service</a></li>
                    <li><a href="content">Content</a></li>
                    <li><a href="contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-column follow-us">
                <h3>Follow Us On Facebook</h3>
                <div class="facebook-posts">
                    <a href="https://www.facebook.com/IconnexTH" target="_blank"><img src="img/facebook-post1.jpg" alt="โพสต์ Facebook ล่าสุด 1"></a>
                    <a href="https://www.facebook.com/IconnexTH" target="_blank"><img src="img/facebook-post2.jpg" alt="โพสต์ Facebook ล่าสุด 2"></a>
                    <a href="https://www.facebook.com/IconnexTH" target="_blank"><img src="img/facebook-post3.jpg" alt="โพสต์ Facebook ล่าสุด 3"></a>
                    <a href="https://www.facebook.com/IconnexTH" target="_blank"><img src="img/facebook-post4.jpg" alt="โพสต์ Facebook ล่าสุด 4"></a>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>Copyright © 2025 Iconnex Thailand Developer. All Rights Reserved.</p>
        </div>
    </footer>
</body>
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Iconnex Thailand",
  "url": "https://www.iconnexthailand.com",
  "sameAs": [
    "https://www.facebook.com/IconnexTH",
    "https://www.instagram.com/iconnex.pr/",
    "https://www.youtube.com/@IconnexTH/featured",
    "https://www.linkedin.com/company/iconnex-thailand"
  ]
}
</script>
</html>