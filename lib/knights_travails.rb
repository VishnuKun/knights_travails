# frozen_string_literal: true

require_relative 'graph'
require_relative 'chess_board'
class Knight
  def initialize; end

  def knight_moves(source, final)
    board = ChessBoard.new
    graph = Graph.new(board)
    node_array = graph.nodes

    x = source[0]
    y = source[1]
    fin_x = final[0]
    fin_y = final[1]
    source = find_node(x, y, node_array)
    final =  find_node(fin_x, fin_y, node_array)

    # initialize queue
    q = Queue.new
    # visit node and add source node to queue
    source.visited = true 
    q << source
    # BFS until queue.empty?
    while !q.empty?
      # pop node from queue for search
      current = q.pop
      # loop through neighbours nodes to find final node
      current.neighbours.each do |neighbour|
        i = neighbour[0]
        j = neighbour[1]
        node = find_node(i, j, node_array)
        # visit and add neighbours to queue
        node.visited = true
        q << node
        # update its preceding node
        node.parent = current
        # break if node == final node
        if node.coordinate == final.coordinate
          q.clear
          break
        end
      end
    end
    # BFS completed, now trace route
    # using parents of nodes
    # start node.parent == null so 
    # loop until node->prev is null
    # reverse route bring start to front
    # output route
  end

  private

  def find_node(x, y, nodes)
    nodes.find do |node|
      node.coordinate[0] == x && node.coordinate[1] == y
    end
  end
end
