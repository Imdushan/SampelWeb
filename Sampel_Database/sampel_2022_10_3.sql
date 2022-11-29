-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2022 at 01:28 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csiap`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets_destribution_items`
--

CREATE TABLE `assets_destribution_items` (
  `id` int(11) NOT NULL,
  `assets_destribution_programs_id` int(11) DEFAULT NULL COMMENT '(assets_destribution_programs table id )',
  `item` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assets_distribution_programs`
--

CREATE TABLE `assets_distribution_programs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crop yields`
--

CREATE TABLE `crop yields` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `farmer_cultivation_crop_id` int(11) DEFAULT NULL,
  `yield_area` text DEFAULT NULL,
  `yield_area_unit` text DEFAULT NULL,
  `seed_quantity` text DEFAULT NULL,
  `seed_quantity_unit` text DEFAULT NULL,
  `crop_damage_area` text DEFAULT NULL,
  `crop_damage_area_unit` text DEFAULT NULL,
  `yield_obtained_quantity` text DEFAULT NULL,
  `yield_obtained_quantity_unit` text DEFAULT NULL,
  `farmer_cost` text DEFAULT NULL,
  `Income` text DEFAULT NULL,
  `selling_price_per_1kg` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crop_categories`
--

CREATE TABLE `crop_categories` (
  `id` int(11) NOT NULL,
  `major_crop` text DEFAULT NULL,
  `major_image` varchar(200) DEFAULT NULL,
  `main_crop` text DEFAULT NULL,
  `main_image` varchar(200) DEFAULT NULL,
  `sub_crop` text DEFAULT NULL,
  `sub_image` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cultivate_categories`
--

CREATE TABLE `cultivate_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nic` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `civil_status` text DEFAULT NULL COMMENT '(M / F)',
  `address` varchar(500) DEFAULT NULL,
  `province` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `dsd` text DEFAULT NULL,
  `agri_sc` text DEFAULT NULL COMMENT '(agriculture service center)',
  `gnd` text DEFAULT NULL,
  `village` text DEFAULT NULL,
  `producer_society_id` int(11) DEFAULT NULL,
  `full_land_area` text DEFAULT NULL,
  `full_land_area_unit` text DEFAULT NULL,
  `lat` text DEFAULT NULL,
  `lng` text DEFAULT NULL,
  `family_male_members` int(11) DEFAULT NULL,
  `family_female_members` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_assets_destributions`
--

CREATE TABLE `farmer_assets_destributions` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `assets_destribution_item_id` int(11) DEFAULT NULL COMMENT '(assets_destribution_items table id)',
  `assets_destribution_programme_id` int(11) DEFAULT NULL COMMENT '(assets_programme table id)',
  `season` text DEFAULT NULL COMMENT '(Yala, Maha, 1st inter, 2nd inter)',
  `year` text DEFAULT NULL,
  `producer_society_id` int(11) DEFAULT NULL COMMENT '(producer societies table id)',
  `quantity` text DEFAULT NULL,
  `farmer_contribution` text DEFAULT NULL COMMENT '(percentage value)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_crop_damages`
--

CREATE TABLE `farmer_crop_damages` (
  `id` int(11) NOT NULL,
  `farmer_cultivation_crop_id` int(11) DEFAULT NULL COMMENT '(farmer_cultivation_crop table id)',
  `farmer_id` int(11) DEFAULT NULL COMMENT '(farmer table id)',
  `reason` varchar(200) DEFAULT NULL,
  `damage_quantity` text DEFAULT NULL,
  `damage_quantity_unit` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_cultivation_crop`
--

CREATE TABLE `farmer_cultivation_crop` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL COMMENT '(farmers Table id)',
  `farm_id` int(11) DEFAULT NULL COMMENT '(farms table id)',
  `crop_id` int(11) DEFAULT NULL COMMENT '(crop_categories table id)',
  `cultivate_category_id` int(11) DEFAULT NULL COMMENT '(cultivate_categories table id)',
  `cultivate_land_area` text DEFAULT NULL,
  `cultivate_land_unit` text DEFAULT NULL,
  `season` text DEFAULT NULL COMMENT '(Yala, Maha, !st inter, 2nd intre)',
  `working_hours` text DEFAULT NULL,
  `payment_per_laborer` text DEFAULT NULL,
  `laborer_male` int(11) DEFAULT NULL,
  `laborer_female` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_land_risks`
--

CREATE TABLE `farmer_land_risks` (
  `id` int(11) NOT NULL,
  `risk` varchar(200) DEFAULT NULL,
  `farmer_id` int(11) DEFAULT NULL COMMENT '(farmer table id)',
  `farmer_cultivation_crop_id` int(11) DEFAULT NULL COMMENT '(farmer cultivation table id)',
  `description` varchar(500) DEFAULT NULL,
  `solution` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_seed_distributions`
--

CREATE TABLE `farmer_seed_distributions` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `season` text DEFAULT NULL COMMENT '(Yala, Maha, !st inter, 2nd Inter)',
  `year` text DEFAULT NULL,
  `harvested_area` text DEFAULT NULL,
  `harvested_area_unit` text DEFAULT NULL,
  `seed_quantity` text DEFAULT NULL,
  `seed_quantity_unit` text DEFAULT NULL,
  `farmer_contribution` text DEFAULT NULL COMMENT 'percentage value',
  `producer_society_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_water_resources`
--

CREATE TABLE `farmer_water_resources` (
  `id` int(11) NOT NULL,
  `resource` varchar(200) DEFAULT NULL,
  `farmer_id` int(11) DEFAULT NULL COMMENT '(farmer table id)',
  `farmer_cultivation_crop_id` int(11) DEFAULT NULL COMMENT '(farmer_cultivation_crop id)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farms`
--

CREATE TABLE `farms` (
  `id` int(11) NOT NULL,
  `harvested_area` text DEFAULT NULL,
  `harvested_area_unit` text DEFAULT NULL,
  `province` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `dsd` text DEFAULT NULL,
  `agri_sc` text DEFAULT NULL,
  `gnd` text DEFAULT NULL,
  `lat` text DEFAULT NULL,
  `lng` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `mobile_created_at` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `producer_associations`
--

CREATE TABLE `producer_associations` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `reg_no` text DEFAULT NULL,
  `registerd_institute` text DEFAULT NULL,
  `chairman` text DEFAULT NULL,
  `secretary` text DEFAULT NULL,
  `treasurer` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `producer_societies`
--

CREATE TABLE `producer_societies` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `reg_no` varchar(200) DEFAULT NULL,
  `registered_institute` varchar(200) DEFAULT NULL,
  `chairman` text DEFAULT NULL,
  `secretary` text DEFAULT NULL,
  `treasurer` text DEFAULT NULL,
  `formation_date` date DEFAULT NULL,
  `producer_asso_id` int(11) DEFAULT NULL,
  `province` text DEFAULT NULL,
  `district` text DEFAULT NULL,
  `dsd` text DEFAULT NULL,
  `gnd` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `signature` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `role` text DEFAULT NULL,
  `section` text DEFAULT NULL COMMENT '(PMU, DPD)',
  `status` varchar(200) DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets_destribution_items`
--
ALTER TABLE `assets_destribution_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets_distribution_programs`
--
ALTER TABLE `assets_distribution_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop yields`
--
ALTER TABLE `crop yields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crop_categories`
--
ALTER TABLE `crop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cultivate_categories`
--
ALTER TABLE `cultivate_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_assets_destributions`
--
ALTER TABLE `farmer_assets_destributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_crop_damages`
--
ALTER TABLE `farmer_crop_damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_cultivation_crop`
--
ALTER TABLE `farmer_cultivation_crop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_seed_distributions`
--
ALTER TABLE `farmer_seed_distributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer_water_resources`
--
ALTER TABLE `farmer_water_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farms`
--
ALTER TABLE `farms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer_associations`
--
ALTER TABLE `producer_associations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer_societies`
--
ALTER TABLE `producer_societies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets_destribution_items`
--
ALTER TABLE `assets_destribution_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_distribution_programs`
--
ALTER TABLE `assets_distribution_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crop yields`
--
ALTER TABLE `crop yields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crop_categories`
--
ALTER TABLE `crop_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cultivate_categories`
--
ALTER TABLE `cultivate_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_assets_destributions`
--
ALTER TABLE `farmer_assets_destributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_crop_damages`
--
ALTER TABLE `farmer_crop_damages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_cultivation_crop`
--
ALTER TABLE `farmer_cultivation_crop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_seed_distributions`
--
ALTER TABLE `farmer_seed_distributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_water_resources`
--
ALTER TABLE `farmer_water_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farms`
--
ALTER TABLE `farms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producer_associations`
--
ALTER TABLE `producer_associations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producer_societies`
--
ALTER TABLE `producer_societies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
