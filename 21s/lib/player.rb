require_relative 'deck'

class Player
  attr_reader :hand, :name

  def initialize(name)
    @hand = []
    @name = name
  end

  def draw(deck)
    @hand << deck.cards.delete_at(rand(deck.cards.length))
  end

  def score
    values = {
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9,
      "ten" => 10,
      "jack" => 10,
      "queen" => 10,
      "king" => 10,
      "ace" => 11 
    }
    @hand.sum { |card| values[card] }
  end
end