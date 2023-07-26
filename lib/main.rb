# frozen_string_literal: true

require_relative 'knights_travails'
require_relative 'chess_board'
require_relative 'graph'
puts 'Knights(♞ ) Traivails Initialized'
# testing
k = Knight.new
b = ChessBoard.new
p k.knight_moves([3, 3], [4, 3])

g = Graph.new(b)
p g