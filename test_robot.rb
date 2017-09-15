gem 'activesupport', '5.1.3'
require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
      a = Robot.new
      a.needs_repairs = true
      a.foreign_model = true
    # act
     result = a.station
    # assert
    assert_equal(1,result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    a = Robot.new
    a.needs_repairs = true
    a.vintage_model = true
    # act
    result = a.station
    # assert
    assert_equal(2,result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    a = Robot.new
    a.needs_repairs = true
    # act
    result = a.station
    # assert
    assert_equal(3,result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    a = Robot.new
    # act
    result = a.station
    # assert
    assert_equal(4,result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
      a = Robot.new

    # act
    result = a.prioritize_tasks
    # assert
    assert_equal(-1,result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    a = Robot.new
    a.todos = [1,2,3,4,5]
    # act
      result = a.prioritize_tasks
    # assert
    assert_equal(5,result)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    a = Robot.new
    a.day_off = "Sunday"

    # act
    result = a.workday?("Sunday")
    # assert
    assert_equal(false,result)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    a = Robot.new
    a.day_off = "Saturday"
    # act
    result = a.workday?("Monday")
    # assert
    assert_equal(true,result)
  end

end
