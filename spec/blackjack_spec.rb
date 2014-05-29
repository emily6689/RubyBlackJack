require 'rspec'
require_relative 'blackjack'

describe 'Deck' do
  let(:my_deck) {Deck.new}
  it 'has 52 cards' do
    expect(my_deck.cards.length).to eql(52)
    expect(my_deck.cards[0].class).to eql(Card)
  end

  it 'assigns a number value to each card'
    expect
  end





# describe 'Card' do
#   let (:value) {[2,3,4,5,6,7,8,9,10, 'J', 'Q', 'K', 'A']}

#   it 'has a value and a suite' do
#     expect(Card.new(9).count).to include(9)
#   end



