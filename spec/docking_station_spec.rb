require 'docking_station'

describe DockingStation do  
  
  it "#new works" do
    expect(DockingStation).to respond_to(:new).with(1).argument 
  end

  it { is_expected.to respond_to :release_bike}
  
  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'releases working bikes, when there are also broken ones' do
    bike1 = Bike.new
    subject.dock bike1
    bike2 = Bike.new
    bike2.report_broken
    subject.dock bike2
    bike_released = subject.release_bike
    expect(bike_released).to be_working
  end

  
  it 'holds broken bikes' do
    bike = Bike.new
    bike.report_broken
    subject.dock bike       
    expect{subject.release_bike}.to raise_error("No working bikes available")    
  end

  it { is_expected.to respond_to(:dock).with(1).argument } 

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it "raise error if dock station is empty" do
      expect{subject.release_bike}.to raise_error("No bikes available")
    end
  end

  describe "#dock" do
    it "raises an error when full" do
      subject.capacity.times {subject.dock Bike.new}
      expect{subject.dock(Bike.new)}.to raise_error("Docking station full")
    end
  end

end 
