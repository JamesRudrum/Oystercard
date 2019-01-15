require "oystercard"

describe Oystercard do
  let(:oc) { Oystercard.new }
  # it { is_expected.to respond_to(:balance) }

  it "checks that when initialized balance is 0" do
    expect(oc.balance).to eq 0
  end

  describe "#touch_in" do

    it "changes oystercard to be in journey" do
      oc.touch_in
      expect(oc.in_journey?).to eq true
    end

  end


  describe "#deduct" do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "deducts fare from balance" do
      oc.instance_variable_set(:@balance, 5)
      expect { oc.deduct(2) }.to change { oc.balance }.by(-2)
    end

  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds to balance" do
      expect { oc.top_up(20) }.to change { oc.balance }.by(20)
    end

    it "enforces a maximum balance" do
      oc.instance_variable_set(:@balance, 1)
      expect { oc.top_up(Oystercard::MAX_BALANCE) }.to raise_error "Exceeding balance limit #{Oystercard::MAX_BALANCE}"
    end
  end

  describe "#in_journey?" do

    it "checks if card is in use" do
      expect(oc.in_journey?).to be false
    end

  end

end
