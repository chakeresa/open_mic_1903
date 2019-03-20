require './lib/joke'
require './lib/user'

class OpenMic
  attr_reader :location, :date, :performers

  def initialize(show)
    @location = show[:location]
    @date = show[:date]
    @performers = []
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    all_jokes = []

    @performers.each do |performer|
      all_jokes << performer.jokes
    end
# require "pry"; binding.pry
    all_jokes.flatten!
    !all_jokes.length == all_jokes.uniq.length
  end
end
