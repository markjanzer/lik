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
        name: self[:name]
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
        name: self[:abbreviation]
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
        source: self[:interval][0],
        target: self[:shape][0],
        weight: 1,
        names: [self[:name]]
      }
    }
  end
end

def generate_elements_json
  elements = []

  Interval.all(sort: { "Integer" => "asc" }).each_with_index do |interval, index|
    elements.push(interval.to_node(index + 1))
  end
  Shape.all(sort: { "Distance" => "asc" }).each_with_index do |shape, index|
    elements.push(shape.to_node(index + 1))
  end

  edges = []
  IntervalShape.all.each do |interval_shape|
    original_edge = edges.find { |edge| edge[:data][:source] == interval_shape[:interval][0] && edge[:data][:target] == interval_shape[:shape][0] }
    if (original_edge)
      original_edge[:data][:weight] += 1
      puts original_edge[:data][:names]
      original_edge[:data][:names].push(interval_shape[:name])
    else
      edges.push(interval_shape.to_edge)
    end
  end
  elements.concat(edges)

  return elements.to_json
end
