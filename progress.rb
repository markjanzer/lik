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



