require 'minitest/autorun'
require 'minitest/pride'
require './lib/open_mic'

class OpenMicTest < Minitest::Test
  def test_it_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_instance_of OpenMic, open_mic
  end

  def test_it_initializes_with_hash_of_location_and_date
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "Comedy Works", open_mic.location
    assert_equal "11-20-18", open_mic.date
  end

  def test_it_initializes_with_different_location_and_date
    open_mic = OpenMic.new({location: "The Comedy Store", date: "3-7-19"})

    assert_equal "The Comedy Store", open_mic.location
    assert_equal "3-7-19", open_mic.date
  end

  def test_it_starts_with_an_empty_ary_of_performers
    open_mic = OpenMic.new({location: "The Comedy Store", date: "3-7-19"})

    assert_equal [], open_mic.performers
  end

  def test_welcome_adds_performers_to_it
    open_mic = OpenMic.new({location: "The Comedy Store", date: "3-7-19"})
    sal = User.new("Sal")
    ali = User.new("Ali")

    open_mic.welcome(sal)
    open_mic.welcome(ali)

    assert_equal [sal, ali], open_mic.performers
  end

  def test_repeated_jokes_starts_out_false
    skip # SKIPPED!
    open_mic = OpenMic.new({location: "The Comedy Store", date: "3-7-19"})

    assert_equal false,  open_mic.repeated_jokes?
    # had refute above, but it was passing when the actual value was nil (not false)
  end

  def test_repeated_jokes_are_detected_when_multiple_users_have_the_same_joke
    open_mic = OpenMic.new({location: "The Comedy Store", date: "3-7-19"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    open_mic.welcome(sal)
    open_mic.welcome(ali)
    ali.learn(joke_1)
    ali.learn(joke_2)
    ali.tell(sal, joke_1)

    assert open_mic.repeated_jokes?
  end
end
