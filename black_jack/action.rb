class Action
  def initialize
    @player = Player.new
    @deck = Deck.new
    @dealer = Dealer.new
    @interface = Interface.new
  end

  def run
    2.times do
      take_card(@dealer) # раздаем игрокам карты
      take_card(@player)
    end

    show_cards(@player)
    @interface.dealer_show_stars(@dealer.hand.cards.size) # звездочки вместо карт дилера
    bet # вычитаются по 10 долларов у игрока и диллера
    player_move
  end

  def take_card(gamer)
    card = @deck.give_card
    gamer.hand.cards << card
  end

  def player_name
    @interface.player_name
    @player.name = gets.chomp
  end

  def bet
    @player.balance -= 10 # ставки
    @dealer.balance -= 10
  end

  def show_cards(gamer)
    @interface.show_cards(gamer)
  end

  def player_move
    choice = @interface.player_choice # выбранный вариант хода
    case choice
    when 1
      dealer_move
    when 2
      if @player.hand.cards.size == 2
        take_card(@player)
        show_cards(@player)
      else
        @interface.no_more_cards
      end
    when 3
      result
    end
    player_move unless both_three_cards?
  end

  def dealer_move
    take_card(@dealer) if @dealer.hand.total_value < 17 && @dealer.hand.cards.size == 2
    @interface.dealer_show_stars(@dealer.hand.cards.size)
    player_move unless both_three_cards?
  end

  def open_cards
    show_cards(@player)

    show_cards(@dealer)
  end

  def both_three_cards?
    result if @player.hand.cards.size == 3 && @dealer.hand.cards.size == 3
  end

  def result
    @interface.game_over
    open_cards

    winner

    new_game?
  end

  def winner
    case @player.hand.total_value
    when 22...30
      if @dealer.hand.total_value <= 21
        @interface.dealer_win
        @dealer.win
      else
        draw
      end
    when 4..21
      if @dealer.hand.total_value < @player.hand.total_value
        @interface.player_win
        @player.win
      elsif @dealer.hand.total_value > @player.hand.total_value
        @interface.dealer_win
        @dealer.win
      else
        draw
      end
    end
  end

  def draw
    @interface.draw
    @dealer.draw
    @player.draw
  end

  def new_game?
    @interface.new_game?
    choice = gets.to_i
    abort @interface.game_end if choice != 1
    @deck = Deck.new
    @dealer.hand = Hand.new
    @player.hand = Hand.new
    run
  end
end
