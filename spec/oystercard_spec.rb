require "oystercard"

describe Oystercard do
  let(:oc) { Oystercard.new }
  #it { is_expected.to respond_to(:balance)}

  it "checks that when initialized balance is 0" do
    expect(oc.balance).to eq 0
  end

  describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds to balance" do
      expect{oc.top_up(20)}.to change{oc.balance}.by(20)
    end

  end
end
