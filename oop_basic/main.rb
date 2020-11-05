require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'

stations = []
trains = []
routes = []

routes << Route.new(111, 222)
routes << Route.new(444, 666)

trains << Train.new(11)
trains << Train.new(22)
trains << Train.new(33)


loop do
  puts "Для выбора необходимого действия введите, пожалуйста, соответствующую цифру:

  1 - Создавать станции
  2 - Создавать поезда
  3 - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
  4 - Назначать маршрут поезду
  5 - Добавлять вагоны к поезду
  6 - Отцеплять вагоны от поезда
  7 - Перемещать поезд по маршруту вперед и назад
  8 - Просматривать список станций и список поездов на станции
  0 - Выход из программы"

  choice = gets.to_i

  case choice
  when 1 #Создавать станции
    puts "Введите название станции"
    name = gets.chomp
    stations << Station.new(name)

  when 2 #Создавать поезда
    puts "Введите номер поезда"
    number = gets.chomp

    loop do
      puts "Выберите тип поезда: 1 - пассажирский, 2 - грузовой"
      type = gets.to_i
      if type == 1
        trains << PassengerTrain.new(number)
        break
      elsif type == 2
        trains << PassengerTrain.new(number)
        break
      else
        puts "Для выбора типа поезда необходимо ввести цифру: 1 - пассажирский, 2 - грузовой"
      end
    end

  when 3 #Создавать маршруты и управлять станциями в нем (добавлять, удалять)
    puts "Введите название начальной станции маршрута"
    start_station = gets.chomp
    puts "Введите название конечной станции маршрута"
    end_station = gets.chomp
    routes << Route.new(start_station, end_station)

    loop do

      puts "Хотите внести изменения в маршрут?
      1 - да, добавить станцию"
      if routes[-1].route_stations.size >= 1
        puts "      2 - да, удалить станцию"
      end
      puts "      нет - любое другое значение"
      choice = gets.to_i

      if choice == 1
        puts "Введите название промежуточной станции маршрута"
        station = gets.chomp
        unless routes[-1].route_stations.include?(station)
          routes[-1].add_intermediate_station(station)
        else
          puts "Такая станция уже есть в данном маршруте"
        end

      elsif choice == 2
        if routes[-1].route_stations.size >= 1
          puts "Введите название станции маршрута, которую необходимо удалить:"
          routes[-1].route_stations.each { |s| puts s }
          station = gets.chomp

          if routes[-1].route_stations.include?(station)
            puts "Станция #{station} удалена"
            routes[-1].exclude_intermediate_station(station)
          else
            puts "Такая станция отсутствует в маршруте"
          end
        else
          break
        end

      else
        break
      end
    end

  when 4 #Назначать маршрут поезду
    if routes.size == 0
      puts "Отсутствует информация о доступных марштутах \n\n"
    elsif trains.size == 0
      puts "Отсутствует информация о доступных поездах \n\n"
    else
      puts "Выберите порядковый номер маршрута"
      routes.each_with_index do |route, i|
        puts "#{i + 1}. #{route.route_stations[0]} - #{route.route_stations[-1]}" 
      end
      route_num = gets.to_i
      puts "Выберите порядковый номер поезда"
      trains.each_with_index do |train, i|
        puts "#{i + 1}. #{train.number}" 
      end
      train_num = gets.to_i

      if (0..routes.size).include?(route_num) && (0..trains.size).include?(train_num) #проверка выбора поезда и маршрута
        trains[train_num - 1].get_route(routes[route_num - 1])
        puts "Поезду #{trains[train_num - 1].number} назначен маршрут #{routes[route_num - 1].route_stations}"
      else
        puts "Необходимо указать порядковый номер поезда и маршрута из списка"
      end

  when 5

    end

  when 0
    break
  end

end
