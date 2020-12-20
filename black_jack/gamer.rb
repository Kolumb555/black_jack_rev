class Gamer
  attr_accessor :name, :balance, :hand

  def initialize
    @balance = 100
    @hand = Hand.new
    @name = ''
  end

  def win
    @balance += 20
  end

  def draw
    @balance += 10
  end
end
