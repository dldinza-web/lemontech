Fabricator(:course) do
  name          "Programming"
  teacher_id    { Fabricate(:teacher).id }
end
