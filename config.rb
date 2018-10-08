# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Use Sprockets for asset pipeline
require "sprockets/es6"
activate :sprockets do |s|
  s.supported_output_extensions << '.es6'
end

# Pages with custom layouts
# page "custom/*", layout: :custom_layou

activate :livereload

# Pretty URLs
activate :directory_indexes

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/articles/*.html', layout: "article"

# require "models.rb"
require "intervals_shapes.rb"
require "progress.rb"

configure :development do
  # require "secrets.rb"
  # instantiate_shit(AIRRECORD_API_KEY)
  # ENV["AIRRECORD_API_KEY"] = AIRRECORD_API_KEY
  # ENV["AIRRECORD_API_KEY"] = "TESTEROOOOOOOONI"
  Airrecord.api_key = AIRRECORD_API_KEY

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
      self[:exercises_practice_sessions].each do |eps|
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

  PracticeSession.all.each do |practice_session|
    proxy "/practice-sessions/#{practice_session.id}", "/practice-sessions/show.html", :locals => { :practice_session => practice_session }, layout: "layout", :ignore => true
  end
end

configure :build do

  Airrecord.api_key = AIRRECORD_API_KEY

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
      self[:exercises_practice_sessions].each do |eps|
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

  PracticeSession.all.each do |practice_session|
    proxy "/practice-sessions/#{practice_session.id}", "/practice-sessions/show.html", :locals => { :practice_session => practice_session }, layout: "layout", :ignore => true
  end

  # ENV["AIRRECORD_API_KEY"] = AIRRECORD_API_KEY
  # Airrecord.api_key = AIRRECORD_API_KEY
end


# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  # https://cobwwweb.com/render-inline-svg-rails-middleman
  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end
end

# configure :production do
  # ENV["AIRRECORD_API_KEY"]

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

  # configure :build do
  #   activate :minify_css
  #   activate :minify_javascript
  # end