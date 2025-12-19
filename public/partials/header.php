<!-- header.php -->
<header class="site-header">
    <div class="header-inner">
        <!-- Logo -->
        <a href="<?= APP_URL ?>/public/01_index.php" class="logo">
            <span class="logo-emoji">&#x1F43E;</span>
        </a>

        <!-- Navigation -->
        <nav class="main-nav">
            <a href="<?= APP_URL ?>/public/01_index.php">Home</a>
            <a href="<?= APP_URL ?>/public/02_about.php">About</a>
            <a href="<?= APP_URL ?>/public/03_dogs.php">Dogs</a>
            <a href="<?= APP_URL ?>/public/04_contact.php">Contact</a>
        </nav>

        <!-- Account -->
        <div class="account-area">
            <?php if (isset($_SESSION['user_id'])): ?>
                <button class="account-toggle">Account ▾</button>
                <ul class="account-dropdown">
                    <li><a href="<?= APP_URL ?>/public/auth/04_profile.php">Profile</a></li>
                    <li><a href="<?= APP_URL ?>/public/auth/03_logout.php">Logout</a></li>
                </ul>
            <?php else: ?>
                <a class="auth-link" href="<?= APP_URL ?>/public/auth/01_login.php">Login</a> |
                <a class="auth-link" href="<?= APP_URL ?>/public/auth/02_register.php">Register</a>
            <?php endif; ?>
        </div>

        <!-- Hamburger -->
        <button class="hamburger" aria-label="Toggle navigation">☰</button>
    </div>

    <!-- Mobile Nav (slide-down) -->
    <nav class="mobile-nav">
        <a href="<?= APP_URL ?>/public/01_index.php">Home</a>
        <a href="<?= APP_URL ?>/public/02_about.php">About</a>
        <a href="<?= APP_URL ?>/public/03_dogs.php">Dogs</a>
        <a href="<?= APP_URL ?>/public/04_contact.php">Contact</a>
        <?php if (isset($_SESSION['user_id'])): ?>
            <a href="<?= APP_URL ?>/public/auth/04_profile.php">Profile</a>
            <a href="<?= APP_URL ?>/public/auth/03_logout.php">Logout</a>
        <?php else: ?>
            <a href="<?= APP_URL ?>/public/auth/01_login.php">Login</a>
            <a href="<?= APP_URL ?>/public/auth/02_register.php">Register</a>
        <?php endif; ?>
    </nav>
</header>