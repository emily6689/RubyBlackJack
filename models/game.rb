class Game
  attr_reader :game_deck, :player_hand, :dealer_hand

  def initialize
    @game_deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @game_deck.cards.shuffle!
    2.times{@player_hand.deal_from game_deck}
    2.times{@dealer_hand.deal_from game_deck}
  end

  def player_hand_value
    player_hand.get_value
  end

  def dealer_hand_value
    dealer_hand.get_value
  end

  def show_stats
    print "--- Dealer Hand: #{dealer_hand.show_hand} --- "
    puts "#{dealer_hand_value} "
    print "--- Your Hand: #{player_hand.show_hand} --- "
    puts "#{player_hand_value}"
  end

  def player_prompt
    print "Stand or hit? "
    decision = gets.chomp
  end

  def player_turn_under_21
    puts show_stats
    if player_hand_value > 21
      return false
    else
      decision = player_prompt
      if decision == "stand"
        return true
      elsif decision == "hit"
        player_hand.deal_from game_deck
        player_turn_under_21
      else
        puts 'Please enter "hit" or "stand"'
        player_turn_under_21
      end
    end
  end

  def dealer_turn
    if dealer_hand_value > 21
      false
    elsif dealer_hand_value < 17
      dealer_hand.deal_from game_deck
      dealer_turn
    else
      true
    end
  end

  def play_blackjack
    conclusion = ""
    if !player_turn_under_21
      conclusion = "You've exceeded 21! You lose :("
    else
      if !dealer_turn_under_21
        puts show_stats
        conclusion = "You win!"
      else
        puts show_stats
        if player_hand.get_value > dealer_hand.get_value
          conclusion =  "You win!"
        elsif player_hand.get_value < dealer_hand.get_value
          conclusion = "You lose!"
        else
          conclusion = "TIE."
        end
      end
    end
    puts conclusion
    conclusion
  end
end
