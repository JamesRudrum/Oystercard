require "oystercard"

describe Oystercard do
  it { is_expected.to respond_to(:balance)}

  it "checks that when initialized balance is 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    let(:oc) { Oystercard.new }

    it "adds to balance" do
      oc.top_up(20)
      expect(oc.balance).to eq 20
    end

  end
end
