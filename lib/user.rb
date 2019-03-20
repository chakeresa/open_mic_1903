class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(receiver, joke)
    learn(joke)
    @jokes.uniq!
    receiver.jokes << joke
    receiver.jokes.uniq!
  end

  def joke_by_id(id)
    @jokes.find do |joke|
      joke.id == id
    end
  end

  def all_joke_ids
    @jokes.map do |joke|
      joke.id
    end
  end
end
