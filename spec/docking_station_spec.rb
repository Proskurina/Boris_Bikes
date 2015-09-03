require 'docking_station'

describe DockingStation do
  # it "docking station instances will respond to release_bike method" do
  #   instance = DockingStation.new
    # expect(instance).to respond_to :release_bike
  # end
  it { is_expected.to respond_to(:dock).with(1).argument }

  it "raise error if dock station is empty" do
    expect{subject.release_bike}.to raise_error("No bikes available")
  end

  it { is_expected.to respond_to :release_bike}
    # is_expected is defined as expect(subject)

  # it "release_bike method returns a bike object" do
  #   dock = DockingStation.new
  #   expect(dock.release_bike).to be_a Bike
  #   expect(dock.release_bike.working?).to eq true
  # end
  
  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe "#dock" do
    it "raises an error when full" do
      20.times {subject.dock Bike.new}
      expect{subject.dock(Bike.new)}.to raise_error("Docking station full")
    end
  end

end 
