class Deck #колода карт

  attr_accessor :deck_of_cards

  require_relative 'dealer.rb'
  require_relative 'player.rb'
  
  def initialize

    @deck_of_cards = []
    values = (2..10).to_a + ['J', 'Q', 'K', 'A']
    
    values.each do |v|
      ['+', '<3', '^', '<>'].each do |i|
        @deck_of_cards << "#{v}#{i}" # получен array колоды карт
      end
    end

    @deck_of_cards.shuffle!
  end

  def card_to_dealer
    card = @deck_of_cards.delete_at(0)
    @dealer.cards << card
  end

  def card_to_player
    card = @deck_of_cards.delete_at(0)
    @player.cards << card
  end

end
