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

  def test_it_tells_a_joke
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    sal.tell(ali, joke_1)

    assert_equal [joke_1], ali.jokes
  end

  def test_it_tells_multiple_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

    assert_equal [joke_1, joke_2], ali.jokes
  end

  def test_telling_a_joke_adds_it_to_own_jokes_ary
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    sal.tell(ali, joke_1)

    assert_equal [joke_1], sal.jokes
  end

  def test_telling_a_joke_multiple_times_does_not_add_to_own_jokes_ary
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    sal.tell(ali, joke_1)
    sal.tell(ali, joke_1)

    assert_equal [joke_1], sal.jokes
  end

  def test_hearing_a_joke_multiple_times_does_not_add_to_your_jokes_ary
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    sal.tell(ali, joke_1)
    sal.tell(ali, joke_1)

    assert_equal [joke_1], ali.jokes
  end

  def test_it_reports_joke_by_id
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new(10, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    sal.tell(ali, joke)

    assert_equal joke, ali.joke_by_id(10)
  end

  def test_it_joke_by_id_for_another_id
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    sal.tell(ali, joke1)
    sal.tell(ali, joke2)

    assert_equal joke1, ali.joke_by_id(1)
    assert_equal joke2, ali.joke_by_id(2)
  end
end
