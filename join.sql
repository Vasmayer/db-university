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

/* 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */

SELECT `courses`.`name` FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`id` = 44;

/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome */

SELECT `students`.`surname`,`students`.`name`,`degrees`.`name`,`departments`.`name` FROM `students` 
JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`,`students`.`name`;

/* 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */

SELECT `courses`.`name`,`degrees`.`name`,`teachers`.`name`,`teachers`.`surname` FROM `courses`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`;

/* 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) */

SELECT `teachers`.`name`,`teachers`.`surname`,`departments`.`name` FROM `teachers` 
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
GROUP BY `teachers`.`id`;

/* 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami */

SELECT `students`.`name`,`students`.`surname`,`courses`.`name`,COUNT(`courses`.`name`) AS 'Ripetuto' FROM `students`
JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams` ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses` ON `courses`.`id` = `exams`.`course_id`
GROUP BY `courses`.`name`,`students`.`name`,`students`.`surname`;