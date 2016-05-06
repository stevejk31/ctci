SUITS = [:clubs, :diamonds, :hearts, :spades]
VALUES = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K"]
class Card
  attr_reader :value, :suit
  def initialize(value, suit)
    raise "Invalid Suit" unless SUITS.include?(suit)
    raise "Invalid Value" unless VALUES.include?(value)
    @value = value
    @suit = suit
  end
end

class Deck
  def initialize
    @deck = Deck.generate_deck
  end

  def self.generate_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck.push(Card.new(value,suit))
      end
    end
    deck
  end

  def shuffle
    @deck.shuffle
  end

  def deal
    @deck.pop
  end
end
