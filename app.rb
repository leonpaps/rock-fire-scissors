require 'sinatra'

# pokemon types
types = ["normal", "fire", "water", "grass", "electric", "ice", "fighting", "poison", "ground", "flying", "psychic", "bug", "rock", "ghost", "dragon", "dark", "steel", "fairy"]

# function to determine the winner
def winner(player, computer)
  # check for draw
  if player == computer
    return "It's a draw!"
  end

  # check for player win
  if (player == "fire" && computer == "grass") || (player == "water" && computer == "fire") || (player == "grass" && computer == "water") || (player == "electric" && computer == "water") || (player == "ice" && computer == "grass") || (player == "fighting" && computer == "normal") || (player == "poison" && computer == "grass") || (player == "ground" && computer == "electric") || (player == "flying" && computer == "fighting") || (player == "psychic" && computer == "fighting") || (player == "bug" && computer == "psychic") || (player == "rock" && computer == "flying") || (player == "ghost" && computer == "psychic") || (player == "dragon" && computer == "dragon") || (player == "dark" && computer == "psychic") || (player == "steel" && computer == "rock") || (player == "fairy" && computer == "dragon")
    return "You win!"
  end

  # otherwise, computer wins
  return "Computer wins!"
end

get '/' do
  @types = types
  erb :form, :layout => :layout
end

post '/play' do
  # get the player's choice
  @player = params[:player]

  # randomly select a type for the computer
  @computer = types.sample

  # determine the winner and print the result
  @result = winner(@player, @computer)

  erb :results, :layout => :layout
end
