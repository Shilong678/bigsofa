# frozen_string_literal: true

class Graph
  attr_reader :graph, :nodes

  def initialize
    @graph = {} # the graph // {node => { edge1 => weight, edge2 => weight}, node2 => ...
    @nodes = []
  end

  # connect each node bidirectional
  def add_edge(source:, target:, weight:)
    connect_graph(source, target, weight) # directional graph
    connect_graph(target, source, weight) # non directed graph (inserts the other edge too)
  end

  private

  # connect each node with target and weight
  def connect_graph(source, target, weight)
    if !graph.key?(source)
      graph[source] = { target => weight }
    else
      graph[source][target] = weight
    end
    nodes << source unless nodes.include?(source)
  end
end
