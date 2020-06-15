require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it "should create an instance of Oystercard" do
      expect(Oystercard.new).to be_an_instance_of(Oystercard)
    end
    it "should create a balance of 0 set-up" do
      expect(Oystercard.new.balance).to eq(0)
    end
  end
end