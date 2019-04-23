class AccountancyPeriod
  attr_reader :start, :stop, :days

  def initialize(start, stop)
    @start, @stop = [start, stop].sort
    @days = AccountancyDuration.diff start, stop
  end

  def split(date)
    if start <= date && date < stop
      [AccountancyPeriod.new(start, date), AccountancyPeriod.new(date + 1.day, stop)]
    else
      [self]
    end
  end
end