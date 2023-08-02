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

    p source
    p final
  end

  private

  def find_node(x, y, nodes)
    nodes.find do |node|
      node.coordinate[0] == x && node.coordinate[1] == y
    end
  end
end
