class Dealer

  attr_accessor :balance, :cards

  require_relative 'operations'
  include Operations

  def initialize
    @balance = 100
    @cards = []
  end

  def show_cards
    puts "Карты дилера: #{@cards[0]} #{@cards[1]} #{@cards[2]}"
    puts "Сумма очков: #{cards_value(@cards)}"
  end

  def show_stars
    if @cards.size == 2
      puts "Карты дилера: **"
    else
      puts "Карты дилера: ***"
    end
  end




end