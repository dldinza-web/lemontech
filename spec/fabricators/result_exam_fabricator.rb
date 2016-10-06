Fabricator(:result_exam) do
  exam_id             { Fabricate(:exam).id }
  course_student_id   { Fabricate(:course_student).id }
  mark                5
end
