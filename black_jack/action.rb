class Action
  require_relative 'operations'
  include Operations

  def initialize
    @player = Player.new
    @deck = Deck.new.deck_of_cards
    @dealer = Dealer.new
  end

  def run
    # abort 'Нулевой баланс, продолжить игру невозможно' if @player.balance <= 0
    2.times do
      card_to_dealer # раздаем игрокам карты
      card_to_player
    end

    @player.show_cards # показываем игроку его карты
    @dealer.show_stars # звездочки вместо карт дилера
    bet # вычитаются по 10 долларов у игрока и диллера
    player_move
  end

  def player_name
    puts 'Введите Ваше имя'
    @player.name = gets.chomp
  end

  def card_to_dealer
    card = @deck.delete_at(0)
    @dealer.cards << card
  end

  def card_to_player
    card = @deck.delete_at(0)
    @player.cards << card
  end

  def show_balance
    puts "Ваш баланс: $#{@player.balance}, баланс дилера: $#{@dealer.balance}"
  end

  def bet
    @player.balance -= 10 # ставки
    @dealer.balance -= 10
  end

  def player_move
    choice = @player.player_choice # выбранный вариант хода
    case choice
    when 1
      dealer_move
    when 2
      if @player.cards.size == 2
        card_to_player
        @player.show_cards
      else
        puts 'Добавить карту возможно, только если на руках 2 карты'
      end
      player_move
    when 3
      result
    end
    both_three_cards?
  end

  def dealer_move
    card_to_dealer if cards_value(@dealer.cards) < 17 && @dealer.cards.size == 2
    @dealer.show_stars
    player_move unless both_three_cards?
  end

  def open_cards
    @player.show_cards

    @dealer.show_cards
  end

  def both_three_cards?
    result if @player.cards.size == 3 && @dealer.cards.size == 3
  end

  def result
    puts '    Игра закончена    '
    open_cards
    case cards_value(@player.cards)
    when 22...30
      if cards_value(@dealer.cards) <= 21
        puts 'Сумма Ваших очков более 21.'
        @dealer.win
      else
        draw
      end
    when 4..21
      if cards_value(@dealer.cards) < cards_value(@player.cards)
        @player.win
      elsif cards_value(@dealer.cards) > cards_value(@player.cards)
        @dealer.win
      else
        draw
      end
    end
    new_game?
  end

  def draw
    puts 'Ничья'
    @dealer.drawn_game
    @player.drawn_game
  end

  def new_game?
    puts "\nСыграть еще раз?
          Да - 1,
          Нет - любая другая клавиша\n"
    choice = gets.to_i
    abort 'Спасибо за игру' if choice != 1
    @deck = Deck.new.deck_of_cards
    @dealer.cards = []
    @player.cards = []
    run
  end
end
