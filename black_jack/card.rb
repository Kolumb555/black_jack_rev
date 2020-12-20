class Card
  attr_reader :show, :points

  def initialize(value, suit, points)
    @show = value.to_s + suit
    @points = points
  end
end
