Fabricator(:course_student) do
  course_id     { Fabricate(:course).id }
  student_id    { Fabricate(:student).id }
end
