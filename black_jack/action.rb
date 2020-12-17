class Action

  require_relative 'operations'
  include Operations

  def initialize
    @player = Player.new
    @deck = Deck.new.deck_of_cards
    @dealer = Dealer.new
  end

  # def player_name
  #   puts "Введите Ваше имя"
  #   @player.name = gets.chomp
  # end

  def run
    2.times do 
      card_to_dealer #раздаем игрокам карты
      card_to_player
    end

    @player.show_cards #показываем игроку его карты
    @dealer.show_stars #звездочки вместо карт дилера
    bet #вычитаются по 10 долларов у игрока и диллера
    player_move


 

    new_game?
  end



  def card_to_dealer
    card = @deck.delete_at(0)
    @dealer.cards << card
  end

  def card_to_player
    card = @deck.delete_at(0)
    @player.cards << card
  end


  def bet #ставки
    @player.balance -= 10
    @dealer.balance -= 10
  end

  def player_move
    choice = @player.player_choice #выбранный вариант хода
    case choice
    when 1
      @dealer.move #to do
    when 2 
      if @player.cards.size != 2
        puts "Добавить карту возможно, только если на руках 2 карты"
        player_move
      else
        card_to_player
      end
    when 3
      result
    end
  end

  def open_cards
    @player.show_cards
    @dealer.show_cards
  end

  def result
    open_cards
    case cards_value(@player.cards)
    when 22...30
      if cards_value(@dealer.cards) <= 21
      puts "Сумма очков более 21, проигрыш."
      @dealer.win
      else
        draw
      end
    when 4..21
      if cards_value(@dealer.cards) < cards_value(@player.cards)
        @player.win
      elsif cards_value(@dealer.cards) > cards_value(@player.cards)
        puts "Победа дилера"
        @dealer.win
      else
        draw
      end
    end
  end

  def draw
    puts "Ничья"
    @dealer.drawn_game
    @player.drawn_game
  end


  def new_game?
    puts "\nСыграть еще раз?
          Да - 1,
          Нет - любая другая клавиша"
    choice = gets.to_i
    abort 'Спасибо за игру' if choice != 1
      @deck = Deck.new.deck_of_cards
      run
  end
          
  




end

