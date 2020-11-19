# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/shortest.rb', __dir__

describe 'Shortest' do
  let(:short) { Shortest.new }
  let(:gr) { Graph.new }
  before do
    gr.add_edge(source: 0, target: 1, weight: 10)
    gr.add_edge(source: 1, target: 2, weight: 4)
    gr.add_edge(source: 2, target: 3, weight: 15)
    gr.add_edge(source: 3, target: 7, weight: 9)
    gr.add_edge(source: 0, target: 4, weight: 15)
    gr.add_edge(source: 4, target: 5, weight: 8)
    gr.add_edge(source: 5, target: 7, weight: 10)
    gr.add_edge(source: 0, target: 6, weight: 21)
    gr.add_edge(source: 6, target: 7, weight: 7)
  end
  it 'find the shortest path' do
    result = { destination: 7, path: [0, 6, 7], distance: 28 }
    expect(short.find_shortest_path(graph: gr, source: 0, target: 7)).to eq result
  end
end
