# frozen_string_literal: true

require_relative 'square'
require_relative 'chess_board'
class Graph
  attr_accessor :nodes

  def initialize(board)
    @nodes = []
    build_graph(board)
  end

  def add_square(value)
    @nodes << Square.new(value)
  end

  def add_edges(node1, node2)
    node1.neighbours << node2.coordinate unless node1.neighbours.include?(node2)
    node2.neighbours << node1.coordinate unless node2.neighbours.include?(node1)
    node1.neighbours.uniq!
    node2.neighbours.uniq!
  end

  def build_graph(chess_board)
    nested_array = chess_board.board
    row = 0
    while row < 8
      column = 0
      while column < 8
        square = nested_array[row][column]
        add_square(square)
        column += 1
      end
      row += 1
    end
    nodes.each do |node1|
      possible_moves(node1).each { |node2| add_edges(node1, node2) }
    end
  end

  private

  def possible_moves(square)
    x = square.coordinate[0]
    y = square.coordinate[1]
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
    valid_moves = moves.select do |move|
      co_ord_x = move[0]
      co_ord_y = move[1]
      co_ord_x.between?(0, 7) && co_ord_y.between?(0, 7) && [co_ord_x, co_ord_y] != square.coordinate
    end

    valid_moves.map { |co_ord_x, co_ord_y| find_square(co_ord_x, co_ord_y) }
  end

  def find_square(x, y)
    nodes.find { |square| square.coordinate[0] == x && square.coordinate[1] == y }
  end
end
