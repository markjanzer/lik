
# Gets how many cumulative completed increments there were per practice session
def progress_data(practice_sessions, select_proc=nil)
  progress_data = {
    "TK": [],
    "LIK": []
  }

  practice_sessions.sort { |ps1, ps2| ps1.number <=> ps2.number }.each do |ps|
    completed_increments = completed_increments(ps)
    if select_proc
      completed_increments.select! { |ci| select_proc.call(ci) }
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


def all_progress
  progress_data(data.practice_sessions)
end

def progress_until_practice_session(practice_session)
  final_number = practice_session.number
  practice_sessions = data.practice_sessions.select { |ps| ps.number <= final_number }
  progress_data(practice_sessions)
end

def domain_progress(domain)
  select_proc = proc { |ci| find(:domains, ci.domain) == domain }
  progress_data(data.practice_sessions, select_proc)
end

def exercise_set_progress(exercise_set)
  select_proc = proc { |ci| find(:exercise_sets, ci.exercise_set) == exercise_set }
  progress_data(data.practice_sessions, select_proc)
end
