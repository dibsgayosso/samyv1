<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	class Migration_permission_for_validate_receivings extends MY_Migration
	{
	    public function up()
			{
				$this->execute_sql(realpath(dirname(__FILE__).'/'.'20260210093000_permission_for_validate_receivings.sql'));
	    }

	    public function down()
			{
	    }

	}
