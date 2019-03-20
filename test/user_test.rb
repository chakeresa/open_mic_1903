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

  def test_it_learns_a_joke
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    sal.learn(joke_1)

    assert_equal [joke_1], sal.jokes
  end

  def test_it_learns_multiple_jokes
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal [joke_1, joke_2], sal.jokes
  end
end
