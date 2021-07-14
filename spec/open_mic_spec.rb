require "./lib/open_mic"
require "./lib/user"
require "./lib/joke"
require "pry"

RSpec.describe OpenMic do

  it "exists" do
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    expect(open_mic).to be_an_instance_of(OpenMic)
    expect(open_mic.location).to eq("Comedy Works")
    expect(open_mic.date).to eq("11-20-18")
    expect(open_mic.performers).to eq([])
  end

  it "has welcome" do
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    user_1 = User.new("Sal")
    user_2 = User.new("Ali")

    open_mic.welcome(user_1)
    open_mic.welcome(user_2)

    expect(open_mic.performers).to eq([user_1, user_2])
  end

  it "has repeated_jokes?" do
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    user_1 = User.new("Sal")
    user_2 = User.new("Ali")

    joke_1 = Joke.new(22, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(13, "How do you keep a lion from charging?", "Take away its credit cards.")

    user_2.learn(joke_1)
    user_2.learn(joke_2)

    expect(open_mic.repeated_jokes?).to eq(false)

    user_2.learn(joke_1)
    user_2.learn(joke_2)
    user_1.learn(joke_1)

    expect(open_mic.repeated_jokes?).to eq(true)
  end
end