require "airrecord_models.rb"

def write_file(table)
  file = File.open("./data/#{table.name.underscore.pluralize}.json", "w")

  data = table.all.map do |obj|
    fields_with_id = obj.fields.merge({ id: obj.id })
    camelized_fields_with_id = {}
    fields_with_id.keys.each do |key|
      new_key = key.to_s.gsub(/\s(.)/) {|e| $1.upcase}.underscore
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

def find(table, id)
  if id.is_a? Array
    id = id[0]
  end
  data[table].find { |i| i.id == id } 
end

def find_all(table, id)
  if id.is_a? Array
    data[table].select { |i| id.include?(i.id) }
  else
    data[table].select { |i| i.id == id }
  end
end

def completed_increments(practice_session)
  completed_increments = []
  keyboard_acronym = find(:keyboards, practice_session.keyboard).acronym
  find_all(:exercise_practice_sessions, practice_session.exercises_practice_sessions).each do |eps|
    # eps.tk_completed and .lik_completed are either nil or an array
    if keyboard_acronym == "TK" && eps.tk_completed
      completed_increments.concat(find_all(:exercise_increments, eps.tk_completed))
    elsif keyboard_acronym == "LIK" && eps.lik_completed
      completed_increments.concat(find_all(:exercise_increments, eps.lik_completed))
    end
  end
  return completed_increments
end

  # def completed_increments
  #   completed_increments = []
  #   keyboard = self[:keyboard][:acronym]
  #   # sleep(0.21)
  #   self[:exercises_practice_sessions].each do |eps|
  #     # sleep(0.21)
  #     if keyboard == "TK" && eps[:tk_completed]
  #       completed_increments.concat(eps[:tk_completed])
  #     elsif keyboard == "LIK" && eps[:lik_completed]
  #       completed_increments.concat(eps[:lik_completed])
  #     end
  #   end
  #   return completed_increments
  # end



