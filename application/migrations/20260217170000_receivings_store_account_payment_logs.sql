CREATE TABLE IF NOT EXISTS `phppos_receivings_store_account_payment_logs` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `receiving_id` INT(10) NOT NULL,
  `store_account_payment_receiving_id` INT(10) NOT NULL,
  `employee_id` INT(10) NOT NULL,
  `payment_amount` DECIMAL(23,10) NOT NULL,
  `payment_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receiving_id` (`receiving_id`),
  KEY `store_account_payment_receiving_id` (`store_account_payment_receiving_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `phppos_recv_store_acct_logs_ibfk_1` FOREIGN KEY (`receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`) ON DELETE CASCADE,
  CONSTRAINT `phppos_recv_store_acct_logs_ibfk_2` FOREIGN KEY (`store_account_payment_receiving_id`) REFERENCES `phppos_receivings` (`receiving_id`) ON DELETE CASCADE,
  CONSTRAINT `phppos_recv_store_acct_logs_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
