# Gets how many cumulative completed increments there were per practice session
def progress_data
  tk_data = []
  lik_data = []
  data.practice_sessions.sort { |ps1, ps2| ps1.number <=> ps2.number }.each do |ps|
    if find(:keyboards, ps.keyboard).acronym == "TK"
      completed_increments = completed_increments(ps).count
      cumulative_completed_increments = tk_data.last ? tk_data.last + completed_increments : completed_increments
      tk_data.push(cumulative_completed_increments)
    elsif find(:keyboards, ps.keyboard).acronym == "LIK"
      completed_increments = completed_increments(ps).count
      cumulative_completed_increments = lik_data.last ? lik_data.last + completed_increments : completed_increments
      lik_data.push(cumulative_completed_increments)
    end
  end

  return {
    series: [tk_data, lik_data]
  }
end

# Gets progress data, but only up until the given practice session
def practice_session_progress_data(practice_session)
  tk_data = []
  lik_data = []
  final_number = practice_session.number
  data.practice_sessions.select { |ps| ps.number <= final_number }.sort { |ps1, ps2| ps1.number <=> ps2.number }.each do |ps|
    if find(:keyboards, ps.keyboard).acronym == "TK"
      completed_increments = completed_increments(ps).count
      cumulative_completed_increments = tk_data.last ? tk_data.last + completed_increments : completed_increments
      tk_data.push(cumulative_completed_increments)
    elsif find(:keyboards, ps.keyboard).acronym == "LIK"
      completed_increments = completed_increments(ps).count
      cumulative_completed_increments = lik_data.last ? lik_data.last + completed_increments : completed_increments
      lik_data.push(cumulative_completed_increments)
    end
  end 

  return {
    series: [tk_data, lik_data]
  }
end


# For a given exercise_set, get all of the practice sessions that have practice an exercise that belongs to the given practice session
# For each of those practice sessions, then find the increments that belong to the given practice session,
# and add those up.

def exercise_set_progress_data(exercise_set)
  progress_data = {
    "TK": [],
    "LIK": []
  }

  # Get all of the practice_sessions that practice an exercise that belongs to the given exercise_set
  practice_sessions = data.practice_sessions.select do |ps|
    !(exercise_set.exercises & ps.exercises).empty?
  end

  practice_sessions.sort { |ps1, ps2| ps1.number <=> ps2.number }.each do |ps|
    completed_increments = completed_increments(ps)
    completed_increments.select! do |ci|
      find(:exercise_sets, ci.exercise_set) == exercise_set
    end
    completed_increment_count = completed_increments.count

    acronym = find(:keyboards, ps.keyboard).acronym.to_sym
    cumulative_completed_increment_count = progress_data[acronym].last ? progress_data[acronym].last + completed_increment_count : completed_increment_count
    progress_data[acronym].push(cumulative_completed_increment_count)
  end 

  return {
    series: [progress_data[:TK], progress_data[:LIK]]
  }
end


