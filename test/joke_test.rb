require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test
  def test_it_exists
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_instance_of Joke, joke
  end

  def test_it_initializes_with_id_setup_and_punchline
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_equal 1, joke.id
    assert_equal "Why did the strawberry cross the road?", joke.setup
    assert_equal "Because his mother was in a jam.", joke.punchline
  end

  def test_it_initializes_with_different_id_setup_and_punchline
    joke = Joke.new(2, "Why did the chicken cross the road?", "To get to the other side.")

    assert_equal 2, joke.id
    assert_equal "Why did the chicken cross the road?", joke.setup
    assert_equal "To get to the other side.", joke.punchline
  end
end
