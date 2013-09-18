require 'minitest'
require 'minitest/autorun'
require './lib/commands'

class CommandsTest < MiniTest::Test

  def test_queue_works
    output = ProcessCommands.new.execute_command("queue")
    assert_equal output, "The available queue commands are: 
      'queue count', 'queue clear', 'queue print', 
      'queue print by <filename>', 'queue save to <filename'. " 
  end

  def test_load_command_output
    output = ProcessCommands.new.execute_command("load")
    assert_equal output, "Sorry, need a file after load command"
  end

  def test_load_file_command_output
    filename = 'event_attendees.csv'
    output = ProcessCommands.new.execute_command("load #{filename}")
    assert_equal "#{filename} loaded", output
  end

  def test_load_file_command_works_again
    filename = "dog_attendees.csv"
    output = ProcessCommands.new.execute_command("load #{filename}")
    assert_equal "#{filename} loaded", output
  end

  def test_queue_count_command_works
    output = ProcessCommands.new.execute_command("queue count")
    assert_equal 0, output
  end

  def test_find_first_name_works
    filename = "./event_attendees.csv"
    assets = Assets.new

    assets.open_file(filename)
    contents = assets.contents

    find = ProcessCommands.new.execute_command("find first_name John")
    
    assert_equal "John", find
  end

    # filename = "./event_attendees.csv"
    # assets = Assets.new

    # assets.open_file(filename)    
    # contents = assets.contents
    # assert_equal "20010", contents[:zipcode].first


    def execute(command_parts)
      if command_parts[1] == "count"
        queue = 0
      else
      queue = "The available queue commands are: 
      'queue count', 'queue clear', 'queue print', 
      'queue print by <filename>', 'queue save to <filename'. "
      end
      return queue
    end

end
