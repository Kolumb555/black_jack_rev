class Player
  require_relative 'operations'
  include Operations

  attr_accessor :name, :balance, :cards

  def initialize
    @balance = 100
    @cards = []
    @name = ''
  end

  def show_cards
    puts "Ваши карты: #{@cards[0]} #{@cards[1]} #{@cards[2]}"
    puts "Сумма очков: #{cards_value(@cards)}"
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

  def win
    puts 'Победа!'
    @balance += 20
  end
end
