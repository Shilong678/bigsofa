# frozen_string_literal: true

require File.expand_path 'graph.rb', __dir__
require File.expand_path 'dijkstra.rb', __dir__

class Shortest
  attr_reader :dijkstra
  INFINITY = Float::INFINITY

  def initialize
    @dijkstra = Dijkstra.new
  end

  def find_shortest_path(graph:, source:, target:)
    origin = shortest_paths(graph, source)
    origin.find { |el| el[:destination] == target }
  end

  private


  def find_path(dest)
    @path = []
    find_path dijkstra.previous[dest] if dijkstra.previous[dest] != -1
    @path << dest
  end


  def shortest_paths(graph, source)
    dijkstra.dijkstra(source, graph)
    graph.nodes.map do |dest|
      actual_distance = if dijkstra.distance[dest] != INFINITY
                          dijkstra.distance[dest]
                        else
                          'no path'
                        end
      { destination: dest, path: find_path(dest), distance: actual_distance }
    end
  end
end
