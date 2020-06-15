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
    it "should not top up more than £90" do
      oystercard = Oystercard.new
      expect { oystercard.top_up(100) }.to raise_error("Cannot top up over £90")
    end
    it "should not top up if balance will go above £90" do
      oystercard = Oystercard.new
      oystercard.top_up(50)
      expect { oystercard.top_up(50) }.to raise_error("Cannot top up over £90")
    end
  end
  describe '#deduct' do
    it 'should deduct money from an oystercard balance' do
      oystercard = Oystercard.new
      oystercard.top_up(2)
      oystercard.deduct(1)
      expect(oystercard.balance).to eq(1)
    end
    it 'should deduct money from an oystercard balance' do
      oystercard = Oystercard.new
      oystercard.top_up(3)
      oystercard.deduct(2)
      expect(oystercard.balance).to eq(1)
    end
  end
  describe '#touch_in' do
    it 'should touch in a card when we get to barriers' do
      oystercard = Oystercard.new
      expect(oystercard.touch_in).to eq(true)
      #expect(oystercard.in_journey?).to eq(true)
    end
  end
  describe '#touch_out' do
    it 'should touch out a card when out of barriers' do
      oystercard = Oystercard.new
      expect(oystercard.touch_out).to eq(false)
    end
  end
  describe '#in_journey' do
    it 'after touching in should be in journey' do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq(true)
    end
    it 'after touching in and touching out should not be in journey' do
      oystercard = Oystercard.new
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq(false)
    end
  end
end