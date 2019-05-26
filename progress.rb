
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

  labels = practice_sessions.sort { |ps1, ps2| ps1.number <=> ps2.number }.map(&:number).uniq
  # We can do this for tighter ones.
  # labels = labels.map { |label| label.to_i % 2 == 0 ? label : ""}

  return {
    series: [progress_data[:TK], progress_data[:LIK]],
    labels: labels,
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

def domain_progress(domain, practice_sessions=data.practice_sessions)
  # if practice_sessions.nil?
  #   practice_sessions = data.practice_sessions
  # end
  select_proc = proc { |ci| find(:domains, ci.domain) == domain }
  progress_data(practice_sessions, select_proc)
end

def exercise_set_progress(exercise_set, practice_sessions=data.practice_sessions)
  # if practice_sessions.nil?
  #   practice_sessions = data.practice_sessions
  # end
  select_proc = proc { |ci| find(:exercise_sets, ci.exercise_set) == exercise_set }
  progress_data(practice_sessions, select_proc)
end

# Apply this to progress_data to alternate labels
def alternate_labels(data, modulo=2)
  new_labels = data[:labels].map { |label| label.to_i % modulo == 0 ? label : ""}
  return {
    series: data[:series],
    labels: new_labels,
  }
end
