require 'sinatra'
require 'haml'
require 'pry'
require_relative "models/card.rb"
require_relative "models/deck.rb"
require_relative "models/game.rb"
require_relative "models/gameseries.rb"
require_relative "models/hand.rb"


get '/' do
  @game = Game.new
  @dealer_hand = @game.dealer_hand
  @player_hand = @game.player_hand

  haml :gameboard
end
