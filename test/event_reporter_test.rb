require 'minitest'
require 'minitest/autorun'
require './lib/event_reporter'

class EventReporterTest < MiniTest::Test

  def test_if_event_reporter_exists
    er = EventReporter.new
    assert_kind_of EventReporter, er
  end
end


