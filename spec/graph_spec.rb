# frozen_string_literal: true

require File.expand_path 'spec_helper.rb', __dir__
require File.expand_path '../lib/graph.rb', __dir__

describe 'Graph' do
  let(:graph) { Graph.new }

  it 'initialize empty graph' do
    expect(graph.graph).to eq({})
  end

  it 'initialize empty nodes' do
    expect(graph.nodes).to eq([])
  end

  it 'connects graph with source,target,weight ' do
    graph.send(:connect_graph, 'a', 'b', 5)
    expect(graph.graph).to eq('a' => { 'b' => 5 })
  end

  it 'connects node with source,target,weight ' do
    graph.send(:connect_graph, 'a', 'b', 5)
    expect(graph.nodes).to include('a')
  end

  it 'connects graph bidirectionally ' do
    graph.add_edge(source: 'a', target: 'b', weight: 5)
    expect(graph.graph.keys).to eq(%w[a b])
  end
end
