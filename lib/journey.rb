class Journey

  attr_reader :journeys

  MIN_FARE = 1
  PEN_FARE = 6

  def initialize
    @journeys = []
  end

  def log_entry(entry_station)
    @journeys << journey_log(entry_station, nil)
  end

  def log_exit(exit_station)
    if @journeys.empty?
      @journeys << journey_log(nil, exit_station)
    elsif @journeys.last[:exit_station] == nil
      @journeys.last[:exit_station] = exit_station
    else
      @journeys << journey_log(nil, exit_station)
    end
  end

  def journey_log(entry_station, exit_station)
    {
      entry_station: entry_station,
      exit_station: exit_station
    }
  end

  def fare
    if @journeys.last[:entry_station] == nil
      PEN_FARE
    else
      MIN_FARE
    end
  end

end
