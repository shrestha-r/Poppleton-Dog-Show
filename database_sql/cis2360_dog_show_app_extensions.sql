-- Additional application tables for Poppleton Dog Show assignment
-- These supplement Surnames_O_S_cis2360_dog_show_2.sql

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/* ============================================================
   USERS
   ------------------------------------------------------------
   Tracks site accounts that can log in to view/update profile.
   Maps optionally to an owners row via owner_id.
   ============================================================ */
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(190) NOT NULL UNIQUE,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `users_owner_id_foreign` (`owner_id`),
  CONSTRAINT `users_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* seed demo admin (password hash for "password") */
INSERT INTO `users` (`email`, `password_hash`, `role`, `owner_id`, `is_active`)
VALUES ('admin@poppleton.test', '$2y$10$38Fthr02XdWXoY8sZuWPe.khkFz893BVdYdHB_RE8URwLm5gq9OKu', 'admin', NULL, 1)
ON DUPLICATE KEY UPDATE email = VALUES(email);

/* ============================================================
   DOG IMAGES
   ------------------------------------------------------------
   Allows associating one or more hosted image URLs with a dog.
   ============================================================ */
CREATE TABLE IF NOT EXISTS `dog_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dog_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `dog_images_dog_id_foreign` (`dog_id`),
  CONSTRAINT `dog_images_dog_id_foreign` FOREIGN KEY (`dog_id`) REFERENCES `dogs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;
