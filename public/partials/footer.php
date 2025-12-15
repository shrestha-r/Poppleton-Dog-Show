<!-- footer.php -->
<footer class="site-footer">
    <div class="footer-inner">
        <div class="footer-left">
            <p>&copy; <?= date('Y') ?> <?= APP_NAME ?>. All rights reserved.</p>
            <p class="author">Built with ❤️ by <strong><?= htmlspecialchars($author ?? 'Rahul Shrestha') ?></strong></p>
        </div>

        <nav class="footer-nav">
            <a href="<?= APP_URL ?>/public/01_index.php">Home</a>
            <a href="<?= APP_URL ?>/public/02_about.php">About</a>
            <a href="<?= APP_URL ?>/public/04_contact.php">Contact</a>
        </nav>

        <div class="footer-right">
            <p>Follow us</p>
            <div class="social">
                <a href="#" aria-label="Facebook">📘</a>
                <a href="#" aria-label="Instagram">📷</a>
                <a href="https://github.com/shrestha-r" aria-label="Twitter">🐦</a>
            </div>
        </div>
    </div>
</footer>