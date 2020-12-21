class Deck
  attr_accessor :deck_of_cards

  require_relative 'card'

  VALUES = (2..10).to_a + %w[J Q K A]
  SUITS = ['+', '<3', '^', '<>'].freeze

  def initialize
    @deck_of_cards = []

    VALUES.each do |value|
      SUITS.each do |suit|
        card = Card.new(value, suit)
        @deck_of_cards << card # получен array колоды карт
      end
    end

    @deck_of_cards.shuffle!
  end

  def give_card
    @deck_of_cards.delete_at(0)
  end
end
