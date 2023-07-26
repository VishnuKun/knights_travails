# frozen_string_literal: true

class Node
  attr_accessor :location, :links

  def initialize(location = nil)
    @location = location
    @links = []
  end
end
