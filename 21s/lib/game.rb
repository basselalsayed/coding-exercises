require_relative 'player'

$deck = Deck.new

Sam = Player.new("Sam")
Dealer = Player.new("Dealer")

def initial_cards(player, dealer, deck)
  2.times { 
    player.draw(deck)
    dealer.draw(deck)
  }
end

def print_score(player)
  puts "#{player.name}'s score: #{player.score}" 
end 

def check_score(player)
  player.score
end

def check_blackjack(player, dealer)
  if check_score(player) == 21 && check_score(dealer) == 21
    puts "Push"
  elsif check_score(dealer) == 21 
    blackjack
  elsif check_score(player) == 21
    blackjack
  else
    false
  end
end

def blackjack
  puts "Blackjack!"
end

def check_win(player, dealer)
  if check_score(dealer) > check_score(player)
    win(dealer)
  else
    win(player)
  end
  exit
end

def win(player)
  puts "#{player.name} wins"
end

def bust(player)
  puts "Bust! #{player.name} wins"
end

def run_game(player, dealer, deck = $deck)
  start_game(player, dealer, deck)
  until check_score(player) >= 17
    play(player, dealer, deck)
  end
  until dealer.score > player.score
    play(dealer, player, deck)
  end
  check_blackjack(player, dealer)
  check_win(player, dealer)
end

def play(player, opponent, deck)
  player.draw(deck)
  print_score(player)
  if check_score(player) > 21
    bust(opponent)
    exit
  end
end

def start_game(player, dealer, deck)
  initial_cards(player, dealer, deck)
  print_score(player)
  print_score(dealer)
  check_blackjack(player, dealer)
end

run_game(Sam, Dealer, $deck)

