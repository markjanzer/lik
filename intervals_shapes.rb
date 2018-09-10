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
      },
      position: {
        x: number * 100 * 28/13.0,
        y: 0
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
      },
      position: {
        x: number * 100,
        y: 300
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
        weight: 2
      }
    }
  end
end

# intervals = Interval.all.map { |i| i.to_node }
# shapes = Shape.all.map { |s| s.to_node }
# interval_shapes = IntervalShape.all.map { |is| is.to_edge }

def generate_elements_json
  elements = []

  Interval.all(sort: { "Integer" => "asc" }).each_with_index do |interval, index|
    elements.push(interval.to_node(index + 1))
  end
  Shape.all(sort: { "Distance" => "asc" }).each_with_index do |shape, index|
    elements.push(shape.to_node(index + 1))
  end
  puts elements.map { |e| e[:parent] }

  edges = []
  IntervalShape.all.each do |interval_shape|
    original_edge = edges.find { |edge| edge[:data][:source] == interval_shape[:interval][0] && edge[:data][:target] == interval_shape[:shape][0] }
    if (original_edge)
      original_edge[:data][:weight] = original_edge[:data][:weight] + 2
    else
      edges.push(interval_shape.to_edge)
    end
  end
  elements.concat(edges)

  return elements.to_json
end
