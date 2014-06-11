class GameSeries
  attr_reader :total_money
  def initialize
    @total_money = 100
  end

  def bet
    print "How much are you putting in? "
    gets.chomp
  end

  def player_prompt
    print "Player another round? (yes or no): "
    gets.chomp
  end

  def play_new_game
    new_game = Game.new
    new_game.play_blackjack
  end

  def bet_and_play
    player_bet = bet
    if player_bet.to_i < @total_money && player_bet.to_i > 0
      game = play_new_game
      if game == "You've exceeded 21! You lose :(" || game == "You lose!"
        @total_money -= player_bet.to_i
      elsif game == "You win!"
        @total_money += player_bet.to_i
      end
    else
      puts "Please enter an amount of money within the bounds of your pot."
    end
  end

  def needs_name
    puts "You're currently holding #{total_money}"
    bet_and_play
    another_round = player_prompt
    if another_round == "yes"
      needs_name
    end
  end
end
