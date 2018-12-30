
# airtableData = {
#   keyboards: Keyboard.all,
#   domains: Domain.all,
#   exerciseSets: ExerciseSet.all,
#   exercises: Exercise.all,
#   exerciseIncrements: ExerciseIncrement.all,
#   practiceSessions: PracticeSession.all,
#   exercisePracticeSessions: ExercisePracticeSession.all,
# }


# File.open("./data/keyboards.json", "w") { |f| f.write((Keyboard.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }
# File.open("./data/domains.json", "w") { |f| f.write((Domain.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }
# File.open("./data/exercises.json", "w") { |f| f.write((Exercise.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }
# File.open("./data/exercise_sets.json", "w") { |f| f.write((ExerciseSet.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }
# File.open("./data/exercise_increments.json", "w") { |f| f.write((ExerciseIncrement.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }
# File.open("./data/practice_sessions.json", "w") { |f| f.write((PracticeSession.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }
# File.open("./data/exercise_practice_sessions.json", "w") { |f| f.write((ExercisePracticeSession.all.map { |o| o.fields.merge({ id: o.id }) }).to_json) }

def write_file(table)
  file = File.open("./data/#{table.name.camelize(:lower).pluralize}.json", "w")

  data = table.all.map do |obj|
    fields_with_id = obj.fields.merge({ id: obj.id })
    camelized_fields_with_id = {}
    fields_with_id.keys.each do |key|
      new_key = key.to_s.gsub(/\s(.)/) {|e| $1.upcase}.camelize(:lower)
      camelized_fields_with_id[new_key] = fields_with_id[key]
    end
    camelized_fields_with_id
  end

  file.write(data.to_json)

  file.close
end

write_file(Keyboard)
write_file(Domain)
write_file(Exercise)
write_file(ExerciseSet)
write_file(ExerciseIncrement)
write_file(PracticeSession)
write_file(ExercisePracticeSession)