class Game
attr_accessor :human_player 
attr_accessor :enemies
def initialize(username)
  
  @human_player=HumanPlayer.new(username)
  @enemies=Array.new
  player1=Player.new("player1")
  player2=Player.new("player2")
  player3=Player.new("player3")
  player4=Player.new("player4") 
  # @enemies.push(player1)
  # @enemies.push(player2)
  # @enemies.push(player3)
  # @enemies.push(player4)
  @enemies=[player1,player2,player3,player4]
end
#binding.pry
def kill_player(player)
  @enemies.delete(player)
end
def is_still_going?
  puts "#{@enemies.count}"
  puts "#{@human_player.life_points}"
  if (@enemies.count) > 0  &&  @human_player.life_points >0 then
    true
  else
    false
  end
  #(((enemies.count)>0) && (human_player.show_state>0))? true :false
end

def show_players
  @human_player.show_state
  puts "Ennemis restants: #{enemies.count}"
end

def menu
  puts "Quelle action action veux tu effectuer?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "Attaquer un joueur en vue: "  
end

def menu_choice
  while is_still_going? do
    puts "#{player1.name} : #{player1.show_state} points"
    puts "Voici l'etat de chaque joueur: "
    @human_player.show_state
    puts "#{player1.name} : #{player1.show_state} points"
    puts "#{player2.name} : #{player2.show_state} points"
    puts ""
    puts ""
    self.menu
    self.show_players
    puts "0 - #{player1.name} a #{player1.show_state} points de vie"
    puts "1 - #{player2.name} a #{player2.show_state} points de vie"
    puts "2 - #{player3.name} a #{player3.show_state} points de vie"
    puts "3 - #{player4.name} a #{player4.show_state} points de vie"
    choix=gets.chomp
    case choix
      when "a" 
        humanplayer.search_weapon
        
      when "s"
        humanplayer.search_health_pack
  
      when "0" 
        humanplayer.attacks(player1)
         if player1.life_points<=0 then
          kill_player(player1)  
         end
  
      when "1"
        humanplayer.attacks(player2)
        if player2.life_points<=0 then
          kill_player(player2)
        end 


      when "2"
        humanplayer.attacks(player3)
        if player2.life_points<=0 then
          kill_player(player3)
        end 
      when "3"
        humanplayer.attacks(player4)
        if player2.life_points<=0 then
          kill_player(player4)
        end 


    end
    gets.chomp
    if enemies.empty?
      puts "  ====== YOU WIN  ====== "
      else
      enemies_attacks
      gets.chomp
    puts 
    puts 
    end
 end
end
def enemies_attacks
  self.enemies.each {|bot| bot.attacks(humanplayer)}
end

def end
  if enemies.empty? then puts "YOU WINNNNNNN"
  else humanplayer.life_points<=0  
    puts="YOU LOOOOOOOOOOOOOSSSSSSEEEEEEEEE "
  end
end
end
