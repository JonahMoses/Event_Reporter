require 'minitest'
require 'minitest/autorun'
require './lib/commands'

class CommandsTest < MiniTest::Test

  def test_queue_works
    output = ProcessCommands.new.execute_command("queue")
    assert_equal output, "The available queue commands are: 
        'queue count', 'queue clear', 'queue print', 
        'queue print by <filename>', 'queue save to <filename'>. " 
  end

  def test_load_command_output
    output = ProcessCommands.new.execute_command("load")
    assert_equal output, "Sorry, need to designate which file you would like to load. 'load <filename>'."
  end

  def test_load_file_command_output
    filename = 'event_attendees.csv'
    output = ProcessCommands.new.execute_command("load #{filename}")
    assert_equal "#{filename} loaded", output
  end

  # def test_load_file_command_works_again
  #   filename = "dog_attendees.csv"
  #   output = ProcessCommands.new.execute_command("load #{filename}")
  #   assert_equal "#{filename} loaded", output
  # end

  def test_queue_count_command_works
    output = ProcessCommands.new.execute_command("queue count")
    assert_equal 0, output
  end




end
