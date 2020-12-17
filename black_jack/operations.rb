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
          value *= 2 # дублируем массив
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
      max_value = value.select { |v| v < 22 }.max.to_i
      max_value = value[0].to_i if max_value.zero?
      max_value
    end

    def drawn_game
      @balance += 10 # ничья
    end
  end
end
