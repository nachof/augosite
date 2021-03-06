module Calendar
  class Event
    attr_accessor :title, :description, :link, :date, :end_date, :location

    def initialize(title, description, link, location, date, end_date = nil)
      @title = title || ""
      @description = description || ""
      @location = location
      @link = link
      @date = date
      @end_date = end_date || date
    end

    def self.list
      @list ||= load_list
    end

    def self.future
      list.select { |e| e.date > Date.today() }
    end

    def self.current
      list.select { |e| e.date < Date.today() && e.end_date > Date.today() }
    end

    def self.from_raw(data)
      self.new data['title'], data['description'], data['link'], data['location'], data['date'], data['until']
    end

    private
      def self.load_list
        data = YAML.load File.open(File.join(AUGO::data_path, 'calendario.yaml'))
        data.map { |d| Event.from_raw(d) }.sort { |a,b| a.date <=> b.date }
      end
  end

  module_function

  def future_events
    Event.future
  end

  def current_events
    Event.current
  end

end
