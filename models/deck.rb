class Deck
  attr_reader :cards
  SUITS  = %w(H D S C)
  RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  VALUES = {
    'A' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'J' => 10,
    'Q' => 10,
    'K' => 10
  }

  def initialize
    @cards = build_deck
  end

  def build_deck
    deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(rank, suit)
      end
    end
    deck
  end
end
