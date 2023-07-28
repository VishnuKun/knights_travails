# frozen_string_literal: true

require_relative 'graph'
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
    source_node = find_node(x, y, node_array)
    final_node = find_node(fin_x, fin_y, node_array)
    p node_array
  end

  private

  def find_node(x, y, nodes)
    nodes.find do |node|
      node.location[0] == x && node.location[1] == y
    end
  end
end
