# Airrecord::Table.client.connection.request :retry, max: 8, interval: 10, interval_randomness: 2, backoff_factor: 2
# Airrecord::Table.client.connection.request :circuit_breaker, timeout: 20, threshold: 5
Airrecord.api_key = ENV["AIRRECORD_API_KEY"]


class Keyboard < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Keyboards"

  has_many :practice_sessions, class: "PracticeSession", column: "Practice Sessions"
end

class Domain < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Domains"

  has_many :exercises, class: "Exercise", column: "Exercises"
  has_many :exercise_sets, class: "ExerciseSet", column: "Exercise Sets"
end

class ExerciseSet < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Exercise Sets"

  belongs_to :domain, class: "Domain", column: "Domain"
  has_many :exercises, class: "Exercise", column: "Exercises"
end

class Exercise < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Exercises"

  belongs_to :domain, class: "Domain", column: "Domain"
  belongs_to :set, class: "ExerciseSet", column: "Exercise Set"
  has_many :exercise_increments, class: "ExerciseIncrement", column: "Exercise Increments"
  # Not sure if I need this one
  has_many :exercises_practice_sessions, class: "ExercisePracticeSession", column: "Exercise Practice Sessions"
  has_many :practice_sessions, class: "PracticeSession", column: "Practice Sessions"
end

class ExerciseIncrement < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Exercise Increments"

  belongs_to :domain, class: "Domain", column: "Domain"
  belongs_to :set, class: "ExerciseSet", column: "Exercise Set"
  belongs_to :exercise, class: "Exercise", column: "Exercise"
  # Does this link to practice session or exercise practice session?
  belongs_to :tk_completion, class: "ExercisesPracticeSessions", column: "TK Completion"
  belongs_to :lik_completion, class: "ExercisesPracticeSessions", column: "LIK Completion"
end

class PracticeSession < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Practice Sessions"

  def completed_increments
    completed_increments = []
    keyboard = self[:keyboard][:acronym]
    # sleep(0.21)
    self[:exercises_practice_sessions].each do |eps|
      # sleep(0.21)
      if keyboard == "TK" && eps[:tk_completed]
        completed_increments.concat(eps[:tk_completed])
      elsif keyboard == "LIK" && eps[:lik_completed]
        completed_increments.concat(eps[:lik_completed])
      end
    end
    return completed_increments
  end

  def completed_increment_count
    self.completed_increments.count
  end

  belongs_to :keyboard, class: "Keyboard", column: "Keyboard"
  has_many :exercises_practice_sessions, class: "ExercisePracticeSession", column: "Exercises Practice Sessions"
  has_many :exercises, class: "Exercise", column: "Exercises"
end

class ExercisePracticeSession < Airrecord::Table
  self.base_key = "appeUTAWBfz4YzHtJ"
  self.table_name = "Exercises Practice Sessions"

  belongs_to :practice_session, class: "PracticeSession", column: "Practice Session"
  belongs_to :exercise, class: "Exercise", column: "Exercise"
  has_many :tk_completed, class: "ExerciseIncrement", column: "TK Completed"
  has_many :lik_completed, class: "ExerciseIncrement", column: "LIK Completed"
end
