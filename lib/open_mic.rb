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
    all_open_mic_jokes_ids = []

    @performers.each do |performer|
      all_open_mic_jokes_ids << performer.all_joke_ids
    end
    
    all_open_mic_jokes_ids.flatten!
    all_open_mic_jokes_ids.length != all_open_mic_jokes_ids.uniq.length
  end
end
