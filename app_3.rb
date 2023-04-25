require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "|----------------------------------|"
puts "|        POOOOooooooOOOOOO         |"
puts "|    Il ne doit en rester qu'un!   |"
puts "|----------------------------------|"
puts ""
puts ""
print "Quel est ton prenom? "
firstname=gets.chomp
# Initialisation du jeu 
my_game = Game.new(firstname)
my_game.show_players
my_game.menu
my_game.menu_choice
my_game.end
#binding.pry
