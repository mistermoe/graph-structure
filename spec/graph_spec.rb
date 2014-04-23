require 'spec_helper'
describe 'Graph' do
  before do
    @graph = Graph.new
  end
  it 'exists' do
    expect(Graph).to be_a(Class)
  end
  it 'can add a node' do
    result = @graph.add_node('left boob')

    expect(result.value).to eq('left boob')
    expect(@graph.nodes['left boob'].value).to eq(result.value)
  end
  it 'can add an edge' do
    node1 = @graph.add_node('left boob')
    node2 = @graph.add_node('right boob')

    result = @graph.add_edge(node1.value, node2.value, 3)

    expect(node1.edges[node2.value]).to eq(3)
    expect(node2.edges[node1.value]).to eq(3)
  end
  it 'can remove an edge' do
    node1 = @graph.add_node('left boob')
    node2 = @graph.add_node('right boob')

    @graph.add_edge(node1.value, node2.value, 3)
    @graph.remove_edge(node1.value, node2.value)

    expect(node1.edges[node2.value]).to eq(nil)
    expect(node2.edges[node1.value]).to eq(nil)

  end
end


