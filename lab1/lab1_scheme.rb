require 'turbine'
def load_graph
  inputs = (1..6).map {|e| Turbine::Node.new("x#{e}".to_sym, type: :input)}
  outputs = [Turbine::Node.new(:y, type: :output)]
  graph = Turbine::Graph.new
  [graph,inputs,outputs]
end


