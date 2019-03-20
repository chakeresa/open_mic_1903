require './lib/joke'
require './lib/user'

class OpenMic
  attr_reader :location, :date, :performers
  
  def initialize(show)
    @location = show[:location]
    @date = show[:date]
    @performers = []
  end
end
