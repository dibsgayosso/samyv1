<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Receivings_store_account_payment_logs extends MY_Migration
{
	public function up()
	{
		$this->execute_sql(realpath(dirname(__FILE__).'/'.'20260217170000_receivings_store_account_payment_logs.sql'));
	}

	public function down()
	{
	}
}
