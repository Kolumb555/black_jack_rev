class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total_value
    total_value = 0
    @cards.each do |card|
      case card.value
      when 'J', 'Q', 'K'
        total_value += 10
      when 'A'
        total_value += 11
      else
        total_value += card.value
      end
    end

    if total_value > 21
      @cards.count { |card| card.value == 'A' }.times do
        total_value -= 10 if total_value > 21
      end
    end

    total_value
  end
end
