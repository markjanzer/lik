require "airrecord_models.rb"

def write_file(table)
  file = File.open("./data/#{table.name.underscore.pluralize}.json", "w")

  data = table.all.map do |obj|
    fields_with_id = obj.fields.merge({ id: obj.id })
    camelized_fields_with_id = {}
    fields_with_id.keys.each do |key|
      new_key = key.to_s.gsub(/\s(.)/) {|e| $1.upcase}.underscore
      camelized_fields_with_id[new_key] = fields_with_id[key]
    end
    camelized_fields_with_id
  end

  file.write(data.to_json)

  file.close
end

def import_data
  write_file(Keyboard)
  write_file(Domain)
  write_file(Exercise)
  write_file(ExerciseSet)
  write_file(ExerciseIncrement)
  write_file(PracticeSession)
  write_file(ExercisesPracticeSession)
end

