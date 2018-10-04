def progress_data
  tk_data = []
  lik_data = []
  numbers = []
  PracticeSession.all(sort: { "Number": "asc" }).each do |practice_session|
    if practice_session["Keyboard"]["Acronym"] == "TK"
      tk_data.push(practice_session.completed_increment_count)
    elsif practice_session["Keyboard"]["Acronym"] == "LIK"
      lik_data.push(practice_session.completed_increment_count)
    end
  end

  return {
    series: [tk_data, lik_data]
  }
end

def practice_session_progress_data(practice_session)
  tk_data = []  
  lik_data = []
  final_number = practice_session["Number"]
  numbers = (0..final_number).to_a
  PracticeSession.all(filter: "{Number} <= #{final_number}", sort: { "Number": "asc" }).each do |ps|
    if ps["Keyboard"]["Acronym"] == "TK"
      tk_data.push(ps.completed_increment_count)
    elsif ps["Keyboard"]["Acronym"] == "LIK"
      lik_data.push(ps.completed_increment_count)
    end
  end

  return {
    series: [tk_data, lik_data]
  }
end