# frozen_string_literal: true

class Dijkstra
  attr_reader :previous, :distance
  INFINITY = Float::INFINITY

  def dijkstra(source, graph)
    @distance = {}
    @previous = {}
    graph.nodes.each do |node| # initialization
      @distance[node] = INFINITY # Unknown distance from source to vertex
      @previous[node] = -1 # Previous node in optimal path from source
    end
    @distance[source] = 0 # Distance from source to source
    unvisited_node = graph.nodes.compact # All nodes initially in Q (unvisited nodes)
    until unvisited_node.empty?
      u = nil
      unvisited_node.each do |min|
        u = min if !u || (@distance[min] && (@distance[min] < @distance[u]))
      end
      break if @distance[u] == INFINITY

      unvisited_node -= [u]
      graph.graph[u].keys.each do |vertex|
        alt = @distance[u] + graph.graph[u][vertex]
        if alt < @distance[vertex]
          @distance[vertex] = alt
          @previous[vertex] = u # A shorter path to v has been found
        end
      end

    end
  end
end
