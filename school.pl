% Database of students, teachers, and subjects with codes
entity(student(john), 'S101').
entity(student(lisa), 'S102').
entity(teacher(mary), 'T201').
entity(teacher(david), 'T202').
entity(subject(math), 'M301').
entity(subject(english), 'E302').
entity(subject(history), 'H303').

% Relationships between teachers and subjects
% This defines which teacher teaches which subject.
teaches_relation('T201', 'M301').  % Mary teaches Math
teaches_relation('T202', 'E302').  % David teaches English
teaches_relation('T202', 'H303').  % David teaches History

% Predicate to retrieve subjects taught by a teacher
subjects_taught_by_teacher(TeacherName, Subjects) :-
    % Find the teacher's code
    entity(teacher(TeacherName), TeacherCode),
    % Retrieve all subjects taught by this teacher
    findall(Subject,
        (teaches_relation(TeacherCode, SubjectCode),
         entity(subject(Subject), SubjectCode)),
        Subjects).

% Example queries
% To check what subjects Mary teaches
% ?- subjects_taught_by_teacher(mary, Subjects).
% Expected Output: Subjects = [math].

% To check what subjects David teaches
% ?- subjects_taught_by_teacher(david, Subjects).
% Expected Output: Subjects = [english, history].

% Trying to retrieve subjects for a student (no subjects expected)
% ?- subjects_taught_by_teacher(john, Subjects).
% Expected Output: Subjects = [].
