module Operations
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def cards_value(cards)
      value = [0.01]
      cards.each do |card|
        case card[0]
        when 'J', 'Q', 'K', '1'
          value.map! { |c| c + 10 }
        when 'A'
          value *= 2 #дублируем массив
          value[0] += 1
          value[1] += 11
          if value.size == 4
            value[2] += 11
            value[3] += 1
          elsif value.size >= 5
            value = [13]
          end
        else
          value.map! { |c| c + card[0].to_i }
        end
      end
      min_value = value.min.to_i
    
      max_value = value.select{ |v| v < 22 }.max.to_i
      max_value
    end

    def win
      @balance += 20
    end

    def drawn_game #ничья
      @balance += 10
    end
  end
  
end