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
  describe '#top_up' do
    it "should add £1 to balance in Oystercard" do
        oystercard = Oystercard.new
        oystercard.top_up(1)
        expect(oystercard.balance).to eq(1)
    end
    it "should add £2 to balance in Oystercard" do
        oystercard = Oystercard.new
        oystercard.top_up(2)
        expect(oystercard.balance).to eq(2)
    end
  end
end