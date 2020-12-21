class Interface
  def show_cards(gamer)
    if gamer.instance_of?(Dealer)
      puts 'Карты дилера, сумма очков:'
    else
      puts 'Ваши карты, сумма очков:'
    end

    gamer.hand.cards.each { |card| puts card.value.to_s + card.suit }
    puts gamer.hand.total_value.to_s
  end

  def dealer_show_stars(cards_qty)
    if cards_qty == 2
      puts 'Карты дилера: **'
    else
      puts 'Карты дилера: ***'
    end
  end

  def player_name
    puts 'Введите Ваше имя'
  end

  def player_choice
    choice = 0
    while choice != 1 && choice != 2 && choice != 3
      puts "Для выбора хода необходимо выбрать соответствующую цифру:
              1. Пропустить
              2. Добавить карту
              3. Открыть карты\n"
      choice = gets.to_i
    end
    choice
  end

  def no_more_cards
    puts 'Добавить карту возможно, только если на руках 2 карты'
  end

  def draw
    puts 'Ничья'
  end

  def dealer_win
    puts 'Победа дилера.'
  end

  def player_win
    puts 'Победа!'
  end

  def new_game?
    puts "\nСыграть еще раз?
          Да - 1,
          Нет - любая другая клавиша\n"
  end

  def game_over
    puts '    Игра закончена    '
  end

  def game_end
    'Спасибо за игру'
  end
end
