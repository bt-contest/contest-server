CREATE OR REPLACE ALGORITHM=
MERGE VIEW `final_teen` AS

SELECT COUNT(*),
       `moderation_stack_grouped`.*
FROM `vote`
JOIN `moderation_stack_grouped` ON `vote`.`competitive_work_id_competitive_work` = `moderation_stack_grouped`.`id_competitive_work`
WHERE `moderation_stack_grouped`.`age` BETWEEN 13 AND 18
GROUP BY `vote`.`competitive_work_id_competitive_work`
ORDER BY COUNT(*) DESC