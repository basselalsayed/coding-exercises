class Deck
  attr_accessor :cards

  def initialize 
    cards = ["two", "three", "four", "five", "six", "seven",
    "eight", "nine", "ten",
    "jack", "queen", "king", "ace"]
    @cards = []
    4.times { cards.each { |card| @cards << card } }
  end
end
