require "oystercard"

describe Oystercard do
  let(:oc) { Oystercard.new }
  let(:station1) { double :entry_station } # touch_in(station)
  let(:station2) { double :exit_station } # touch_out(station)
  # it { is_expected.to respond_to(:balance) }

  it "checks that when initialized balance is 0" do
    expect(oc.balance).to eq 0
  end

  describe "#touch_out" do

    it "deducts fare from balance when user touches out" do
      oc.top_up(5)
      oc.touch_in(station1)
      expect { oc.touch_out(station2) }.to change { oc.balance }.by(-Journey::MIN_FARE)
    end
  end

  describe "#touch_in" do



    it "raises an error if balance is below minimum fare" do
      oc.top_up(5)
      expect(subject.touch_in).to raise_error "not enough money on card" if oc.balance < Journey::MIN_FARE
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

end
