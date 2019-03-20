require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_initializes_with_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_starts_with_an_empty_ary_of_jokes
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end
end
