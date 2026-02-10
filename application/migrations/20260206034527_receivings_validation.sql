ALTER TABLE `phppos_receivings`
  ADD COLUMN `validated_by` int(10) DEFAULT NULL AFTER `employee_id`;

ALTER TABLE `phppos_receivings`
  ADD COLUMN `validated_at` datetime DEFAULT NULL AFTER `validated_by`;

ALTER TABLE `phppos_receivings`
  ADD KEY `validated_by` (`validated_by`);

ALTER TABLE `phppos_receivings`
  ADD CONSTRAINT `phppos_receivings_ibfk_6` FOREIGN KEY (`validated_by`) REFERENCES `phppos_employees` (`person_id`);
