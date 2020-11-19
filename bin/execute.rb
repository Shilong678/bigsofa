#!/usr/bin/env ruby
# frozen_string_literal: true

require  './lib/shortest'
require  './lib/graph'

gr = Graph.new
gr.add_edge(source: 0, target: 1, weight: 10)
gr.add_edge(source: 1, target: 2, weight: 4)
gr.add_edge(source: 2, target: 3, weight: 15)
gr.add_edge(source: 3, target: 7, weight: 9)
gr.add_edge(source: 0, target: 4, weight: 15)
gr.add_edge(source: 4, target: 5, weight: 8)
gr.add_edge(source: 5, target: 7, weight: 10)
gr.add_edge(source: 0, target: 6, weight: 21)
gr.add_edge(source: 6, target: 7, weight: 7)
sh = Shortest.new
p sh.find_shortest_path(graph: gr, source: 0, target: 7)
