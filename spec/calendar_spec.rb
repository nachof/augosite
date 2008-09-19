require 'lib/calendar'

describe Calendar do

  # This is in ActiveSupport, but I don't want to include all that just for this
  class Fixnum
    def days; day; end
    def day
      24*60*60*self
    end
    def ago
      Time.now - self
    end
    def from_now
      Time.now + self
    end
  end

  before do
    @event1 = Calendar::Event.new "first", "", "", "", 20.days.ago
    @event2 = Calendar::Event.new "first", "", "", "", 15.days.ago
    @event3 = Calendar::Event.new "first", "", "", "", 1.days.ago
    @event4 = Calendar::Event.new "first", "", "", "", 2.days.from_now
    @event5 = Calendar::Event.new "first", "", "", "", 5.days.from_now
    @all_events = [@event1, @event2, @event3, @event4, @event5]
    Calendar::Event.stub!(:list).and_return(@all_events)
  end

  describe 'list of past events' do
    it "should return a list of past events"
  end
  describe 'list of future events' do
    it "should return a list of future events" do
      Calendar.future_events.should == [@event4, @event5]
    end

    it "should not include events already started but not ended"
  end
end
