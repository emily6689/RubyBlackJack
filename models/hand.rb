class Hand
  attr_reader :hand_cards
  def initialize
    @hand_cards = []
  end

  def deal_from(deck)
    @hand_cards << deck.cards.pop
  end

  def get_value
    value = 0
    self.hand_cards.each do |card|
      value += Deck::VALUES[card.rank].to_i
    end
    value
  end

  def show_hand
    @hand_cards.join(' ')
  end
end
