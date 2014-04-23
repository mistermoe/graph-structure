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
  def shortest_route(n1, n2)
    node1 = @nodes[n1]
    node2 = @nodes[n2]
    discovered = {}
    solved = {}
    discovered[n1] = 0
    recursive(node1, node2, discovered, solved)
  end

  def recursive(node1, node2, discovered, solved)
    node1.edges.each do |neighbor, cost|
          if !discovered[neighbor]
            if !solved[neighbor]
              discovered[neighbor] = discovered[node1.value] + cost
            end
          else
            check = discovered[node1.value] + cost
            if check < discovered[neighbor]
              discovered[neighbor] = check
            end
          end
        end
        solved[node1.value] = discovered[node1.value]
        discovered.delete(node1.value)
    end
      #make a find smallest function separate from this
        smallest = discovered.values[0]
        discovered.each.values do |cost|
            if cost < smallest
              smallest = cost
            end
        end
        discovered.each do |k,v|
            if v == smallest[0]
              smallest_neighbor = k
              return smallest_neighbor
            end
        end
        if smallest_neighbor == node2
          return discovered[smallest_neighbor]
        end
        recursive(smallest_neighbor, node2, discovered, solved)
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
