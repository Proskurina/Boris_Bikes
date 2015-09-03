require 'bike'

describe Bike do
  
  it "#new works" do
    expect(Bike).to respond_to :new
  end

  it { is_expected.to respond_to :working?}
  it { is_expected.to respond_to :broken?}

  it 'can be reported broken' do
  	subject.report_broken
  	expect(subject).to be_broken
  end

  it "if reported broken then it is not workig" do
  	subject.report_broken
  	expect(subject).not_to be_working
  end

end 