class AirtableData
  attr_accessor :keyboards_table
  attr_accessor :domains_table
  attr_accessor :sets_table
  attr_accessor :exercises_table
  attr_accessor :exercise_increments_table
  attr_accessor :practice_sessions_table
  attr_accessor :exercises_practice_sessions_table

  def initialize
    @client = Airtable::Client.new("keyQK3bvtOJxX1AMC")
    self.keyboards_table = @client.table("appeUTAWBfz4YzHtJ", "Keyboards")
    self.domains_table = @client.table("appeUTAWBfz4YzHtJ", "Domains")
    self.sets_table = @client.table("appeUTAWBfz4YzHtJ", "Sets")
    self.exercises_table = @client.table("appeUTAWBfz4YzHtJ", "Exercises")
    self.exercise_increments_table = @client.table("appeUTAWBfz4YzHtJ", "Exercise_Increments")
    self.practice_sessions_table = @client.table("appeUTAWBfz4YzHtJ", "Practice_Sessions")
    self.exercises_practice_sessions_table = @client.table("appeUTAWBfz4YzHtJ", "Exercises_Practice_Sessions")
  end


  # Should these be set as attributes in the same fashion?
  # Not sure the best way to do this to get all of the data without breaking
  # the api limit.
  def keyboards
    keyboards_table.all
  end

  def domains
    domains_table.all
  end

  def sets
    sets_table.all
  end

  def exercises
    exercises_table.all
  end

  def exercise_increments
    exercise_increments_table.all
  end

  def practice_sessions
    practice_sessions_table.all
  end

  def exercises_practice_sessions
    exercises_practice_sessions_table.all
  end

end

data = AirtableData.new

# I could consider doing def table 
# { :keyboards => @client.table("appeUTAWBfz4YzHtJ", "Keyboards") }