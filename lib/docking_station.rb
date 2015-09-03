require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity 

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes available' if not any_working?
    first_working
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def first_working
    place =bikes.index{|bike| bike.working? == true}
    bikes[place]
  end

  def any_working?
    @bikes.any? {|bike| bike.working? == true}
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end 

