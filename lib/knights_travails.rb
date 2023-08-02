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

    breadth_first_search(source, final, node_array)
  end

  private

  def breadth_first_search(source, destination, nodes)
    q = Queue.new
    source.visited = true
    q << source
    until q.empty?
      current = q.pop
      current.neighbours.each do |neighbour|
        i = neighbour[0]
        j = neighbour[1]
        node = find_node(i, j, nodes)
        node.visited = true
        q << node
        node.parent = current
        if node.coordinate == destination.coordinate
          q.clear
          break
        end
      end
    end
  end

  def find_node(x, y, nodes)
    nodes.find do |node|
      node.coordinate[0] == x && node.coordinate[1] == y
    end
  end

  def route(source, final)
    path = []
    current = final
    while current != source
      path << current.coordinate
      current = current.parent
    end
    path << source.coordinate
    path.reverse
  end
end
