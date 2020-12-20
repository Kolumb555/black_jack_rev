class Deck
  attr_accessor :deck_of_cards

  require_relative 'card'

  def initialize
    @deck_of_cards = []
    values = {
      2 => 2,
      3 => 3,
      4 => 4,
      5 => 5,
      6 => 6,
      7 => 7,
      8 => 8,
      9 => 9,
      10 => 10,
      'J' => 10,
      'Q' => 10,
      'K' => 10,
      'A' => 11
    }

    values.each do |value, points|
      ['+', '<3', '^', '<>'].each do |suit|
        card = Card.new(value, suit, points)
        @deck_of_cards << card # получен array колоды карт
      end
    end

    @deck_of_cards.shuffle!
  end
end
