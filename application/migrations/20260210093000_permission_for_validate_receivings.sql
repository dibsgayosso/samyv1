INSERT INTO `phppos_modules_actions` (`action_id`, `module_id`, `action_name_key`, `sort`)
SELECT 'validate_receiving', 'receivings', 'module_action_validate_receiving', 182
WHERE NOT EXISTS (
	SELECT 1 FROM `phppos_modules_actions`
	WHERE `action_id` = 'validate_receiving' AND `module_id` = 'receivings'
);

INSERT INTO `phppos_permissions_actions` (`module_id`, `person_id`, `action_id`)
SELECT 'receivings', `person_id`, 'validate_receiving'
FROM `phppos_permissions_actions`
WHERE `module_id` = 'receivings' AND `action_id` = 'edit_receiving'
AND `person_id` NOT IN (
	SELECT `person_id` FROM `phppos_permissions_actions`
	WHERE `module_id` = 'receivings' AND `action_id` = 'validate_receiving'
);
