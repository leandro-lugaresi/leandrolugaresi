SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `activation_key` VARCHAR(150) NOT NULL,
  `date_activation_key` DATE NULL,
  `salt` VARCHAR(150) NOT NULL,
  `status` CHAR NOT NULL DEFAULT 'I',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `activation_key_UNIQUE` (`activation_key` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acl_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acl_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `display_name` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `parent_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_acl_role_acl_role1_idx` (`parent_id` ASC),
  CONSTRAINT `fk_acl_role_acl_role1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `acl_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acl_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acl_resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` CHAR NULL,
  `display_name` VARCHAR(100) NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acl_privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acl_privilege` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `do_log` TINYINT(1) NOT NULL DEFAULT 1,
  `display_name` VARCHAR(100) NULL,
  `role_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acl_privileges_acl_roles_idx` (`role_id` ASC),
  INDEX `fk_acl_privileges_acl_resources1_idx` (`resource_id` ASC),
  CONSTRAINT `fk_acl_privileges_acl_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `acl_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_acl_privileges_acl_resources1`
    FOREIGN KEY (`resource_id`)
    REFERENCES `acl_resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `path_url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `site_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `site_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `text` TEXT NOT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `date_published` DATE NULL,
  `status_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `parent_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_pacman_status1_idx` (`status_id` ASC),
  INDEX `fk_posts_users1_idx` (`author_id` ASC),
  INDEX `fk_posts_type1_idx` (`type_id` ASC),
  UNIQUE INDEX `name_url_UNIQUE` (`url` ASC),
  INDEX `fk_site_content_site_content1_idx` (`parent_id` ASC),
  CONSTRAINT `fk_posts_pacman_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `status` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`author_id`)
    REFERENCES `user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_posts_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_site_content_site_content1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `site_content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_profile` (
  `users_id` INT NOT NULL,
  `about` TEXT NULL,
  `nickname` VARCHAR(50) NULL,
  `website` VARCHAR(255) NULL,
  `photo` VARCHAR(500) NULL,
  PRIMARY KEY (`users_id`),
  INDEX `fk_pacman_user_profile_pacman_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_pacman_user_profile_pacman_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `metatags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `metatags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entity` VARCHAR(150) NOT NULL,
  `entity_id` INT NOT NULL,
  `title` VARCHAR(100) NULL DEFAULT '',
  `description` VARCHAR(255) NULL DEFAULT '',
  `robots` VARCHAR(45) NULL DEFAULT '',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gallery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entity` VARCHAR(150) NOT NULL,
  `entity_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interface`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interface` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pk` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `pk_UNIQUE` (`pk` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `description` VARCHAR(400) NOT NULL,
  `details` TEXT NULL,
  `user_id` INT NOT NULL,
  `privilege_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user1_idx` (`user_id` ASC),
  INDEX `fk_log_acl_privilege1_idx` (`privilege_id` ASC),
  CONSTRAINT `fk_log_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_acl_privilege1`
    FOREIGN KEY (`privilege_id`)
    REFERENCES `acl_privilege` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `itens_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itens_menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(100) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `url` VARCHAR(255) NULL,
  `ordem` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `parent_item_menu_id` INT NULL,
  `site_content_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_itens_menus_menus1_idx` (`menu_id` ASC),
  INDEX `fk_itens_menus_itens_menus1_idx` (`parent_item_menu_id` ASC),
  INDEX `fk_itens_menus_site_content1_idx` (`site_content_id` ASC),
  CONSTRAINT `fk_itens_menus_menus1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `menu` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_itens_menus_itens_menus1`
    FOREIGN KEY (`parent_item_menu_id`)
    REFERENCES `itens_menu` (`id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `fk_itens_menus_site_content1`
    FOREIGN KEY (`site_content_id`)
    REFERENCES `site_content` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `type_menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `menu_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_type_menu_menu1_idx` (`menu_id` ASC),
  CONSTRAINT `fk_type_menu_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `filetype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filetype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `extension` VARCHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `file` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL,
  `path` VARCHAR(500) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `entity` VARCHAR(150) NULL,
  `entity_id` INT NULL,
  `filetype_id` INT NOT NULL,
  `upload_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_file_filetype1_idx` (`filetype_id` ASC),
  UNIQUE INDEX `filetype_id_UNIQUE` (`filetype_id` ASC),
  CONSTRAINT `fk_file_filetype1`
    FOREIGN KEY (`filetype_id`)
    REFERENCES `filetype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `message_text`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `message_text` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `interface_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_text_interface_text1_idx` (`interface_id` ASC),
  INDEX `index_name_page` (`name` ASC),
  CONSTRAINT `fk_message_text_interface_text1`
    FOREIGN KEY (`interface_id`)
    REFERENCES `interface` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gallery_itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gallery_itens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ordem` INT NOT NULL,
  `gallery_id` INT NOT NULL,
  `file_id` INT NOT NULL,
  INDEX `fk_gallery_has_videos_gallery2_idx` (`gallery_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_gallery_itens_file1_idx` (`file_id` ASC),
  CONSTRAINT `fk_gallery_has_videos_gallery2`
    FOREIGN KEY (`gallery_id`)
    REFERENCES `gallery` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gallery_itens_file1`
    FOREIGN KEY (`file_id`)
    REFERENCES `file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acl_role_linker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acl_role_linker` (
  `role_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`),
  INDEX `fk_acl_role_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_acl_role_has_user_acl_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_acl_role_has_user_acl_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `acl_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acl_role_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `config` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `module` VARCHAR(100) NOT NULL,
  `config` VARCHAR(200) NOT NULL,
  `value` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `key_UNIQUE` (`module` ASC, `config` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `template_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `template_config` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entity` VARCHAR(150) NOT NULL,
  `entity_id` INT NOT NULL,
  `config` VARCHAR(200) NOT NULL,
  `value` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `products_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `deletedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `description` TEXT NOT NULL,
  `photo` VARCHAR(200) NULL,
  `deletedAt` DATETIME NULL,
  `categorys_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_categorys1_idx` (`categorys_id` ASC),
  CONSTRAINT `fk_products_categorys1`
    FOREIGN KEY (`categorys_id`)
    REFERENCES `products_category` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content_categorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `content_categorys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `deletedAt` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content_categorys_has_site_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `content_categorys_has_site_content` (
  `content_categorys_id` INT NOT NULL,
  `site_content_id` INT NOT NULL,
  PRIMARY KEY (`content_categorys_id`, `site_content_id`),
  INDEX `fk_content_categorys_has_site_content_site_content1_idx` (`site_content_id` ASC),
  INDEX `fk_content_categorys_has_site_content_content_categorys1_idx` (`content_categorys_id` ASC),
  CONSTRAINT `fk_content_categorys_has_site_content_content_categorys1`
    FOREIGN KEY (`content_categorys_id`)
    REFERENCES `content_categorys` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_content_categorys_has_site_content_site_content1`
    FOREIGN KEY (`site_content_id`)
    REFERENCES `site_content` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sac_key` VARCHAR(300) NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `subject` VARCHAR(200) NOT NULL,
  `message` TEXT NOT NULL,
  `extra_information` TEXT NULL,
  `read` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_response`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_response` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `contact_id` INT NOT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contact_response_contact1_idx` (`contact_id` ASC),
  INDEX `fk_contact_response_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_contact_response_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_contact_response_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brute_force_register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `brute_force_register` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NOT NULL,
  `requests` INT NOT NULL DEFAULT 0,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ip_address_UNIQUE` (`ip_address` ASC))
ENGINE = MyISAM;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
