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