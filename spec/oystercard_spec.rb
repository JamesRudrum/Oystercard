require "oystercard"

describe Oystercard do
  let(:oc) { Oystercard.new }
  let(:station1) { double :station } # touch_in(station)
  let(:station2) { double :station } # touch_out(station)
  # it { is_expected.to respond_to(:balance) }

  it "checks that when initialized balance is 0" do
    expect(oc.balance).to eq 0
  end

  it "journeys initializes with an empty hash" do
    expect(oc.journeys).to eq({})
  end

  describe "#touch_out" do

    it "adds one journey to hash when you have touched in, then touched out" do
      oc.top_up(5)
      oc.touch_in(station1)
      oc.touch_out(station2)
      expect(oc.journeys).to eq({ station1 => station2 })
    end

    it "changes oystercard to not be in journey" do
      oc.top_up(5)
      oc.touch_in(station1)
      oc.touch_out(station2)
      expect(oc.in_journey?).to be false
    end

    it "deducts fare from balance when user touches out" do
      oc.top_up(5)
      oc.touch_in(station1)
      expect { oc.touch_out(station2) }.to change { oc.balance }.by(-Oystercard::MIN_FARE)
    end

    it "records station that journey ends at" do
      oc.top_up(5)
      oc.touch_in(station1)
      oc.touch_out(station2)
      expect(oc.exit_station).to eq station2
    end

  end

  describe "#touch_in" do

    it "records station that journey begins at" do
      oc.top_up(5)
      oc.touch_in(station1)
      expect(oc.entry_station).to eq station1
    end

    it "raises an error if balance is below minimum fare" do
      oc.top_up(5)
      expect(subject.touch_in).to raise_error "not enough money on card" if oc.balance < Oystercard::MIN_FARE
    end

    it "changes oystercard to be in journey" do
      oc.top_up(5)
      oc.touch_in(station1)
      expect(oc.in_journey?).to be true
    end
  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds to balance" do
      expect { oc.top_up(20) }.to change { oc.balance }.by(20)
    end

    it "enforces a maximum balance" do
      oc.instance_variable_set(:@balance, 1)
      expect { oc.top_up(Oystercard::MAX_BALANCE) }.to raise_error "Max balance limit #{Oystercard::MAX_BALANCE}"
    end
  end

  describe "#in_journey?" do

    it "checks if card is in use" do
      expect(oc.in_journey?).to be false
    end

  end

end
