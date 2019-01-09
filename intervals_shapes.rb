Airrecord.api_key = ENV["AIRRECORD_API_KEY"]

  # has_many :interval_shapes, class: "IntervalShape", column: "Interval Shapes"
class Interval < Airrecord::Table
  self.base_key = "app74RODr0jANsrXt"
  self.table_name = "Intervals"

  def to_node(number)
    {
      group: "nodes",
      data: {
        id: self.id,
        parent: "Intervals",
        name: self["Name"]
      }
    }
  end
end

  # has_many :interval_shapes, class: "IntervalShape", column: "Interval Shapes"
class Shape < Airrecord::Table
  self.base_key = "app74RODr0jANsrXt"
  self.table_name ="Shapes"

  def to_node(number)
    {
      group: "nodes",
      data: {
        id: self.id,
        parent: "Shapes",
        name: self["Abbreviation"]
      }
    }
  end
end

# Associations slow down by creating a lookup
class IntervalShape < Airrecord::Table
  self.base_key = "app74RODr0jANsrXt"
  self.table_name ="Intervals Shapes"

  def to_edge
    {
      group: "edges",
      data: {
        id: self.id,
        source: self["Interval"][0],
        target: self["Shape"][0],
        weight: 1,
        names: [self["Name"]]
      }
    }
  end
end

def generate_elements_json
  elements = []

  # This was nice to have, but we don't need it anymore
  # Interval.all(sort: { "Integer" => "asc" }).each_with_index do |interval, index|
  #   elements.push(interval.to_node(index + 1))
  # end
  # Shape.all(sort: { "Distance" => "asc" }).each_with_index do |shape, index|
  #   elements.push(shape.to_node(index + 1))
  # end

  edges = []
  IntervalShape.all.each do |interval_shape|
    original_edge = edges.find { |edge| edge[:data][:source] == interval_shape["Interval"][0] && edge[:data][:target] == interval_shape["Shape"][0] }
    if (original_edge)
      original_edge[:data][:weight] += 1
      original_edge[:data][:names].push(interval_shape["Name"])
    else
      edges.push(interval_shape.to_edge)
    end
  end

  # This is nice but we need a little extra for the LIK
  elements.concat(edges)

  lik_data = [
    {"group":"edges","data":{"source":"lik-minor-2nd","target":"lik-1","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-major-2nd","target":"lik-2","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-minor-3rd","target":"lik-3","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-major-3rd","target":"lik-4","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-perfect-4th","target":"lik-5","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-tritone","target":"lik-6","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-perfect-5th","target":"lik-7","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-minor-6th","target":"lik-8","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-major-6th","target":"lik-9","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-minor-7th","target":"lik-10","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-major-7th","target":"lik-11","weight":12,"names":[]}},
    {"group":"edges","data":{"source":"lik-octave","target":"lik-12","weight":12,"names":[]}}
  ]

  elements.concat(lik_data)

  data = elements.to_json

  # Write it to a file
  file = File.open("./data/intervals_and_shapes.json", "w")
  file.write(data)
  file.close
end
