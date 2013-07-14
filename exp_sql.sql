-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 15, 2013 at 02:58 AM
-- Server version: 5.1.70-cll
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `davidlei_redgum`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

CREATE TABLE IF NOT EXISTS `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE IF NOT EXISTS `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES
(1, 'Comment', 'insert_new_comment'),
(2, 'Comment_mcp', 'delete_comment_notification'),
(3, 'Comment', 'comment_subscribe'),
(4, 'Comment', 'edit_comment'),
(5, 'Email', 'send_email'),
(6, 'Safecracker', 'submit_entry'),
(7, 'Safecracker', 'combo_loader'),
(8, 'Search', 'do_search'),
(9, 'Channel', 'insert_new_entry'),
(10, 'Channel', 'filemanager_endpoint'),
(11, 'Channel', 'smiley_pop'),
(12, 'Member', 'registration_form'),
(13, 'Member', 'register_member'),
(14, 'Member', 'activate_member'),
(15, 'Member', 'member_login'),
(16, 'Member', 'member_logout'),
(17, 'Member', 'retrieve_password'),
(18, 'Member', 'reset_password'),
(19, 'Member', 'send_member_email'),
(20, 'Member', 'update_un_pw'),
(21, 'Member', 'member_search'),
(22, 'Member', 'member_delete'),
(23, 'Rte', 'get_js');

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE IF NOT EXISTS `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE IF NOT EXISTS `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE IF NOT EXISTS `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE IF NOT EXISTS `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE IF NOT EXISTS `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE IF NOT EXISTS `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE IF NOT EXISTS `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'page', 'Page', 'http://localhost/', NULL, 'en', 1, 0, 1373813760, 0, '', 1, 'open', 1, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE IF NOT EXISTS `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` text,
  `field_ft_11` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`) VALUES
(1, 1, 1, '', 'none', '<p>\n	Home page content</p>', 'none', '', 'none', '', 'none', '', 'none', 'czowOiIiOw==', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE IF NOT EXISTS `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE IF NOT EXISTS `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES
(1, 1, 1, 'page_subtitle', 'Subtitle', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(2, 1, 1, 'page_content', 'Content', '', 'wygwam', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 2, 'any', 'YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(3, 1, 1, 'page_coa_text', 'Call to Action', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(4, 1, 1, 'page_coa_link', 'Call to Action Link', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(5, 1, 1, 'page_feature_image', 'Feature Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(6, 1, 1, 'page_content_images', 'Content Images', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Mjp7aTowO2k6MTtpOjE7aToyO319'),
(7, 1, 2, 'news_subtitle', 'Subtitle', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(8, 1, 2, 'news_content', 'Content', '', 'wygwam', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 2, 'any', 'YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(9, 1, 2, 'news_feature_image', 'Feature Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(10, 1, 2, 'news_content_images', 'Content Images', '', 'matrix', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Mjp7aTowO2k6MztpOjE7aTo0O319'),
(11, 1, 1, 'page_taxonomy', 'Taxonomy', '', 'taxonomy', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 7, 'any', 'YTo3OntzOjE2OiJ0YXhvbm9teV9vcHRpb25zIjtzOjIyMDoiWVRvME9udHpPakV3T2lKamFHRnVibVZzWDJsa0lqdGhPakU2ZTJrNk1UdHpPakU2SWpFaU8zMXpPamM2SW5SeVpXVmZhV1FpTzJFNk1UcDdhVG94TzNNNk1Ub2lNU0k3ZlhNNk1UYzZJbVZ1WVdKc1pWOXdZV2RsYzE5dGIyUmxJanRoT2pFNmUyazZNVHR6T2pFNklqRWlPMzF6T2pJd09pSm9hV1JsWDNSbGJYQnNZWFJsWDNObGJHVmpkQ0k3WVRveE9udHBPakU3Y3pveE9pSXhJanQ5ZlE9PSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE IF NOT EXISTS `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 2, NULL, '::1', 'Home Page', 'home-page', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1373813760, '2013', '07', '15', 0, 0, 20130714145730, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE IF NOT EXISTS `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE IF NOT EXISTS `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE IF NOT EXISTS `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admin', '::1', 1373716020, 'Logged in'),
(2, 1, 1, 'admin', '::1', 1373716131, 'Logged in'),
(3, 1, 1, 'admin', '::1', 1373716594, 'Logged in'),
(4, 1, 1, 'admin', '::1', 1373717398, 'Logged in'),
(5, 1, 1, 'admin', '::1', 1373718232, 'Member Group Created:&nbsp;&nbsp;Admin'),
(6, 1, 1, 'admin', '115.166.27.180', 1373794954, 'Logged in'),
(7, 1, 1, 'admin', '::1', 1373795449, 'Logged in'),
(8, 1, 1, 'admin', '115.166.27.180', 1373805345, 'Logged in'),
(9, 1, 1, 'admin', '::1', 1373812218, 'Logged in'),
(10, 1, 1, 'admin', '::1', 1373812272, 'Member profile created:&nbsp;&nbsp;admindavid'),
(11, 1, 1, 'admin', '::1', 1373812698, 'Member profile created:&nbsp;&nbsp;admintristan'),
(12, 1, 1, 'admin', '::1', 1373812749, 'Member profile created:&nbsp;&nbsp;adminrowland'),
(13, 1, 2, 'admindavid', '::1', 1373812786, 'Logged in'),
(14, 1, 2, 'admindavid', '::1', 1373812940, 'Field Group Created:&nbsp;Pages'),
(15, 1, 2, 'admindavid', '::1', 1373813243, 'Channel Created:&nbsp;&nbsp;Page'),
(16, 1, 2, 'admindavid', '::1', 1373813258, 'Field Group Created:&nbsp;News'),
(17, 1, 2, 'admindavid', '::1', 1373813739, 'Upload Preference Deleted:&nbsp;&nbsp;News Images');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

CREATE TABLE IF NOT EXISTS `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE IF NOT EXISTS `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_developer_log`
--

INSERT INTO `exp_developer_log` (`log_id`, `timestamp`, `viewed`, `description`, `function`, `line`, `file`, `deprecated_since`, `use_instead`, `template_id`, `template_name`, `template_group`, `addon_module`, `addon_method`, `snippets`) VALUES
(1, 1373813806, 'n', NULL, 'generate_json()', 507, 'system/expressionengine/third_party/wygwam/helper.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL),
(2, 1373813806, 'n', NULL, 'generate_json()', 797, '/Users/david_new/Mango Chutney/EXPRESSIONENGINE_PLAYGROUND/redgum/mangomin/codeigniter/system/libraries/Javascript.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL),
(3, 1373813806, 'n', NULL, 'generate_json()', 718, 'system/expressionengine/third_party/wygwam/helper.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL),
(4, 1373813806, 'n', NULL, 'generate_json()', 801, '/Users/david_new/Mango Chutney/EXPRESSIONENGINE_PLAYGROUND/redgum/mangomin/codeigniter/system/libraries/Javascript.php', '2.6', 'the native JSON extension (json_encode())', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_ping_status`
--

CREATE TABLE IF NOT EXISTS `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE IF NOT EXISTS `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE IF NOT EXISTS `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Safecracker_ext', 'form_declaration_modify_data', 'form_declaration_modify_data', '', 10, '2.1', 'y'),
(2, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0', 'y'),
(3, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0', 'y'),
(4, 'Rte_ext', 'publish_form_entry_data', 'publish_form_entry_data', '', 10, '1.0', 'y'),
(5, 'Taxonomy_ext', 'sessions_end', 'sessions_end', 'a:0:{}', 10, '2.3.5.2', 'y'),
(6, 'Taxonomy_ext', 'entry_submission_end', 'entry_submission_end', 'a:0:{}', 10, '2.3.5.2', 'y'),
(7, 'Taxonomy_ext', 'update_multi_entries_loop', 'update_multi_entries_loop', 'a:0:{}', 10, '2.3.5.2', 'y'),
(8, 'Taxonomy_ext', 'cp_menu_array', 'cp_menu_array', 'a:0:{}', 10, '2.3.5.2', 'y'),
(9, 'Matrix_ext', 'channel_entries_tagdata', 'channel_entries_tagdata', '', 10, '2.5.5', 'y'),
(10, 'Low_variables_ext', 'sessions_end', 'sessions_end', 'a:8:{s:11:"license_key";s:36:"b468b209-1d82-45cb-97eb-b174f5d71d24";s:10:"can_manage";a:1:{i:0;s:1:"1";}s:11:"clear_cache";s:1:"n";s:16:"register_globals";s:1:"y";s:20:"register_member_data";s:1:"n";s:13:"save_as_files";s:1:"y";s:9:"file_path";s:89:"/Users/david_new/Mango Chutney/EXPRESSIONENGINE_PLAYGROUND/redgum/structure/low_variables";s:13:"enabled_types";a:15:{i:0;s:12:"low_checkbox";i:1;s:18:"low_checkbox_group";i:2;s:14:"low_reorder_vt";i:3;s:6:"matrix";i:4;s:15:"low_radio_group";i:5;s:10:"low_select";i:6;s:21:"low_select_categories";i:7;s:19:"low_select_channels";i:8;s:18:"low_select_entries";i:9;s:16:"low_select_files";i:10;s:9:"low_table";i:11;s:14:"low_text_input";i:12;s:7:"low_rte";i:13;s:6:"wygwam";i:14;s:12:"low_textarea";}}', 2, '2.3.5', 'y'),
(11, 'Low_variables_ext', 'template_fetch_template', 'template_fetch_template', 'a:8:{s:11:"license_key";s:36:"b468b209-1d82-45cb-97eb-b174f5d71d24";s:10:"can_manage";a:1:{i:0;s:1:"1";}s:11:"clear_cache";s:1:"n";s:16:"register_globals";s:1:"y";s:20:"register_member_data";s:1:"n";s:13:"save_as_files";s:1:"y";s:9:"file_path";s:89:"/Users/david_new/Mango Chutney/EXPRESSIONENGINE_PLAYGROUND/redgum/structure/low_variables";s:13:"enabled_types";a:15:{i:0;s:12:"low_checkbox";i:1;s:18:"low_checkbox_group";i:2;s:14:"low_reorder_vt";i:3;s:6:"matrix";i:4;s:15:"low_radio_group";i:5;s:10:"low_select";i:6;s:21:"low_select_categories";i:7;s:19:"low_select_channels";i:8;s:18:"low_select_entries";i:9;s:16:"low_select_files";i:10;s:9:"low_table";i:11;s:14:"low_text_input";i:12;s:7:"low_rte";i:13;s:6:"wygwam";i:14;s:12:"low_textarea";}}', 2, '2.3.5', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(7, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(8, 'radio', '1.0', 'YTowOnt9', 'n'),
(9, 'relationship', '1.0', 'YTowOnt9', 'n'),
(10, 'rte', '1.0', 'YTowOnt9', 'n'),
(11, 'taxonomy', '2.0.0', 'YTowOnt9', 'n'),
(12, 'wygwam', '2.7', 'YTowOnt9', 'y'),
(13, 'matrix', '2.5.5', 'YTowOnt9', 'y'),
(14, 'low_variables', '2.3.5', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(1, 1, 'none'),
(2, 1, 'br'),
(3, 1, 'xhtml'),
(4, 2, 'none'),
(5, 2, 'br'),
(6, 2, 'xhtml'),
(7, 3, 'none'),
(8, 3, 'br'),
(9, 3, 'xhtml'),
(10, 4, 'none'),
(11, 4, 'br'),
(12, 4, 'xhtml'),
(13, 5, 'none'),
(14, 5, 'br'),
(15, 5, 'xhtml'),
(16, 6, 'none'),
(17, 6, 'br'),
(18, 6, 'xhtml'),
(19, 7, 'none'),
(20, 7, 'br'),
(21, 7, 'xhtml'),
(22, 8, 'none'),
(23, 8, 'br'),
(24, 8, 'xhtml'),
(25, 9, 'none'),
(26, 9, 'br'),
(27, 9, 'xhtml'),
(28, 10, 'none'),
(29, 10, 'br'),
(30, 10, 'xhtml'),
(31, 11, 'none'),
(32, 11, 'br'),
(33, 11, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE IF NOT EXISTS `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Page'),
(2, 1, 'News');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE IF NOT EXISTS `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE IF NOT EXISTS `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE IF NOT EXISTS `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE IF NOT EXISTS `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE IF NOT EXISTS `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_global_variables`
--

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES
(1, 1, 'lv_snippet_header', '	<header>\n		<div class="inner">\n			<h1>{title}</h1>\n			<a class="logo" href="javascript:void(0)"><img src="http://placehold.it/250x120" /></a>\n			\n			<nav class="primary">\n				<ul>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n				</ul>\n			</nav>\n			\n		</div>\n	</header>'),
(2, 1, 'lv_snippet_document_head', '<!DOCTYPE html>\n<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->\n<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->\n<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->\n<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n<meta charset="utf-8">\n<title></title>\n<meta name="description" content="">\n<meta name="author" content="">\n\n<meta http-equiv="cleartype" content="on">\n<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n\n<!--\n	favicon best practices according to:\n	http://www.jonathantneal.com/blog/understand-the-favicon/\n-->\n<link rel="apple-touch-icon" href="path/to/touchicon.png">\n<link rel="icon" href="path/to/favicon.png">\n<!--[if IE]><link rel="shortcut icon" href="path/to/favicon.ico"><![endif]-->\n<!-- or, set /favicon.ico for IE10 win -->\n<meta name="msapplication-TileColor" content="#D83434">\n<meta name="msapplication-TileImage" content="path/to/tileicon.png">\n\n<link rel="stylesheet" href="/assets/css/styles.css" media="all">\n<!--[if (lte IE 8)]>\n<link rel="stylesheet" href="/assets/css/ie.css" media="all">\n<![endif]-->\n\n<!--\n	Open Graph tags, used for Facebook share customisation, as defined here:\n	https://developers.facebook.com/docs/web/tutorials/scrumptious/open-graph-object/\n-->\n<meta property="og:title" content="">\n<meta property="og:type" content="website">\n<meta property="og:url" content="">\n<meta property="og:image" content="">\n<meta property="og:image" content="">\n<meta property="og:description" content="">\n<meta property="og:site_name" content="">\n\n</head>\n'),
(3, 1, 'lv_snippet_footer', '	<footer>\n		<!-- footer navigation -->\n		<div class="inner">\n			<nav class="tertiary">\n				<ul>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n				</ul>\n			</nav>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n		</div>\n	</footer>'),
(4, 1, 'lv_snippet_javascript', '<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>\n<script src="/assets/js/modernizr-1.7.min.js"></script>\n<script src="/assets/js/main.js"></script>');

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE IF NOT EXISTS `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE IF NOT EXISTS `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_low_variables`
--

CREATE TABLE IF NOT EXISTS `exp_low_variables` (
  `variable_id` int(6) unsigned NOT NULL,
  `group_id` int(6) unsigned NOT NULL DEFAULT '0',
  `variable_label` varchar(100) NOT NULL DEFAULT '',
  `variable_notes` text NOT NULL,
  `variable_type` varchar(50) NOT NULL DEFAULT 'low_textarea',
  `variable_settings` text NOT NULL,
  `variable_order` int(4) unsigned NOT NULL DEFAULT '0',
  `early_parsing` char(1) NOT NULL DEFAULT 'n',
  `is_hidden` char(1) NOT NULL DEFAULT 'n',
  `save_as_file` char(1) NOT NULL DEFAULT 'n',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_low_variables`
--

INSERT INTO `exp_low_variables` (`variable_id`, `group_id`, `variable_label`, `variable_notes`, `variable_type`, `variable_settings`, `variable_order`, `early_parsing`, `is_hidden`, `save_as_file`, `edit_date`) VALUES
(1, 1, 'Header', '', 'low_textarea', 'YTozOntzOjQ6InJvd3MiO3M6MToiMyI7czoxNDoidGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJjb2RlX2Zvcm1hdCI7czoxOiJ5Ijt9', 1, 'y', 'y', 'y', 1373815905),
(2, 1, 'Document Head', '', 'low_textarea', 'YTozOntzOjQ6InJvd3MiO3M6MToiMyI7czoxNDoidGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJjb2RlX2Zvcm1hdCI7czoxOiJ5Ijt9', 1, 'n', 'y', 'y', 1373815601),
(3, 1, 'Footer', '', 'low_textarea', 'YTozOntzOjQ6InJvd3MiO3M6MToiMyI7czoxNDoidGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJjb2RlX2Zvcm1hdCI7czoxOiJ5Ijt9', 3, 'n', 'y', 'y', 1373815922),
(4, 1, 'Javascript', '', 'low_textarea', 'YTozOntzOjQ6InJvd3MiO3M6MToiMyI7czoxNDoidGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJjb2RlX2Zvcm1hdCI7czoxOiJ5Ijt9', 4, 'n', 'y', 'y', 1373815940);

-- --------------------------------------------------------

--
-- Table structure for table `exp_low_variable_groups`
--

CREATE TABLE IF NOT EXISTS `exp_low_variable_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(6) unsigned NOT NULL DEFAULT '1',
  `group_label` varchar(100) NOT NULL DEFAULT '',
  `group_notes` text NOT NULL,
  `group_order` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_low_variable_groups`
--

INSERT INTO `exp_low_variable_groups` (`group_id`, `site_id`, `group_label`, `group_notes`, `group_order`) VALUES
(1, 1, 'Snippets', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_cols`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_cols` (
  `col_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_instructions` text,
  `col_type` varchar(50) DEFAULT 'text',
  `col_required` char(1) DEFAULT 'n',
  `col_search` char(1) DEFAULT 'n',
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_width` varchar(4) DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `site_id` (`site_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_matrix_cols`
--

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `var_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`) VALUES
(1, 1, 6, NULL, 'content_image', 'Content Image', '', 'file', 'y', 'n', 0, '33%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIxIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(2, 1, 6, NULL, 'content_image_caption', 'Caption', '', 'text', 'n', 'y', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMzAwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30='),
(3, 1, 10, NULL, 'content_image', 'Content Image', '', 'file', 'y', 'n', 0, '33%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIxIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(4, 1, 10, NULL, 'content_image_caption', 'Caption', '', 'text', 'n', 'y', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMzAwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjM6ImRpciI7czozOiJsdHIiO30=');

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_data`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_data` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  `row_order` int(4) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  `col_id_4` text,
  PRIMARY KEY (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE IF NOT EXISTS `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`) VALUES
(2, 1, 'admindavid', 'David Leitch', '1aad503a6df6d91020e53f144e1591982b3763d3806b7c0d4db54fb1327e40c5109f35d8dd4c9aaeda461db455af8dd94bd520c10c1f906098dc9064b213eb58', 'v*3sKFS4;AVKI59n+[[7}!]!{:gQ|Y}5V0>/o#37{VcE@*[mzH+C@zlvk"g7&f|8Fqx)r\\&rOlih$b@l_vCS]\\LAv%.^HQ==)+J&C2DAAk&*\\j@?[`5bUTwYLk&Zfs^Q', 'cd3ee2e7284e9cb3598bcc93381e402e993119b7', 'e53c77a8923d9bc22601f2d77383b736abb3cc25', NULL, 'david@mangochutney.com.au', 'http://www.davidleitch.com.au', '', '', '', 13, 10, 1989, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '::1', 1373812272, 1373812788, 1373817015, 1, 0, 0, 0, 1373813850, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'Australia/Adelaide', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'y', 0),
(3, 1, 'admintristan', 'Tristan Binney', '7bd3ead4dfba035a52fbafce1314c06d72b3a297c4a40ee68c8f1b39aef13d15b1720dd636c8aff85b3a32b8939f3f9f027a2f1a5180079570ef56d9e19d85ec', 'x|w=Jrv}!N1oTX7>?HN]/T\\-2kbSk+z$lek4U3x3!K>SHS8a5}/2TYI[o:<''fB8''GS,Eo(*n!@$_zo//+a)m9na<YU@ghTYED{GEK9LfSC(!|f1(Y3|PvY/6!vKJSpnQ', '77cd64ac387d59592062769b83cd9e229f9ccd37', 'f8b12cce0619bc82e708b74c4babfe5d90601122', NULL, 'tristan@mangochutney.com.au', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '::1', 1373812698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'Australia/Adelaide', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'y', 0),
(4, 1, 'adminrowland', 'Rowland Hill', 'bcd29c1b6052d13ff727604dca839fe4253c2c8e2b9decd263e593f93653bd489cc36fb4d2115a0db5c7d12dde21854010adc3c9de32018e4b8725a89936d421', '7Aeit\\4oMLUv|sDt>KM>]3pD.6t&-2-!7uU4sYrd=lrZ8A2%p^!.|Gd7LMb[xcgxTf01}v\\^l8xvl>DO3YQ=mJf%Wwn_`H#DO''bi_L?Rx.*f:)+P]A#U6&E2WH@<**T(', '62b07f8b260eb06920661a108038e952eac10500', 'bf03f176a70664bf67dbf45737263e971288a60c', NULL, 'rowland@mangochutney.com.au', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '::1', 1373812749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'Australia/Adelaide', 'n', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, 'n', 0, 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE IF NOT EXISTS `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE IF NOT EXISTS `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE IF NOT EXISTS `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Admin', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 5, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE IF NOT EXISTS `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(2, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(3, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(4, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE IF NOT EXISTS `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE IF NOT EXISTS `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE IF NOT EXISTS `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE IF NOT EXISTS `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE IF NOT EXISTS `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE IF NOT EXISTS `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Comment', '2.3.1', 'y', 'n'),
(2, 'Email', '2.0', 'n', 'n'),
(3, 'Emoticon', '2.0', 'n', 'n'),
(4, 'File', '1.0.0', 'n', 'n'),
(5, 'Jquery', '1.0', 'n', 'n'),
(6, 'Pages', '2.2', 'y', 'y'),
(7, 'Query', '2.0', 'n', 'n'),
(8, 'Rss', '2.0', 'n', 'n'),
(9, 'Safecracker', '2.1', 'y', 'n'),
(10, 'Search', '2.2.1', 'n', 'n'),
(11, 'Channel', '2.0.1', 'n', 'n'),
(12, 'Member', '2.1', 'n', 'n'),
(13, 'Stats', '2.0', 'n', 'n'),
(14, 'Rte', '1.0', 'y', 'n'),
(15, 'Taxonomy', '2.3.5.2', 'y', 'n'),
(16, 'Wygwam', '2.7', 'y', 'n'),
(17, 'Low_variables', '2.3.5', 'y', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE IF NOT EXISTS `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(18, 1, 2, 'n', 'David Leitch', '::1', 1373817015, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_pages_configuration`
--

CREATE TABLE IF NOT EXISTS `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE IF NOT EXISTS `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_ping_servers`
--

CREATE TABLE IF NOT EXISTS `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE IF NOT EXISTS `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE IF NOT EXISTS `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE IF NOT EXISTS `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

CREATE TABLE IF NOT EXISTS `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

CREATE TABLE IF NOT EXISTS `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE IF NOT EXISTS `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE IF NOT EXISTS `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE IF NOT EXISTS `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=382 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(154, 1373813036, 'bf35382bcafad7dd49c75057792d982542066db8', 'ee1569307ea7720df11f644744f7b039dcd5a65e'),
(155, 1373813038, 'bf35382bcafad7dd49c75057792d982542066db8', '912c48b2ac99e997ec57e5228aa66087ed29dffa'),
(152, 1373813016, 'bf35382bcafad7dd49c75057792d982542066db8', '2b3b63cfae01a248d2d7aa992950d6f7968692e9'),
(151, 1373813014, 'bf35382bcafad7dd49c75057792d982542066db8', '621fb4f74f85c8d3c04ae035e142b1447d5a58d6'),
(149, 1373812993, 'bf35382bcafad7dd49c75057792d982542066db8', 'b2adb613f7f44541c641057dbf90961f219f83c1'),
(148, 1373812991, 'bf35382bcafad7dd49c75057792d982542066db8', '550ad89976629f3887303a825f9256e35cb57218'),
(146, 1373812960, 'bf35382bcafad7dd49c75057792d982542066db8', 'd764b47120ab3d9e0270c9c159dd70111172d0c1'),
(145, 1373812956, 'bf35382bcafad7dd49c75057792d982542066db8', 'f4540bca77edd31fbe3ed29c6da2011112e9ba87'),
(144, 1373812955, 'bf35382bcafad7dd49c75057792d982542066db8', '602ef8b00910a02e548d73059f23db6c559379bc'),
(142, 1373812944, 'bf35382bcafad7dd49c75057792d982542066db8', 'fcb7b62d9b74f2736865ff4817473b56f58e0c8e'),
(141, 1373812940, 'bf35382bcafad7dd49c75057792d982542066db8', 'ca8af0ad5f49fbf8d460017bf5c0e8aebdf26863'),
(139, 1373812929, 'bf35382bcafad7dd49c75057792d982542066db8', '1c7ca35454bba65250c8a99d3203bb4c73457407'),
(138, 1373812919, 'bf35382bcafad7dd49c75057792d982542066db8', 'fd0f9730b4f48314845075d60ddf8b92805a4d36'),
(137, 1373812917, 'bf35382bcafad7dd49c75057792d982542066db8', 'e473c87f1c5f2b6ab53d68f38d1cc57a4684b559'),
(135, 1373812901, 'bf35382bcafad7dd49c75057792d982542066db8', '4251118149e8a80346a2cc3d0653b2c999617654'),
(134, 1373812893, 'bf35382bcafad7dd49c75057792d982542066db8', 'a627121ed046aac6ad34d9cc372f1be8bb14d4b8'),
(133, 1373812893, 'bf35382bcafad7dd49c75057792d982542066db8', 'bffa77f7e72a55bfcf7ed3f0ec809f88e4a41c0b'),
(132, 1373812891, 'bf35382bcafad7dd49c75057792d982542066db8', 'f8122c019dae108bbde8f115cfb46eb4829772a3'),
(130, 1373812886, 'bf35382bcafad7dd49c75057792d982542066db8', '4d14cfdf385d827969a742714e21c908dfab3662'),
(129, 1373812884, 'bf35382bcafad7dd49c75057792d982542066db8', '9a5c23acb1ab27ad780830947a24ed2983868598'),
(127, 1373812864, 'bf35382bcafad7dd49c75057792d982542066db8', '4c0d6dbb8688c80d5a3e6bf8c2747d316fd6c6af'),
(125, 1373812860, 'bf35382bcafad7dd49c75057792d982542066db8', '8617aa82879360b76052008fcb0e62eeab4649cc'),
(126, 1373812862, 'bf35382bcafad7dd49c75057792d982542066db8', 'b512533834be3b206728fef0039c861edc653ad9'),
(122, 1373812832, 'bf35382bcafad7dd49c75057792d982542066db8', 'c80f9b9abec24dab4a3eab8af79be187b0b2b99b'),
(121, 1373812831, 'bf35382bcafad7dd49c75057792d982542066db8', '561aa8710883a9776dfd9e1800914f328f70d541'),
(119, 1373812821, 'bf35382bcafad7dd49c75057792d982542066db8', '711ca71bf0dcf387cb3ac26f5cde44b679ebd773'),
(118, 1373812806, 'bf35382bcafad7dd49c75057792d982542066db8', '21f9fd629c7af7807fa559c1eee1790d21c905d6'),
(117, 1373812803, 'bf35382bcafad7dd49c75057792d982542066db8', 'f948615b84ad92b222593fcb00e00e3c40378f51'),
(114, 1373812788, 'bf35382bcafad7dd49c75057792d982542066db8', 'faf2ef9f14cfa01a93e1115bb7e1fccca5b569d6'),
(113, 1373812786, '0', '4c64bb30dbfb814b0f6c18968cac5871a127db13'),
(111, 1373812758, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'b18664ffb943fe379d827e8d7a01f6802a1f17b1'),
(110, 1373812752, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '21decb53d73320454abba32c2583788f87d780ad'),
(109, 1373812749, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'b036db1316fd91a6a44fe1575b60fab319263279'),
(107, 1373812713, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'b326cf0004cc508f70a2ba19cd63ce25422bf09f'),
(106, 1373812701, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '604d3a19f0e8e010954c6b86e0f533ac925c7ed5'),
(105, 1373812698, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'd310ffeb09fed40b9ea064c4d6f7d4c87f79510e'),
(98, 1373812575, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '9a3a1b1915d8ad4a1a18829639b4b6f933e27a7d'),
(97, 1373812469, '0', '5f85d841fba3b2850f01a0f0066087f480bea11f'),
(96, 1373812466, '0', 'c186db517805d4ff2ac6858a3b252b23eb1b6818'),
(95, 1373812400, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'c73ef30ed960c9dc5c19e1a76d99cf9560c69192'),
(94, 1373812398, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'fe1290d2a59ce95bdb17e6bfb9b52eaf3f0a74d7'),
(92, 1373812286, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'd0fb2c4684e7d121f2763f3709e26f2d63a7ff96'),
(91, 1373812275, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '8842d618cca88926605d10b0e1184cb38e65bb38'),
(90, 1373812272, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '6667f4dcb98992cc6a6fbc9a026a89b05006348a'),
(88, 1373812220, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'f72bc34d62b73d6bfa6be685d21f0bac1b09ae9b'),
(87, 1373812218, '0', '71eaf8fe3848c3e722027eab7a755003080d3afe'),
(102, 1373812631, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '95b40e96f41f7505830a0bd5957c56de50d25b85'),
(103, 1373812633, '6db1edb845ef95ecc129be53b13937cd5997a6f5', 'ada8d2da4da8563cf5f543d8534be84859c4a7c2'),
(100, 1373812597, '6db1edb845ef95ecc129be53b13937cd5997a6f5', '572edeebbb0d3b1301bc5fafb8b70dc3265d00ea'),
(157, 1373813057, 'bf35382bcafad7dd49c75057792d982542066db8', 'b5aa147b5cb6f54e2f87a4ef54b6613d2d434ced'),
(158, 1373813060, 'bf35382bcafad7dd49c75057792d982542066db8', 'a77067cc0465565834afe7f315bbfb240812b976'),
(160, 1373813070, 'bf35382bcafad7dd49c75057792d982542066db8', '70b84a2c3da84113336ee8695a649821efd7cb1e'),
(161, 1373813072, 'bf35382bcafad7dd49c75057792d982542066db8', 'c5a43f1dae664806e861c69bc69c67b71315bfed'),
(163, 1373813101, 'bf35382bcafad7dd49c75057792d982542066db8', '59a6081a0b4802e5f8db6341f589513925b69366'),
(164, 1373813104, 'bf35382bcafad7dd49c75057792d982542066db8', 'b762efd92a874ace5427c468a534e5cf466ff387'),
(165, 1373813109, 'bf35382bcafad7dd49c75057792d982542066db8', '04cd7e61ea894b1f9981263e9ceba62aa94f3b8f'),
(167, 1373813122, 'bf35382bcafad7dd49c75057792d982542066db8', '8bad2aaf406e759b50f32d5177f892475167c145'),
(168, 1373813124, 'bf35382bcafad7dd49c75057792d982542066db8', '55c76af8234f8134a39c3b536bd4b9a31c24de22'),
(169, 1373813138, 'bf35382bcafad7dd49c75057792d982542066db8', '9b553649038016a078d83aa3fc2db6ab2fc517e5'),
(170, 1373813144, 'bf35382bcafad7dd49c75057792d982542066db8', 'e734e50d99e06cbdbea896c7ebb8fb1b8379a93a'),
(172, 1373813213, 'bf35382bcafad7dd49c75057792d982542066db8', '2d37c0147db4b1b1fb10b5a3e60396362c334ef5'),
(173, 1373813216, 'bf35382bcafad7dd49c75057792d982542066db8', '53f57aa8acfcbf3550d8821d460ad01467f88d31'),
(174, 1373813232, 'bf35382bcafad7dd49c75057792d982542066db8', 'c0cf67f535badca50653716f402ff73f305b9c2d'),
(176, 1373813243, 'bf35382bcafad7dd49c75057792d982542066db8', 'adb2685241fb9f608c09299f4ed0e4bde3211ab9'),
(177, 1373813245, 'bf35382bcafad7dd49c75057792d982542066db8', 'df07e44086c1fd01930e29d5b0c2bcec84dbe8ae'),
(178, 1373813251, 'bf35382bcafad7dd49c75057792d982542066db8', '8febc98b61a65c4fd134df020365ce45745ccb1a'),
(180, 1373813258, 'bf35382bcafad7dd49c75057792d982542066db8', '64b8ea61a82e1296e4ec57cd11cefb698fa22d52'),
(181, 1373813260, 'bf35382bcafad7dd49c75057792d982542066db8', 'b2d4be70c6d01c9c73f67ad422050f9fe335fca5'),
(182, 1373813263, 'bf35382bcafad7dd49c75057792d982542066db8', 'a952c553dd062edd7ab4b63b414da5fad5d2f836'),
(186, 1373813353, 'bf35382bcafad7dd49c75057792d982542066db8', '31a9066b7e7f7096fca8d28099347be3fe49c83d'),
(184, 1373813339, 'bf35382bcafad7dd49c75057792d982542066db8', '7ebd58cf7440b793034a40b00ee806a01f8580a0'),
(185, 1373813342, 'bf35382bcafad7dd49c75057792d982542066db8', 'e415d7c3c3940c68c6397273a000697c92d3436d'),
(187, 1373813356, 'bf35382bcafad7dd49c75057792d982542066db8', '06a4b3d312f4b597bf1bb105ec714b952ad47968'),
(189, 1373813378, 'bf35382bcafad7dd49c75057792d982542066db8', '3365fc35f529044d1879970fb44d62718f7c9f23'),
(190, 1373813380, 'bf35382bcafad7dd49c75057792d982542066db8', '2a195c220bde90aacc4204942172844e3ce6eec2'),
(191, 1373813383, 'bf35382bcafad7dd49c75057792d982542066db8', '8dcf7696a9e532b38208f803c373a9db81cea607'),
(192, 1373813441, 'bf35382bcafad7dd49c75057792d982542066db8', '40c3ea0bb8e8d29f4b104a72f479d47710d7a2e9'),
(193, 1373813443, 'bf35382bcafad7dd49c75057792d982542066db8', '94ac55eda2ae917633f0e511ba23302cb729548a'),
(194, 1373813445, 'bf35382bcafad7dd49c75057792d982542066db8', 'ccff67f0cc9dc48a1e1b7b0e79bcd6263da56423'),
(195, 1373813447, 'bf35382bcafad7dd49c75057792d982542066db8', '5be23dd5aee021397d9e6be044d3dc81760e76f2'),
(199, 1373813544, 'bf35382bcafad7dd49c75057792d982542066db8', '6d639f886f131aca2a1d9653dfde9f9b6e4b7eeb'),
(197, 1373813489, 'bf35382bcafad7dd49c75057792d982542066db8', '35361c326bf41078e4e18c5e087530560d3ed020'),
(198, 1373813493, 'bf35382bcafad7dd49c75057792d982542066db8', 'eedb25b455937173d9f69639c4fdfa6a59344536'),
(200, 1373813546, 'bf35382bcafad7dd49c75057792d982542066db8', 'f25bc7605ee6234adeb14f7106a578350c14b4f2'),
(201, 1373813551, 'bf35382bcafad7dd49c75057792d982542066db8', 'b56fe053810d25e882adc7286ee473130bed8ca8'),
(202, 1373813555, 'bf35382bcafad7dd49c75057792d982542066db8', '2c94068766aeae723544a6793aa2093e154c2d52'),
(203, 1373813562, 'bf35382bcafad7dd49c75057792d982542066db8', 'ff1e3f98691e51e0fb4402f5fd0917b5c6b3de3a'),
(204, 1373813565, 'bf35382bcafad7dd49c75057792d982542066db8', '85e9bce67f8091aba511653e9cbf7c8e5929347a'),
(205, 1373813573, 'bf35382bcafad7dd49c75057792d982542066db8', 'cc688ec2250d84a94e3423cb07669551172439de'),
(206, 1373813576, 'bf35382bcafad7dd49c75057792d982542066db8', '7077193b04d42e3326b17e37ecc5954ffb50bdce'),
(208, 1373813599, 'bf35382bcafad7dd49c75057792d982542066db8', 'b06abff5754e35b3444093d97147ff83af12a59e'),
(209, 1373813602, 'bf35382bcafad7dd49c75057792d982542066db8', '2909c1a0e95db41a82e032ac1c50d5fd29a5c657'),
(212, 1373813710, 'bf35382bcafad7dd49c75057792d982542066db8', '122d98ba523a0f43bd3080eb161c9574767290f7'),
(211, 1373813666, 'bf35382bcafad7dd49c75057792d982542066db8', 'e39eda6d7d16ce05a2b8673464be920a3016b79d'),
(213, 1373813712, 'bf35382bcafad7dd49c75057792d982542066db8', '08d9b8ee1dcc12b377f6b58d9a48c363fe1213aa'),
(215, 1373813723, 'bf35382bcafad7dd49c75057792d982542066db8', 'f0f10b018912f89f5f858927df3b048df1b4a353'),
(216, 1373813725, 'bf35382bcafad7dd49c75057792d982542066db8', 'fb4698a994ba1cf75875524d9ddc04af220eea93'),
(217, 1373813730, 'bf35382bcafad7dd49c75057792d982542066db8', '1ef8bce1cb47722af0e20f8a83fd28e1351c583b'),
(219, 1373813739, 'bf35382bcafad7dd49c75057792d982542066db8', '3b9b1f93a6bfe3362503248dc8797927ec0834cd'),
(220, 1373813741, 'bf35382bcafad7dd49c75057792d982542066db8', 'c09e21462fc76c9f0358dad6bba0dddb0a69a509'),
(221, 1373813751, 'bf35382bcafad7dd49c75057792d982542066db8', '4f421b8f6343b2ce50a0ddfe4a03e862a0ac8117'),
(222, 1373813783, 'bf35382bcafad7dd49c75057792d982542066db8', '7b7df59883759ced00c11d8738e445793e5c10c3'),
(223, 1373813799, 'bf35382bcafad7dd49c75057792d982542066db8', 'c9f83d875342c4beede50422fd26a1aef9887f82'),
(228, 1373813850, 'bf35382bcafad7dd49c75057792d982542066db8', 'dc57b8b00fe8a5b2881b3362cc3effb3964436e0'),
(225, 1373813819, 'bf35382bcafad7dd49c75057792d982542066db8', '12145ad49890f014c9f7dc4d212f0bed8431b439'),
(226, 1373813821, 'bf35382bcafad7dd49c75057792d982542066db8', 'a18aa7b4578f8a1cc956428d895bc5db523de949'),
(227, 1373813823, 'bf35382bcafad7dd49c75057792d982542066db8', '75fac0caff14a1cc71c027876d0a193153dd605d'),
(229, 1373813854, 'bf35382bcafad7dd49c75057792d982542066db8', '5e4073ce49fe213cbc393d7333d6fc1a6e9d39f6'),
(230, 1373813861, 'bf35382bcafad7dd49c75057792d982542066db8', '2471f564c1fe48065cdf24dd8a1243b7fe3f2a94'),
(232, 1373813877, 'bf35382bcafad7dd49c75057792d982542066db8', '34443e0eef7855d3882bf01b5eed4cb6425a7241'),
(233, 1373813879, 'bf35382bcafad7dd49c75057792d982542066db8', 'f98bb1c505137dcca104ab38084c61ae36c504f8'),
(234, 1373813882, 'bf35382bcafad7dd49c75057792d982542066db8', '4a224decaab9cc47b01bb24e4bf1581dcf20e846'),
(237, 1373813914, 'bf35382bcafad7dd49c75057792d982542066db8', '6acd7ebfe3b09236345c5362942f922b114eaf60'),
(236, 1373813909, 'bf35382bcafad7dd49c75057792d982542066db8', 'e50e8f8a5c676610c1cdabd0e7e71bfe90f2ff28'),
(238, 1373813918, 'bf35382bcafad7dd49c75057792d982542066db8', '1fd1302d296a75b8f6a64afa0c0873524352219c'),
(239, 1373813971, 'bf35382bcafad7dd49c75057792d982542066db8', '7e2afc71bf4b69e229aa5685f8b4ddec42c8459c'),
(240, 1373813975, 'bf35382bcafad7dd49c75057792d982542066db8', 'c6cb2e93ef9d229ae7a8b6d4aefa4fde90af6bb6'),
(241, 1373814042, 'bf35382bcafad7dd49c75057792d982542066db8', '9428ba979d6b8ccff0f2fb9c5498c8abbfc8976c'),
(242, 1373814042, 'bf35382bcafad7dd49c75057792d982542066db8', '7f020463de7b470f5320497de1ba872a68944454'),
(243, 1373814069, 'bf35382bcafad7dd49c75057792d982542066db8', 'ae0e13325a188357e66717e24a0f134e88356c5b'),
(244, 1373814069, 'bf35382bcafad7dd49c75057792d982542066db8', 'e847b349f91e8b2b317e9a2e2126d156476dab13'),
(245, 1373814085, 'bf35382bcafad7dd49c75057792d982542066db8', '144760dfc1e67156f44d0a69e138c16681e42de2'),
(246, 1373814085, 'bf35382bcafad7dd49c75057792d982542066db8', 'f1ab9e8c5c9db41ca19aa568a7cfa5040be73e30'),
(247, 1373814085, 'bf35382bcafad7dd49c75057792d982542066db8', 'b324d589debc9caa7f363da40830ccf7833e2bf7'),
(248, 1373814128, 'bf35382bcafad7dd49c75057792d982542066db8', '445dc12d26cfeba1feeb3b015da3bd7a215b4fde'),
(249, 1373814136, 'bf35382bcafad7dd49c75057792d982542066db8', 'dcaa7f5230cdd3a8c0dc4ada427401c6de8a0a16'),
(251, 1373814141, 'bf35382bcafad7dd49c75057792d982542066db8', 'ad8f845c12508e8827d79d098b15c08bc1188e3c'),
(252, 1373814143, 'bf35382bcafad7dd49c75057792d982542066db8', '14dcb6e8c742f12152f7d3725caa2a937a0dd137'),
(253, 1373814147, 'bf35382bcafad7dd49c75057792d982542066db8', '990383df02d1706ac7ef1717ccaf46492228b616'),
(255, 1373814197, 'bf35382bcafad7dd49c75057792d982542066db8', '9db22efde253439c1e153ba5d54a3426acac69e5'),
(256, 1373814204, 'bf35382bcafad7dd49c75057792d982542066db8', '021338a540d8d957052e09f420f51d9667ae0445'),
(258, 1373814288, 'bf35382bcafad7dd49c75057792d982542066db8', 'ee79dc4755e9bcf136db7d360bfe85ac4921c976'),
(259, 1373814290, 'bf35382bcafad7dd49c75057792d982542066db8', '6b636aa80de948815f4e42508c12e84025a567f7'),
(260, 1373814344, 'bf35382bcafad7dd49c75057792d982542066db8', '2636c7ac197aec50cd7cce43adc4cc61debbe7c7'),
(261, 1373814353, 'bf35382bcafad7dd49c75057792d982542066db8', '108a6f68f6155ff7fa8086c4a7010a831475841c'),
(262, 1373814419, 'bf35382bcafad7dd49c75057792d982542066db8', '55058f72918180bb762ef7ea38907d255ab8f700'),
(263, 1373814432, 'bf35382bcafad7dd49c75057792d982542066db8', 'c5abc559181944892d7697612b830d518d924bf7'),
(264, 1373814440, 'bf35382bcafad7dd49c75057792d982542066db8', '3dfe3dcee7ad54d8493174f1b6237a58a9fe851b'),
(266, 1373814456, 'bf35382bcafad7dd49c75057792d982542066db8', 'b1fa0ff788b1086da276716ec9c8164a638f5a49'),
(267, 1373814458, 'bf35382bcafad7dd49c75057792d982542066db8', 'dc3365fe076cb7e06a328779137d8681d51424a5'),
(268, 1373814480, 'bf35382bcafad7dd49c75057792d982542066db8', 'fe77a02b6412eabfc4904265fb7519075368f178'),
(270, 1373814497, 'bf35382bcafad7dd49c75057792d982542066db8', '08ee36777a1c0c41f39ed0a2a685bea8dc567417'),
(271, 1373814499, 'bf35382bcafad7dd49c75057792d982542066db8', 'd405f4946705c4ec3452a99e10b796c253bf69c0'),
(273, 1373814518, 'bf35382bcafad7dd49c75057792d982542066db8', '8772398aa8bc90cef63c8c02b3e508ce8cb9d320'),
(274, 1373814520, 'bf35382bcafad7dd49c75057792d982542066db8', '318cffef375da7ba7397faab380e038a03e10d5c'),
(275, 1373814695, 'bf35382bcafad7dd49c75057792d982542066db8', '82e0c08c9a4f9c4332d21b4d2868ca3cf15b0cb9'),
(276, 1373814695, 'bf35382bcafad7dd49c75057792d982542066db8', '11adae4fbbf92523785389ef692b8737eb612a14'),
(277, 1373814695, 'bf35382bcafad7dd49c75057792d982542066db8', '5b879c5ace4e179bd20428d1032816e50262570c'),
(279, 1373815253, 'bf35382bcafad7dd49c75057792d982542066db8', 'b7de9cd352a6493de325a6c0ef6cd86efb1f2dc2'),
(281, 1373815277, 'bf35382bcafad7dd49c75057792d982542066db8', 'd155c3c696266c0c1c0e915dc2b221cbecf7a716'),
(282, 1373815279, 'bf35382bcafad7dd49c75057792d982542066db8', '7c3982c2c2e3f7dd0ef1db30e1f225af2d5dd172'),
(283, 1373815302, 'bf35382bcafad7dd49c75057792d982542066db8', '173829d263a6ff03d0a6e588c07cbdebe18bb64a'),
(286, 1373815335, 'bf35382bcafad7dd49c75057792d982542066db8', '0810273abee104418f61e2e8a35aa7accb96e720'),
(285, 1373815322, 'bf35382bcafad7dd49c75057792d982542066db8', '73222cccf74cbd9bdad80fe6a3a79698b09ab27c'),
(287, 1373815337, 'bf35382bcafad7dd49c75057792d982542066db8', 'd08dafa6020fd68c1b90c6d5e7b9502cf6c6efa1'),
(289, 1373815378, 'bf35382bcafad7dd49c75057792d982542066db8', 'd2b1833cf16ba8225973a4f68ad12e0e7bbf0c45'),
(291, 1373815431, 'bf35382bcafad7dd49c75057792d982542066db8', 'ee6d13c8d91e6b6c361030e9b60567dac953ed5c'),
(292, 1373815434, 'bf35382bcafad7dd49c75057792d982542066db8', '9c3ac87f61747f5870e2309e224f74e2e5a6e5b4'),
(294, 1373815463, 'bf35382bcafad7dd49c75057792d982542066db8', '76e3ae873e1cdb1a7bb96700448606962b1e9fbf'),
(295, 1373815465, 'bf35382bcafad7dd49c75057792d982542066db8', '7525f66398e71be6fc725339a90cc49929a65a0a'),
(297, 1373815482, 'bf35382bcafad7dd49c75057792d982542066db8', 'eb83c2ea219300bc2a8b252471c32f322d3d8da2'),
(298, 1373815485, 'bf35382bcafad7dd49c75057792d982542066db8', 'c952d81950013b4ad520c26d4b17a434c9753945'),
(300, 1373815512, 'bf35382bcafad7dd49c75057792d982542066db8', 'ffe5691895b17a9079fb189ecc4b32821b80ce70'),
(301, 1373815514, 'bf35382bcafad7dd49c75057792d982542066db8', 'f1dd5dff4ff1eab180d17479b782759138e7db20'),
(303, 1373815538, 'bf35382bcafad7dd49c75057792d982542066db8', '33a8ef323db42e5823cd4d0319add8abce0a971f'),
(304, 1373815540, 'bf35382bcafad7dd49c75057792d982542066db8', 'a4a74d1d839bd37720a74a982c653aae64ce003b'),
(306, 1373815554, 'bf35382bcafad7dd49c75057792d982542066db8', 'ea9e8fad178597d5ef475c706808b08b33862cb0'),
(307, 1373815557, 'bf35382bcafad7dd49c75057792d982542066db8', '9d483fd08c5004a2fec1459afeac455f8da2b961'),
(308, 1373815561, 'bf35382bcafad7dd49c75057792d982542066db8', 'f155e743195aaa5cf9869c1982f6b69a24d93627'),
(309, 1373815569, 'bf35382bcafad7dd49c75057792d982542066db8', 'f3390603697622af4706fed00380cd8cb6b3b5b0'),
(310, 1373815577, 'bf35382bcafad7dd49c75057792d982542066db8', '5fe2337ca36cddb3d586a6b1f7679d3b6935098f'),
(311, 1373815577, 'bf35382bcafad7dd49c75057792d982542066db8', '8fd07a26f4d15f2002368e609654e8ed3948a805'),
(312, 1373815602, 'bf35382bcafad7dd49c75057792d982542066db8', '847f32d3c54335958e7993b660031253a5a0d963'),
(313, 1373815602, 'bf35382bcafad7dd49c75057792d982542066db8', '6f0abb0c83f56b63b436546e151e25aacc42f7c5'),
(314, 1373815617, 'bf35382bcafad7dd49c75057792d982542066db8', '911a92126ba751709779594a65c79effe4ec2fb6'),
(315, 1373815617, 'bf35382bcafad7dd49c75057792d982542066db8', '547138012ecb423d65787aa1805b2d6659d84f10'),
(316, 1373815641, 'bf35382bcafad7dd49c75057792d982542066db8', 'b234633b783cef4a183e06ce6d523fd2a0395137'),
(317, 1373815641, 'bf35382bcafad7dd49c75057792d982542066db8', 'a3d444e4d39971c9a4c7a95750a302916ea80e6b'),
(318, 1373815667, 'bf35382bcafad7dd49c75057792d982542066db8', 'dc38e03e1b68be8123f23648fa824db594863fe8'),
(319, 1373815667, 'bf35382bcafad7dd49c75057792d982542066db8', 'c48cd19c1b0a5e410e5394be947dd0b97cee86da'),
(320, 1373815678, 'bf35382bcafad7dd49c75057792d982542066db8', 'a24d4132ddaa5364b14a87a9a91135b5f32ab09b'),
(321, 1373815678, 'bf35382bcafad7dd49c75057792d982542066db8', '76631917e0631b94f45627ed7857a0f66c0ae497'),
(322, 1373815687, 'bf35382bcafad7dd49c75057792d982542066db8', '5744c65725f27271c937bf51232baacf8c958cb7'),
(323, 1373815687, 'bf35382bcafad7dd49c75057792d982542066db8', '8456e22ea20f67d11b83e459cabbe8c5d2ebc943'),
(324, 1373815687, 'bf35382bcafad7dd49c75057792d982542066db8', 'c9da60b19b44ff156ad0f056b94c5dc033e277b5'),
(325, 1373815687, 'bf35382bcafad7dd49c75057792d982542066db8', '9dd2bf2a785a1c9463f79efcfd82b0cfa2df33ee'),
(327, 1373815721, 'bf35382bcafad7dd49c75057792d982542066db8', 'c72d21d27d2c0763ff7da6e48fcbae16858bd911'),
(328, 1373815724, 'bf35382bcafad7dd49c75057792d982542066db8', '4be6e1fc48579807bf86cc7ae6813c7a64a09f15'),
(329, 1373815742, 'bf35382bcafad7dd49c75057792d982542066db8', '1f0e248e204aea3aa35d6c853c4d3ec213b8c030'),
(330, 1373815743, 'bf35382bcafad7dd49c75057792d982542066db8', '37e622772caa2be9e5f5e83307761c4d0e4f192a'),
(331, 1373815774, 'bf35382bcafad7dd49c75057792d982542066db8', '624c0ce62bc50fb8267272a71499a36e09e268d4'),
(332, 1373815774, 'bf35382bcafad7dd49c75057792d982542066db8', '020848b476e2bb8320584d0e7d24d9964a25f16f'),
(333, 1373815870, 'bf35382bcafad7dd49c75057792d982542066db8', '7a68ca3fa9de3a009a90db5829b009b69876cba5'),
(334, 1373815871, 'bf35382bcafad7dd49c75057792d982542066db8', '7846281e2efe433d2873a8745513a965c4044d2d'),
(335, 1373815871, 'bf35382bcafad7dd49c75057792d982542066db8', 'a41455317e74848aeb60364d0101fc34c30709eb'),
(336, 1373815896, 'bf35382bcafad7dd49c75057792d982542066db8', '4bf8fa4a4214171b18f1d90f7563c8f7a30fe48e'),
(337, 1373815896, 'bf35382bcafad7dd49c75057792d982542066db8', '28c1cad52d47f1b4fed4c636b2c1ff930b9e9bc2'),
(338, 1373815896, 'bf35382bcafad7dd49c75057792d982542066db8', '7f797ba3fc51cb93673560d3773396fe243f838c'),
(339, 1373815906, 'bf35382bcafad7dd49c75057792d982542066db8', '397795f181133ad13b38c774d09d3017447f634a'),
(340, 1373815906, 'bf35382bcafad7dd49c75057792d982542066db8', 'fb0e9a5288a34e64a9bffbef4e2f2d1b7a2ed152'),
(341, 1373815923, 'bf35382bcafad7dd49c75057792d982542066db8', 'b5965c6e0a2ee77b9bb6d8719de5ac6c707bcbe2'),
(342, 1373815923, 'bf35382bcafad7dd49c75057792d982542066db8', '7029cc97a44e626c50b8641f4aefb9a15ea1c7f6'),
(343, 1373815923, 'bf35382bcafad7dd49c75057792d982542066db8', 'f72fb78d721896c5e3a64133d5234cfe46953222'),
(344, 1373815934, 'bf35382bcafad7dd49c75057792d982542066db8', 'ea298b2f164de9c2e83ca3add3cc5ab37a14b963'),
(345, 1373815934, 'bf35382bcafad7dd49c75057792d982542066db8', 'e53e6e397b416a56e375737e750fa55c24417183'),
(346, 1373815939, 'bf35382bcafad7dd49c75057792d982542066db8', 'c3385bbd932e80029ced08cfb8c6ef7aa8be9203'),
(347, 1373815939, 'bf35382bcafad7dd49c75057792d982542066db8', '562641db1a9438888fb45080ef30f14263b4e66e'),
(348, 1373815940, 'bf35382bcafad7dd49c75057792d982542066db8', 'ec569bfdc61cabcc29e9924e366a0f182c7f62c5'),
(349, 1373815940, 'bf35382bcafad7dd49c75057792d982542066db8', '86f423b1f157aedbded85e7d380ae4ac07003ce3'),
(350, 1373815955, 'bf35382bcafad7dd49c75057792d982542066db8', '53bbe4beaeea9243c51537a7a59b3af2147160ae'),
(351, 1373815955, 'bf35382bcafad7dd49c75057792d982542066db8', 'f06e7c6ada42f4ed08ac98b55180cca6dbc1480a'),
(352, 1373815994, 'bf35382bcafad7dd49c75057792d982542066db8', '44fb358ef9b5ca74c6c865bd9a6b65cfdc272355'),
(353, 1373816004, 'bf35382bcafad7dd49c75057792d982542066db8', 'a95b406445ea73418724fb57eb4774f71f4a8bac'),
(354, 1373816009, 'bf35382bcafad7dd49c75057792d982542066db8', 'ed53552b95389bbee9ba845d5cd877a49fc3c83a'),
(355, 1373816013, 'bf35382bcafad7dd49c75057792d982542066db8', '3c0c33f67387ceaf97ed484a0bd5b50b81b8568c'),
(356, 1373816027, 'bf35382bcafad7dd49c75057792d982542066db8', '245aed4ed772b74e09dff74e1f3d314d09aa7f2c'),
(357, 1373816032, 'bf35382bcafad7dd49c75057792d982542066db8', '5216f3b43ee3e5dcd0dd949ce08451c93078c15f'),
(359, 1373816059, 'bf35382bcafad7dd49c75057792d982542066db8', '883dc291e81c00ac6b607c4351b32bc7d8c8adbc'),
(360, 1373816061, 'bf35382bcafad7dd49c75057792d982542066db8', 'fd243181bda3e9272a2f06725efdf4d0131e5e2f'),
(361, 1373816116, 'bf35382bcafad7dd49c75057792d982542066db8', 'a976862fa894195a72c9b02383832df2a5edc967'),
(362, 1373816122, 'bf35382bcafad7dd49c75057792d982542066db8', '65f55e28d53cdbbfc64babbdc3d121bc2ff75801'),
(363, 1373816131, 'bf35382bcafad7dd49c75057792d982542066db8', 'f25864f19702a59d73160804f88b056962f90915'),
(364, 1373816138, 'bf35382bcafad7dd49c75057792d982542066db8', '73ec920dbeb93328d22532d1fa5f32896ee3d859'),
(365, 1373816327, 'bf35382bcafad7dd49c75057792d982542066db8', 'be7612f552dbb3aec9fa8898d87f4a961cd96983'),
(366, 1373816327, 'bf35382bcafad7dd49c75057792d982542066db8', 'b6da19347c017506303f4851d2c8e0ce3d7531e2'),
(367, 1373816826, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '5428b24e4506d3805ad23cd24311e9accb9d0f01'),
(368, 1373816826, '943a05d13b24ba9a2f1e8969030aaff282483a71', '6de0fe590a86a674d7aeb43cc62fc1504aeddba0'),
(369, 1373816826, 'd3b4c00cb5110fe20f99472215c8810e69e24323', '50448126be1ddef898ac224a100b542486af887f'),
(370, 1373816878, 'ca53e338a48d9256820c109b5d8cb6713b269c26', 'c50a257f106081907acb3a74a776417627ae90bf'),
(371, 1373816878, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '70d38bac8fee4265473fb669676f6bf558a4bce2'),
(372, 1373816904, 'ca53e338a48d9256820c109b5d8cb6713b269c26', 'aace450db1b382fb79ab8870b82bc2ffae768342'),
(373, 1373816904, 'ca53e338a48d9256820c109b5d8cb6713b269c26', 'f71cc83f7e7fadde17c91efc9613cdd90c3f5b5d'),
(374, 1373816904, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '62504c541db3e2d353439b8ac20960126ea418b5'),
(375, 1373816904, 'ca53e338a48d9256820c109b5d8cb6713b269c26', 'a0a2d0ef4cd9d2f16ef7a1f5928f64d72217de2b'),
(376, 1373816979, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '573d787ab70bab32e1eb234c1bf0d162ef50b8c9'),
(377, 1373816979, 'ca53e338a48d9256820c109b5d8cb6713b269c26', 'db91d248fe9a6b6386292e96e513096d8b2cb13d'),
(378, 1373816989, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '0d0b979799b0a11e4ddf2a5fe4d6c69666f1e0b4'),
(379, 1373816989, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '4d46d20c76c6651d33e287df0769f1d25d66059c'),
(380, 1373817015, 'ca53e338a48d9256820c109b5d8cb6713b269c26', 'f8a2238b987d7b252eaa63c71ca2787677c008bc'),
(381, 1373817015, 'ca53e338a48d9256820c109b5d8cb6713b269c26', '61b3e9c0c9137eef96c17c87fd193c4c9c822710');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE IF NOT EXISTS `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `fingerprint`, `sess_start`, `last_activity`) VALUES
('ca53e338a48d9256820c109b5d8cb6713b269c26', 2, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/536.28.10 (KHTML, like Gecko) Version/6.0.3 Safari/536.28.10', 'd1da301e23742f0e3a6f45a83125430a', 1373816826, 1373817015);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE IF NOT EXISTS `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'Base Install', 'default_site', NULL, 'YTo5MDp7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6MTc6Imh0dHA6Ly9sb2NhbGhvc3QvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjI0OiJodHRwOi8vbG9jYWxob3N0L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyMjoiZGF2aWRAbWFuZ29jaHV0bmV5LmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3QvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjkxOiIvVXNlcnMvZGF2aWRfbmV3L01hbmdvIENodXRuZXkvRVhQUkVTU0lPTkVOR0lORV9QTEFZR1JPVU5EL2VlX2Jhc2VfaW5zdGFsbC9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MTM6ImxvZ19yZWZlcnJlcnMiO3M6MToibiI7czoxMzoibWF4X3JlZmVycmVycyI7czozOiI1MDAiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6InVzIjtzOjE1OiJzZXJ2ZXJfdGltZXpvbmUiO3M6MTg6IkF1c3RyYWxpYS9BZGVsYWlkZSI7czoxMzoic2VydmVyX29mZnNldCI7czowOiIiO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czoxODoiQXVzdHJhbGlhL0FkZWxhaWRlIjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czozMjoiaHR0cDovL2xvY2FsaG9zdC9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6ODI6Ii9Vc2Vycy9kYXZpZF9uZXcvTWFuZ28gQ2h1dG5leS9FWFBSRVNTSU9ORU5HSU5FX1BMQVlHUk9VTkQvZWVfYmFzZV9pbnN0YWxsL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjt9', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NDoibm9uZSI7czoyMzoibmV3X21lbWJlcl9ub3RpZmljYXRpb24iO3M6MToibiI7czoyMzoibWJyX25vdGlmaWNhdGlvbl9lbWFpbHMiO3M6MDoiIjtzOjI0OiJyZXF1aXJlX3Rlcm1zX29mX3NlcnZpY2UiO3M6MToieSI7czoyMjoidXNlX21lbWJlcnNoaXBfY2FwdGNoYSI7czoxOiJuIjtzOjIwOiJkZWZhdWx0X21lbWJlcl9ncm91cCI7czoxOiI1IjtzOjE1OiJwcm9maWxlX3RyaWdnZXIiO3M6NjoibWVtYmVyIjtzOjEyOiJtZW1iZXJfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoxNDoiZW5hYmxlX2F2YXRhcnMiO3M6MToieSI7czoyMDoiYWxsb3dfYXZhdGFyX3VwbG9hZHMiO3M6MToibiI7czoxMDoiYXZhdGFyX3VybCI7czozMzoiaHR0cDovL2xvY2FsaG9zdC91cGxvYWRzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo4MjoiL1VzZXJzL2RhdmlkX25ldy9NYW5nbyBDaHV0bmV5L0VYUFJFU1NJT05FTkdJTkVfUExBWUdST1VORC9yZWRndW0vdXBsb2Fkcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czozOToiaHR0cDovL2xvY2FsaG9zdC91cGxvYWRzL21lbWJlcl9waG90b3MvIjtzOjEwOiJwaG90b19wYXRoIjtzOjg4OiIvVXNlcnMvZGF2aWRfbmV3L01hbmdvIENodXRuZXkvRVhQUkVTU0lPTkVOR0lORV9QTEFZR1JPVU5EL3JlZGd1bS91cGxvYWRzL21lbWJlcl9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvdXBsb2Fkcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6OTY6Ii9Vc2Vycy9kYXZpZF9uZXcvTWFuZ28gQ2h1dG5leS9FWFBSRVNTSU9ORU5HSU5FX1BMQVlHUk9VTkQvcmVkZ3VtL3VwbG9hZHMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxNzoic2lnX2ltZ19tYXhfd2lkdGgiO3M6MzoiNDgwIjtzOjE4OiJzaWdfaW1nX21heF9oZWlnaHQiO3M6MjoiODAiO3M6MTQ6InNpZ19pbWdfbWF4X2tiIjtzOjI6IjMwIjtzOjE5OiJwcnZfbXNnX3VwbG9hZF9wYXRoIjtzOjg5OiIvVXNlcnMvZGF2aWRfbmV3L01hbmdvIENodXRuZXkvRVhQUkVTU0lPTkVOR0lORV9QTEFZR1JPVU5EL3JlZGd1bS91cGxvYWRzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxNzoidG90YWxfZm9ydW1fcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6Im4iO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czoxOiIvIjt9', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6NzU6Ii9Vc2Vycy9kYXZpZF9uZXcvTWFuZ28gQ2h1dG5leS9FWFBSRVNTSU9ORU5HSU5FX1BMQVlHUk9VTkQvcmVkZ3VtL2luZGV4LnBocCI7czozMjoiNGJmMzIzNjQ4MWRiZDJkODExZmY1NWU5NDkzNTY3NWEiO30=', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE IF NOT EXISTS `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE IF NOT EXISTS `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(9, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
(10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(12, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(13, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(14, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(15, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
(16, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE IF NOT EXISTS `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 3, 4, 'Rowland Hill', 1, 0, 0, 0, 1373813760, 0, 0, 1373817015, 6, 1373811565, 1374321307);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE IF NOT EXISTS `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE IF NOT EXISTS `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Statuses');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_taxonomy_trees`
--

CREATE TABLE IF NOT EXISTS `exp_taxonomy_trees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `template_preferences` varchar(250) DEFAULT 'all',
  `channel_preferences` varchar(250) DEFAULT 'all',
  `last_updated` int(10) DEFAULT NULL,
  `fields` text,
  `permissions` varchar(250) DEFAULT NULL,
  `tree_array` longtext,
  `max_depth` int(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_taxonomy_trees`
--

INSERT INTO `exp_taxonomy_trees` (`id`, `site_id`, `label`, `template_preferences`, `channel_preferences`, `last_updated`, `fields`, `permissions`, `tree_array`, `max_depth`) VALUES
(1, 1, 'Site Map', '2|1', '1', 1373813917, '', '', 'YToxOntpOjA7YToyMTp7czo3OiJub2RlX2lkIjtzOjE6IjEiO3M6MzoibGZ0IjtzOjE6IjEiO3M6Mzoicmd0IjtzOjE6IjIiO3M6NToibGFiZWwiO3M6OToiSG9tZSBQYWdlIjtzOjg6ImVudHJ5X2lkIjtzOjE6IjEiO3M6MTM6InRlbXBsYXRlX3BhdGgiO3M6MToiMSI7czoxMDoiY3VzdG9tX3VybCI7czoxOiIvIjtzOjEwOiJmaWVsZF9kYXRhIjtzOjA6IiI7czo2OiJzdGF0dXMiO3M6NDoib3BlbiI7czo5OiJoaWdobGlnaHQiO3M6NjoiMDA5OTMzIjtzOjEwOiJjaGFubmVsX2lkIjtzOjE6IjEiO3M6NToidGl0bGUiO3M6OToiSG9tZSBQYWdlIjtzOjk6InVybF90aXRsZSI7czo5OiJob21lLXBhZ2UiO3M6MTA6ImVudHJ5X2RhdGUiO3M6MTA6IjEzNzM4MTM3NjAiO3M6MTU6ImV4cGlyYXRpb25fZGF0ZSI7czoxOiIwIjtzOjExOiJ0ZW1wbGF0ZV9pZCI7czoxOiIxIjtzOjg6Imdyb3VwX2lkIjtzOjE6IjEiO3M6MTM6InRlbXBsYXRlX25hbWUiO3M6NToiaW5kZXgiO3M6MTA6Imdyb3VwX25hbWUiO3M6NDoic2l0ZSI7czoxNToiaXNfc2l0ZV9kZWZhdWx0IjtzOjE6InkiO3M6NToibGV2ZWwiO2k6MDt9fQ==', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_taxonomy_tree_1`
--

CREATE TABLE IF NOT EXISTS `exp_taxonomy_tree_1` (
  `node_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `lft` mediumint(8) unsigned DEFAULT NULL,
  `rgt` mediumint(8) unsigned DEFAULT NULL,
  `moved` tinyint(1) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entry_id` int(10) DEFAULT NULL,
  `template_path` varchar(255) DEFAULT NULL,
  `custom_url` varchar(250) DEFAULT NULL,
  `field_data` text,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_taxonomy_tree_1`
--

INSERT INTO `exp_taxonomy_tree_1` (`node_id`, `lft`, `rgt`, `moved`, `label`, `entry_id`, `template_path`, `custom_url`, `field_data`) VALUES
(1, 1, 2, 0, 'Home Page', 1, '1', '/', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE IF NOT EXISTS `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(1, 1, 1, 'index', 'y', 'webpage', '<!DOCTYPE html>\n<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->\n<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->\n<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->\n<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n<meta charset="utf-8">\n<title></title>\n<meta name="description" content="">\n<meta name="author" content="">\n\n<meta http-equiv="cleartype" content="on">\n<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n\n<!--\n	favicon best practices according to:\n	http://www.jonathantneal.com/blog/understand-the-favicon/\n-->\n<link rel="apple-touch-icon" href="path/to/touchicon.png">\n<link rel="icon" href="path/to/favicon.png">\n<!--[if IE]><link rel="shortcut icon" href="path/to/favicon.ico"><![endif]-->\n<!-- or, set /favicon.ico for IE10 win -->\n<meta name="msapplication-TileColor" content="#D83434">\n<meta name="msapplication-TileImage" content="path/to/tileicon.png">\n\n<link rel="stylesheet" href="/assets/css/styles.css" media="all">\n<!--[if (lte IE 8)]>\n<link rel="stylesheet" href="/assets/css/ie.css" media="all">\n<![endif]-->\n\n<!--\n	Open Graph tags, used for Facebook share customisation, as defined here:\n	https://developers.facebook.com/docs/web/tutorials/scrumptious/open-graph-object/\n-->\n<meta property="og:title" content="">\n<meta property="og:type" content="website">\n<meta property="og:url" content="">\n<meta property="og:image" content="">\n<meta property="og:image" content="">\n<meta property="og:description" content="">\n<meta property="og:site_name" content="">\n\n</head>\n\n<body>\n\n	<header>\n		<div class="inner">\n			<h1>{site_name}</h1>\n			<a class="logo" href="javascript:void(0)"><img src="http://placehold.it/250x120" /></a>\n			\n			<nav class="primary">\n				<ul>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n				</ul>\n			</nav>\n		</div>\n	</header>\n\n	<section class="main-content">\n		<div class="inner">\n			<h1>This is some content from the master branch!</h1>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n			<h2>Lorem</h2>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n			<ul>\n				<li>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</li>\n				<li>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</li>\n				<li>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</li>\n			</ul>\n			\n			<aside>\n				<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n				<!-- sub navigation -->\n				<nav class="secondary">\n					<ul>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n					</ul>\n				</nav>\n			</aside>\n		</div>\n	</section>\n\n	<footer>\n		<!-- footer navigation -->\n		<div class="inner">\n			<nav class="tertiary">\n				<ul>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n				</ul>\n			</nav>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n		</div>\n	</footer>\n\n<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>\n<script src="/assets/js/modernizr-1.7.min.js"></script>\n<script src="/assets/js/main.js"></script>\n\n</body>\n</html>', 'Used for Home Page', 1373812891, 2, 'n', 0, '', 'n', 'y', 'o', 36),
(2, 1, 1, 'default', 'y', 'webpage', '<!DOCTYPE html>\n<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->\n<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->\n<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->\n<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n<meta charset="utf-8">\n<title></title>\n<meta name="description" content="">\n<meta name="author" content="">\n\n<meta http-equiv="cleartype" content="on">\n<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n\n<!--\n	favicon best practices according to:\n	http://www.jonathantneal.com/blog/understand-the-favicon/\n-->\n<link rel="apple-touch-icon" href="path/to/touchicon.png">\n<link rel="icon" href="path/to/favicon.png">\n<!--[if IE]><link rel="shortcut icon" href="path/to/favicon.ico"><![endif]-->\n<!-- or, set /favicon.ico for IE10 win -->\n<meta name="msapplication-TileColor" content="#D83434">\n<meta name="msapplication-TileImage" content="path/to/tileicon.png">\n\n<link rel="stylesheet" href="/assets/css/styles.css" media="all">\n<!--[if (lte IE 8)]>\n<link rel="stylesheet" href="/assets/css/ie.css" media="all">\n<![endif]-->\n\n<!--\n	Open Graph tags, used for Facebook share customisation, as defined here:\n	https://developers.facebook.com/docs/web/tutorials/scrumptious/open-graph-object/\n-->\n<meta property="og:title" content="">\n<meta property="og:type" content="website">\n<meta property="og:url" content="">\n<meta property="og:image" content="">\n<meta property="og:image" content="">\n<meta property="og:description" content="">\n<meta property="og:site_name" content="">\n\n</head>\n\n<body>\n\n	<header>\n		<div class="inner">\n			<h1>{site_name}</h1>\n			<a class="logo" href="javascript:void(0)"><img src="http://placehold.it/250x120" /></a>\n			\n			<nav class="primary">\n				<ul>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n				</ul>\n			</nav>\n		</div>\n	</header>\n\n	<section class="main-content">\n		<div class="inner">\n			<h1>This is some content from the master branch!</h1>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n			<h2>Lorem</h2>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n			<ul>\n				<li>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</li>\n				<li>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</li>\n				<li>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</li>\n			</ul>\n			\n			<aside>\n				<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n				<!-- sub navigation -->\n				<nav class="secondary">\n					<ul>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n						<li><a href="javascript:void(0)">link</a></li>\n					</ul>\n				</nav>\n			</aside>\n		</div>\n	</section>\n\n	<footer>\n		<!-- footer navigation -->\n		<div class="inner">\n			<nav class="tertiary">\n				<ul>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n					<li><a href="javascript:void(0)">link</a></li>\n				</ul>\n			</nav>\n			<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n		</div>\n	</footer>\n\n<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>\n<script src="/assets/js/modernizr-1.7.min.js"></script>\n<script src="/assets/js/main.js"></script>\n\n</body>\n</html>', 'Generic Content Page', 1373812917, 2, 'n', 0, '', 'n', 'y', 'o', 30);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'site', 1, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE IF NOT EXISTS `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE IF NOT EXISTS `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`) VALUES
(1, 1, 'Content Images', '/Users/david_new/Mango Chutney/EXPRESSIONENGINE_PLAYGROUND/ee_base_install/uploads/content/', '/uploads/content/', 'img', '', '', '', '', '', '', '', '', '', '', NULL),
(2, 1, 'Feature Images', '/Users/david_new/Mango Chutney/EXPRESSIONENGINE_PLAYGROUND/ee_base_install/uploads/feature/', '/uploads/feature/', 'img', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_wygwam_configs`
--

CREATE TABLE IF NOT EXISTS `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_wygwam_configs`
--

INSERT INTO `exp_wygwam_configs` (`config_id`, `config_name`, `settings`) VALUES
(1, 'Basic', 'YTo1OntzOjc6InRvb2xiYXIiO2E6MTA6e2k6MDtzOjQ6IkJvbGQiO2k6MTtzOjY6Ikl0YWxpYyI7aToyO3M6OToiVW5kZXJsaW5lIjtpOjM7czo2OiJTdHJpa2UiO2k6NDtzOjEyOiJOdW1iZXJlZExpc3QiO2k6NTtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NjtzOjQ6IkxpbmsiO2k6NztzOjY6IlVubGluayI7aTo4O3M6NjoiQW5jaG9yIjtpOjk7czo1OiJBYm91dCI7fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxNDoicmVzaXplX2VuYWJsZWQiO3M6MToieSI7czoxMToiY29udGVudHNDc3MiO2E6MDp7fXM6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),
(2, 'Full', 'YTo1OntzOjc6InRvb2xiYXIiO2E6Njc6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6NDoiU2F2ZSI7aToyO3M6NzoiTmV3UGFnZSI7aTozO3M6NzoiUHJldmlldyI7aTo0O3M6OToiVGVtcGxhdGVzIjtpOjU7czozOiJDdXQiO2k6NjtzOjQ6IkNvcHkiO2k6NztzOjU6IlBhc3RlIjtpOjg7czo5OiJQYXN0ZVRleHQiO2k6OTtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjEwO3M6NToiUHJpbnQiO2k6MTE7czoxMjoiU3BlbGxDaGVja2VyIjtpOjEyO3M6NToiU2NheXQiO2k6MTM7czo0OiJVbmRvIjtpOjE0O3M6NDoiUmVkbyI7aToxNTtzOjQ6IkZpbmQiO2k6MTY7czo3OiJSZXBsYWNlIjtpOjE3O3M6OToiU2VsZWN0QWxsIjtpOjE4O3M6MTI6IlJlbW92ZUZvcm1hdCI7aToxOTtzOjQ6IkZvcm0iO2k6MjA7czo4OiJDaGVja2JveCI7aToyMTtzOjU6IlJhZGlvIjtpOjIyO3M6OToiVGV4dEZpZWxkIjtpOjIzO3M6ODoiVGV4dGFyZWEiO2k6MjQ7czo2OiJTZWxlY3QiO2k6MjU7czo2OiJCdXR0b24iO2k6MjY7czoxMToiSW1hZ2VCdXR0b24iO2k6Mjc7czoxMToiSGlkZGVuRmllbGQiO2k6Mjg7czoxOiIvIjtpOjI5O3M6NDoiQm9sZCI7aTozMDtzOjY6Ikl0YWxpYyI7aTozMTtzOjk6IlVuZGVybGluZSI7aTozMjtzOjY6IlN0cmlrZSI7aTozMztzOjk6IlN1YnNjcmlwdCI7aTozNDtzOjExOiJTdXBlcnNjcmlwdCI7aTozNTtzOjEyOiJOdW1iZXJlZExpc3QiO2k6MzY7czoxMjoiQnVsbGV0ZWRMaXN0IjtpOjM3O3M6NzoiT3V0ZGVudCI7aTozODtzOjY6IkluZGVudCI7aTozOTtzOjEwOiJCbG9ja3F1b3RlIjtpOjQwO3M6OToiQ3JlYXRlRGl2IjtpOjQxO3M6MTE6Ikp1c3RpZnlMZWZ0IjtpOjQyO3M6MTM6Ikp1c3RpZnlDZW50ZXIiO2k6NDM7czoxMjoiSnVzdGlmeVJpZ2h0IjtpOjQ0O3M6MTI6Ikp1c3RpZnlCbG9jayI7aTo0NTtzOjQ6IkxpbmsiO2k6NDY7czo2OiJVbmxpbmsiO2k6NDc7czo2OiJBbmNob3IiO2k6NDg7czo1OiJJbWFnZSI7aTo0OTtzOjU6IkZsYXNoIjtpOjUwO3M6NToiVGFibGUiO2k6NTE7czoxNDoiSG9yaXpvbnRhbFJ1bGUiO2k6NTI7czo2OiJTbWlsZXkiO2k6NTM7czoxMToiU3BlY2lhbENoYXIiO2k6NTQ7czo5OiJQYWdlQnJlYWsiO2k6NTU7czo4OiJSZWFkTW9yZSI7aTo1NjtzOjEwOiJFbWJlZE1lZGlhIjtpOjU3O3M6MToiLyI7aTo1ODtzOjY6IlN0eWxlcyI7aTo1OTtzOjY6IkZvcm1hdCI7aTo2MDtzOjQ6IkZvbnQiO2k6NjE7czo4OiJGb250U2l6ZSI7aTo2MjtzOjk6IlRleHRDb2xvciI7aTo2MztzOjc6IkJHQ29sb3IiO2k6NjQ7czo4OiJNYXhpbWl6ZSI7aTo2NTtzOjEwOiJTaG93QmxvY2tzIjtpOjY2O3M6NToiQWJvdXQiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjEwOiJ1cGxvYWRfZGlyIjtzOjA6IiI7fQ==');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
