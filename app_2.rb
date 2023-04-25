require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
#require_relative 'lib/human_player'
puts "|----------------------------------|"
puts "|        POOOOooooooOOOOOO         |"
puts "|    Il ne doit en rester qu'un!   |"
puts "|----------------------------------|"
puts ""
puts ""
print "Quel est ton prenom? "
firstname=gets.chomp

# initialisation du jeu 

humanplayer=HumanPlayer.new(firstname)
player1=Player.new("Josiane")
player2=Player.new("José")
ennemies=[player1,player2]

# combat
while humanplayer.life_points >0 && (player1.life_points>0 || player2.life_points>0) do
  puts "Voici l'etat de chaque joueur: "
  humanplayer.show_state
  puts "#{player1.name} : #{player1.show_state} points"
  puts "#{player2.name} : #{player2.show_state} points"
  puts ""
  puts ""
  puts "Quelle action action veux tu effectuer?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "Attaquer un joueur en vue: "
  puts "0 - #{player1.name} a #{player1.show_state} points de vie"
  puts "1 - #{player2.name} a #{player2.show_state} points de vie"
  choix=gets.chomp
  case choix
    when "a" 
      humanplayer.search_weapon
      
    when "s"
      humanplayer.search_health_pack

    when "0" 
      humanplayer.attacks(player1)
       if player1.life_points<=0 then
        ennemies.delete(player1)  
       end

    when "1"
      humanplayer.attacks(player2)
      if player2.life_points<=0 then
        ennemies.delete(player2) 
      end 
  end
  gets.chomp
  if ennemies.empty?
    puts "  ====== YOU WIN  ====== "
    else
    ennemies.each {|bot| bot.attacks(humanplayer)}
    gets.chomp
  puts 
  puts 
  end
end