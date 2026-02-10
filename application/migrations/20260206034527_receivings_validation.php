<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Receivings_validation extends MY_Migration
{
	public function up()
	{
		$table = $this->db->dbprefix('receivings');

		if (!$this->db->field_exists('validated_by', 'receivings'))
		{
			$this->db->query("ALTER TABLE `$table` ADD COLUMN `validated_by` int(10) DEFAULT NULL AFTER `employee_id`");
		}

		if (!$this->db->field_exists('validated_at', 'receivings'))
		{
			$this->db->query("ALTER TABLE `$table` ADD COLUMN `validated_at` datetime DEFAULT NULL AFTER `validated_by`");
		}

		$index_exists = $this->db->query("SHOW INDEX FROM `$table` WHERE Key_name = 'validated_by'")->num_rows() > 0;
		if (!$index_exists)
		{
			$this->db->query("ALTER TABLE `$table` ADD KEY `validated_by` (`validated_by`)");
		}

		$constraint_exists = $this->db->query(
			"SELECT CONSTRAINT_NAME FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ".$this->db->escape($table)." AND CONSTRAINT_NAME = 'phppos_receivings_ibfk_6'"
		)->num_rows() > 0;
		if (!$constraint_exists)
		{
			$this->db->query("ALTER TABLE `$table` ADD CONSTRAINT `phppos_receivings_ibfk_6` FOREIGN KEY (`validated_by`) REFERENCES `".$this->db->dbprefix('employees')."` (`person_id`)");
		}
	}

	public function down()
	{
	}
}
