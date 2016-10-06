# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#STUDENTS
students = []
students_data = [
  ['Joseito','Curbelo','1991-09-21'],
  ['Manuel','Álverez','1988-07-23',1.65],
  ['Angelica','Gonzales','2001-04-02',1.20],
  ['Ana Laura','Portillo','2005-07-09'],
  ['Matías','Gutierres','2001-06-05',1.65]
]

students_data.each do |item|
  students << Student.where(name: item[0], surname: item[1]).first_or_create do |resource|
    resource.birthday = item[2]
    resource.height = item[3]
  end
end

# TEACHERS
teachers = []
teachers_data = [
  ['Juan','Pablo Gutierrez'],
  ['Andrea','Espinoza Álvarez'],
  ['Julian','García Medero']
]

teachers_data.each do |item|
  teachers << Teacher.where(name: item[0], surname: item[1]).first_or_create
end

# COURSES
courses = []
courses_data = [
  ['Programación',teachers[0].id],
  ['Matemáticas',teachers[1].id],
  ['Lógica y Algoritmos',teachers[0].id],
  ['Física',teachers[2].id],
  ['Estructura de Datos',teachers[2].id]
]

courses_data.each do |item|
  courses << Course.where(name: item[0], teacher_id: item[1]).first_or_create
end

# EXAMS
exams = []
exams_data = [
  'Examen 1',
  'Examen 2',
  'Examen 3',
  'Solemne 1',
  'Solemne 2',
  'Solemne 3'
]

exams_data.each { |exam_name| exams.push Exam.find_or_create_by(name: exam_name) }

# COURSES AND STUDENTS
course_students = []
course_students_data = [
  [courses[0].id, students[0].id],
  [courses[3].id, students[0].id],
  [courses[0].id, students[1].id],
  [courses[4].id, students[2].id],
  [courses[0].id, students[3].id],
  [courses[2].id, students[3].id],
  [courses[3].id, students[3].id],
  [courses[4].id, students[4].id]
]

course_students_data.each { |item| course_students.push CourseStudent.where(course_id: item[0], student_id: item[1]).first_or_create }

# RESULT EXAMS
result_exams = []
result_exams_data = [
  [course_students[0].id,exams[0].id, 6],
  [course_students[0].id,exams[1].id,5],
  [course_students[0].id,exams[2].id,5],

  [course_students[1].id,exams[0].id, 4],
  [course_students[1].id,exams[1].id,5],

  [course_students[2].id,exams[0].id, 4],

  [course_students[3].id,exams[0].id, 7],
  [course_students[3].id,exams[1].id,6],

  [course_students[4].id,exams[0].id, 3],

  [course_students[5].id,exams[0].id, 6],
  [course_students[5].id,exams[1].id,6],

  [course_students[6].id,exams[3].id,3],
  [course_students[6].id,exams[4].id,2],
  [course_students[6].id,exams[5].id,2],

  [course_students[7].id,exams[0].id, 3],
  [course_students[7].id,exams[1].id,3],
  [course_students[7].id,exams[2].id,2]
]

result_exams_data.each { |item| ResultExam.where(course_student_id: item[0], exam_id: item[1], mark: item[2]).first_or_create }

