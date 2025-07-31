-- Migration: Add Featured Slider Table
-- Run this SQL on your existing database to add slider functionality

-- Create featured_slider table
CREATE TABLE IF NOT EXISTS `featured_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert demo slider data
INSERT INTO `featured_slider` (`title`, `subtitle`, `image_path`, `display_order`, `is_active`) VALUES
('Bold Brand Reveal', 'Launch Teaser • Motion + Sound Design', 'uploads/featured/slide1.jpg', 1, 1),
('Summer Drop Film', 'Fashion Promo • Color‑graded & Cutdowns', 'uploads/featured/slide2.jpg', 2, 1),
('App Intro Sequence', 'UI Animations • 3D Transitions', 'uploads/featured/slide3.jpg', 3, 1),
('Product Hero Loop', 'CGI Packshot • Realistic Lighting', 'uploads/featured/slide4.jpg', 4, 1),
('Festival Opener', 'Kinetic Type • Beat‑Synced Edits', 'uploads/featured/slide5.jpg', 5, 1);

-- Migration completed successfully!
-- Now you can access /admin/slider.php to manage slider content