require 'minitest'
require 'minitest/autorun'
require './lib/queue'

class QueueTest < MiniTest::Test

  def test_queue_kinda_works
    q = Queue.new
    assert_kind_of Queue, q
    assert_instance_of Queue, q
    assert_equal Queue, q.class
  end

  def test_queue_count_command
    q = Queue.new
    assert_equal 0, q.count
  end

  def test_queue_count_command_works
    q = Queue.new(:count => 5)
    assert_equal 5, q.count
  end

end
