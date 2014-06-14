require 'sinatra'
require 'haml'
require 'pry'
require 'shotgun'
require_relative "models/card.rb"
require_relative "models/deck.rb"
require_relative "models/game.rb"
require_relative "models/gameseries.rb"
require_relative "models/hand.rb"

set :sessions, true

helpers do
  def restore_game
    if session[:game]
      @game = session[:game]
    else
      @game = Game.new
      session[:game] = @game
    end
      @deck = @game.game_deck
      @dealer_hand = @game.dealer_hand
      @player_hand = @game.player_hand
  end

  def save
    session[:game] = @game
  end
end

before do
  restore_game
end

get '/' do
  restore_game

  haml :gameboard
end

post '/' do
  if params[:action] == "hit"
    @player_hand.deal_from @deck
  end
  redirect '/'
end
