require "secrets.rb"

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

# ============================================
# TK Intervals
# ============================================

class Interval < Airrecord::Table
  self.base_key = "app74RODr0jANsrXt"
  self.table_name = "Intervals"

  has_many :interval_shapes, class: "IntervalShape", column: "Intverval Shapes"

  def to_node
    {
      group: "nodes",
      data: {
        id: self.id,
        parent: "Intervals",
        name: self[:name]
      },
      position: {
        x: 100,
        y: self[:integer] * 100
      }
    }
  end
end

class Shape < Airrecord::Table
  self.base_key = "app74RODr0jANsrXt"
  self.table_name ="Shapes"

  has_many :interval_shapes, class: "IntervalShape", column: "Intverval Shapes"

  def to_node
    {
      group: "nodes",
      data: {
        id: self.id,
        parent: "Shapes",
        name: self[:name]
      },
      position: {
        x: 200,
        y: self[:autonumber] * 100
      }
    }
  end
end

class IntervalShape < Airrecord::Table
  self.base_key = "app74RODr0jANsrXt"
  self.table_name ="Intervals Shapes"

  belongs_to :interval, class: "Interval", column: "Interval"
  belongs_to :shape, class: "Shape", column: "Shape"

  def to_edge
    {
      group: "edges",
      data: {
        id: self.id,
        source: self[:interval][:id],
        target: self[:shape][:id]
      }
    }
  end
end




