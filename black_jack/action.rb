class Action

  def initialize
    @player = Player.new
    @deck = Deck.new
    @dealer = Dealer.new
  end

  def run
    #puts "Введите Ваше имя"
    #@player.name = gets.chomp

    2.times do
      #@deck.card_to_dealer
      card = @deck.deck_of_cards.delete_at(0)
      @dealer.cards << card
      card = @deck.deck_of_cards.delete_at(0)
      @player.cards << card
      #@deck.card_to_player
    end




  end
end