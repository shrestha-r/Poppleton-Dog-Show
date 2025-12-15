<?php
require_once __DIR__ . '/../core/config.php';
session_start();
session_destroy();
header('Location: 01_index.php');
exit;