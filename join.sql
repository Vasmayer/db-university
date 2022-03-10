/* 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */

SELECT `students`.`name`,`students`.`surname`,`degrees`.`name` 
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia'

/* Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze */

SELECT `courses`.`name` FROM `departments`
JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';