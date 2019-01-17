require "station"

RSpec.describe Station do

  subject(:station) { described_class.new("Old Street", 1) }

  it "knows its name" do
    expect(subject.name).to eq("Old Street")
  end

  it "knows what zone it is in" do
    expect(subject.zone).to eq(1)
  end

end
