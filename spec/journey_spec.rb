require "journey"

RSpec.describe Journey do
  let(:journey) { Journey.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  it "logs entry" do
    journey.log_entry(exit_station)
    expect(@journeys).not_to eq []
  end

  describe "#journey_log" do

    it "has no journeys by default" do
      expect(journey.journeys).to be_empty
    end

    it "stores the entry station" do
      journey.log_entry(entry_station)
      journey.log_exit(exit_station)
      expect(journey.journeys.last[:entry_station]).to eq(entry_station)
    end

    it "stores entry and exit as one journey" do
      journey.log_entry(entry_station)
      journey.log_exit(exit_station)
      expect(journey.journeys.last).to include(:entry_station, :exit_station)
    end
  end

  describe "#log_exit" do
    it "stores the exit station" do
      journey.log_entry(entry_station)
      journey.log_exit(exit_station)
      expect(journey.journeys.last[:exit_station]).to eq exit_station
    end
  end
end
