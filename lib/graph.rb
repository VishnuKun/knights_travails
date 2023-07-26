# frozen_string_literal: true

require_relative 'node'
require_relative 'chess_board'
class Graph
  attr_accessor :nodes

  def initialize(board)
    @nodes = []
    build_graph(board)
  end

  def add_node(value)
    @nodes << Node.new(value)
  end

  def build_graph(chess_board)
    nested_array = chess_board.board
    row = 0
    while row < 8
      column = 0
      while column < 8
        node = nested_array[row][column]
        add_node(node)
        column += 1
      end
      row += 1
    end
    nodes.each do |node|
      pot_moves = possible_moves(node, nested_array)
      pot_moves.each do |move|
        node.links << move
      end
    end
  end

  private

  def possible_moves(node, nested_array)
    x = node.location[0]
    y = node.location[1]
    moves = [
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x - 2, y + 1],
      [x - 2, y - 1],
      [x + 1, y + 2],
      [x - 1, y + 2],
      [x + 1, y - 2],
      [x - 1, y - 2]
    ]
    valid_moves = moves.select do |x, y|
      x >= 0 && x < nested_array.length && y >= 0 && y < nested_array[0].length
    end
    valid_moves.map do |_new_x, _new_y|
      find_node(x, y)
    end
  end

  def find_node(x, y)
    nodes.find do |node|
      node.location[0] == x && node.location[1] == y
    end
  end
end
