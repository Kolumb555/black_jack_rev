class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total_value
    total_value = @cards.map(&:points).reduce(:+)

    if total_value > 21
      @cards.count { |card| card.points == 11 }.times do
        total_value -= 10 if total_value > 21
      end
    end
    total_value
  end
end
