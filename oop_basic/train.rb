class Train

  attr_reader :speed, :route, :number

  def initialize(number)
    @number = number
    @speed = 0
    @station_number = 0
    @cars = []
  end

  def accelerate(speed)
    @speed = speed
  end

  def brake
    @speed = 0
  end

  def detach_car(car)
    @cars.delete(car) if @speed==0
  end

  def get_route(route)
    @route = route
    @station_number = 0
  end

  def move_forward
    @station_number += 1 if @station_number < (@route.route_stations.length - 1)
  end
  
  def move_back
    @station_number -= 1 if @station_number >= 1
  end

  def previous_station
    @route.route_stations[@station_number - 1] if @station_number >= 1
  end

  def current_station
    @route.route_stations[@station_number]
  end

  def next_station
    @route.route_stations[@station_number + 1] if @station_number < @route.route_stations.size
  end
end

class PassengerTrain < Train

  def attach_car(car)
    @cars << car if (@speed == 0 && car.class == PassengerCar)
  end
end

class CargoTrain < Train

  def attach_car(car)
    @cars << car if (@speed == 0 && car.class == CargoCar)
  end
end

class PassengerCar
end

class CargoCar
end
