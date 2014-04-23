class Graph
  attr_accessor :nodes
  def initialize
    @nodes = {}
  end
  def add_node(value)
  node = Node.new(value)
  @nodes[value] = node
  return node
  end

  def remove_node(value)
   @nodes.delete(value)
  end

  def add_edge(node_value_1, node_value_2, cost)
    node1 = @nodes.keys.find{|node| node == node_value_1}
    node2 = @nodes.keys.find{|node| node == node_value_2}
    @nodes[node1].edges[node2] = cost
    @nodes[node2].edges[node1] = cost
  end

  def remove_edge(node_value_1, node_value_2)
    node1 = @nodes.keys.find{|node| node == node_value_1}
    node2 = @nodes.keys.find{|node| node == node_value_2}
    @nodes[node1].edges.delete(node2)
    @nodes[node2].edges.delete(node1)

  end

  # More methods here
  def shortest_route(n1, n2, stops=[])
    node1 = @nodes[n1]
    node2 = @nodes[n2]
    binding.pry
    n1_neighbors = n1.edges.keys
    n1_neighbors.each do |neighbor|
      if (neighbor == n2)
        return cost
      end
      if !stops.include?(neighbor)
        shortest_route(neighbor, n2)

    end
  end

end

class Node
  attr_accessor :edges, :value
  def initialize(value)
    @value = value
    @edges = {} # hash to map connected Nodes to the associated cost
  end

  def add_edge(node, cost)
   end

  # More methods here
end
