require 'yaml'

class Calendar
  def initialize(year, month)
    @year = year.to_i
    @month = month.to_i
    @calendar_data = YAML::load(open('data/calendario.yaml'))
  end

  def last_day
    d = Date.new(@year, @month, -1)
    d.mday
  end

  def day_info(mday)
    DayInfo.new(@calendar_data, @year, @month, mday)
  end

  def days(&block)
    (1..last_day).map { |d| day_info(d) }.each &block
  end

  def month
    @month
  end

  def year
    @year
  end

  def first_day
    day_info(1)
  end
end

class DayInfo
  def initialize(calendar_data, year, month, mday)
    @calendar_data = calendar_data
    @year = year
    @month = month
    @mday = mday
  end

  def day
    @mday
  end

  def date
    Date.new @year, @month, @mday
  end

  def activities
    @calendar_data.select do |i|
      DateSpecification.new(i['date']).matches?(self.date)
    end
  end
end

class DateSpecification
  def initialize(datespec)
    @datespec = datespec
  end

  def matches?(date)
    return (date == @datespec) if @datespec.is_a? Date
    return StringDateSpec.new(@datespec).matches?(date) if @datespec.is_a? String
    return false
  end
end

class StringDateSpec
  def initialize(datespec)
    if datespec.include? ','
      parts = datespec.split ",", 2
      @spec = OrDateSpec.new(StringDateSpec.new(parts[0]), StringDateSpec.new(parts[1]))
    elsif datespec.include? '..'
      parts = datespec.split ".."
      @spec = RangeDateSpec.new(date_from_string(parts[0]), date_from_string(parts[1]))
    else
      @spec = DateSpecification.new(date_from_string(datespec))
    end
  end

  def date_from_string(string)
    parts = string.split('-').map &:to_i
    Date.new(parts[0], parts[1], parts[2])
  end

  def matches?(date)
    @spec.matches? date
  end
end

class OrDateSpec
  def initialize(spec1, spec2)
    @s1 = spec1
    @s2 = spec2
  end

  def matches?(date)
    @s1.matches?(date) || @s2.matches?(date)
  end
end

class RangeDateSpec
  def initialize(start_date, end_date)
    @s = start_date
    @e = end_date
  end

  def matches?(date)
    date > @s && date < @e
  end
end
