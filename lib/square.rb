# frozen_string_literal: true

class Square
  attr_accessor :coordinate, :neighbours, :parent

  def initialize(coordinate = nil)
    @coordinate = coordinate
    @neighbours = []
    @parent = nil
  end
end
