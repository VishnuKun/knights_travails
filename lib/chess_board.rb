# frozen_string_literal: true

class ChessBoard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
    8.times do |row|
      8.times do |column|
        board[row][column] = [row, column]
      end
    end
  end
end
