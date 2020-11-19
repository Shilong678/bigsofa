# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/dijkstra.rb', __dir__
require File.expand_path '../lib/graph.rb', __dir__

describe 'Dijkstra' do
  let(:dij) { Dijkstra.new }
  let(:graph) { Graph.new }

  before do
    graph.add_edge(source: 'a', target: 'b', weight: 5)
    graph.add_edge(source: 'b', target: 'c', weight: 3)
    graph.add_edge(source: 'c', target: 'd', weight: 1)
    dij.dijkstra('a', graph)
  end
  it ' tracks distance ' do
    expect(dij.distance).to eq('a' => 0, 'b' => 5, 'c' => 8, 'd' => 9)
  end

  it 'tracks connected node ' do
    expect(dij.previous).to eq('a' => -1, 'b' => 'a', 'c' => 'b', 'd' => 'c')
  end
end
