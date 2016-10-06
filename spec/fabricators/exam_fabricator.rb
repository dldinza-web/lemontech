Fabricator(:exam) do
  name        'Solemne X'
  course_id   { Fabricate(:course, name: 'Estructure de Datos', teacher_id: Fabricate(:teacher, name: 'Mirco').id).id }
end
