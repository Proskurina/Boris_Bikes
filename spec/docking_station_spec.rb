require 'docking_station'

describe Docking_Station do
  # it "docking station instances will respond to release_bike method" do
  #   instance = Docking_Station.new
    # expect(instance).to respond_to :release_bike
  # end
  it { is_expected.to respond_to(:dock).with(1).argument }

  it "raise error if dock station is empty" do
    expect{subject.release_bike}.to raise_error("No bikes available")
  end

  it { is_expected.to respond_to :release_bike}
    # is_expected is defined as expect(subject)

  # it "release_bike method returns a bike object" do
  #   dock = Docking_Station.new
  #   expect(dock.release_bike).to be_a Bike
  #   expect(dock.release_bike.working?).to eq true
  # end
  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end


end
