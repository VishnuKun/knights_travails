# frozen_string_literal: true

class Node
  attr_accessor :location, :links, :previous, :visited

  def initialize(location = nil)
    @location = location
    @links = []
    @previous = nil
    @visited = false
  end
end
