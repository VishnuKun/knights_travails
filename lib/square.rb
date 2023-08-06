# frozen_string_literal: true

class Square
  attr_accessor :coordinate, :neighbours, :parent, :visited, :distance

  def initialize(coordinate = nil)
    @coordinate = coordinate
    @neighbours = []
    @parent = nil
    @visited = false
    @distance = Float::INFINITY
  end
end
