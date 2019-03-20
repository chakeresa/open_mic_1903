require './lib/joke'
require './lib/user'

class OpenMic
  attr_reader :location, :date
  def initialize(show)
    @location = show[:location]
    @date = show[:date]
  end
end
