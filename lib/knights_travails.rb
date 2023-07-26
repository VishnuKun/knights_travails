# frozen_string_literal: true
require_relative 'graph'
class Knight
  def initialize; end

  def knight_moves(initial, final)
    # initialize board && board
    board = ChessBoard.new
    graph = Graph.new(board)
    
    # mark all nodes as univisited
      # create two lists - visited[] and unvisited[]
    # assign to all nodes a tentative distance value
      # make initial nodes distance = 0
      # and every other relatively
      # last will be empty
    # for the current node calculate distance to all unvisited neighbours
      # update shortest distance if new distance is shorter than old distance 
    # mark current node as visited
    # choose new current node from visited with minimal distance 
  end
end
