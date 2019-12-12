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

def practice_session_completed_increments(practice_session)
  completed_increments = []
  find_all(:exercises_practice_sessions, practice_session.exercises_practice_sessions).each do |eps|
    completed_increments.concat(exercise_practice_session_completed_increments(eps))
  end
  return completed_increments
end

def exercise_practice_session_completed_increments(exercise_practice_session)
  completed_increments = []
  practice_session = find(:practice_sessions, exercise_practice_session.practice_session)
  keyboard_acronym = find(:keyboards, practice_session.keyboard).acronym
  # eps.tk_completed and .lik_completed are either nil or an array
  if keyboard_acronym == "TK" && exercise_practice_session.tk_completed
    exercise_increments = find_all(:exercise_increments, exercise_practice_session.tk_completed)
    exercise_increments.select! { |ei| !ei.deprecated }
    completed_increments.concat(exercise_increments)
  elsif keyboard_acronym == "LIK" && exercise_practice_session.lik_completed
    exercise_increments = find_all(:exercise_increments, exercise_practice_session.lik_completed)
    exercise_increments.select! { |ei| !ei.deprecated }
    completed_increments.concat(exercise_increments)
  end
  return completed_increments
end

def any_completed_increments?(exercise_set)
  exercises = find_all(:exercises, exercise_set.exercises)
  exercise_increments = exercises.map { |exercise| find_all(:exercise_increments, exercise.exercise_increments) }.flatten
  return exercise_increments.any? { |ei| !ei.deprecated && (ei.tk_completion || ei.lik_completion) }
end

def format_as_time(minutes)
  "#{minutes / 60}:#{sprintf('%02d', minutes % 60)}:00" 
end

def format_completed_increment_count(count) 
  if (count > 1)
    return "#{count} increments completed"
  elsif (count == 1)
    return "#{count} increment completed"
  end
end