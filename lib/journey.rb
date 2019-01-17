class Journey

  attr_reader :journeys

  def initialize
    @journeys = []
  end

  def log_entry(entry_station)
    @journeys << journey_log(entry_station, nil)
  end

  def log_exit(exit_station)
    @journeys.last[:exit_station] = exit_station
  end

  def journey_log(entry_station, exit_station)
    {
      entry_station: entry_station,
      exit_station: exit_station
    }
  end

end
