class OpenMic

  attr_reader :location, :date, :performers

  def initialize(attributes)
    @location = attributes[:location]
    @date = attributes[:date]
    @performers = []
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes?
    jokes = []
    @performers.each do |user|
      user.jokes.each do |joke|
        jokes << joke.id
      end
    end

    jokes.length != jokes.uniq.length
  end

end
