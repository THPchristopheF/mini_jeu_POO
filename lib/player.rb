class Player
  attr_accessor :name  #on ne mets pas @ pour la variable d'instance dans l'attr
  attr_accessor :life_points

def initialize(name_to_save)
  @name=name_to_save
  @life_points=10
end



def show_state
  if @life_points>0 then @life_points
  else @life_points=0
  end
end

def get_damage(damage_rcvd)
@life_points=@life_points-damage_rcvd
  if life_points>0 then "#{self.name} a #{@life_points} points de vie" 
    else puts "#{self.name} a été tué !"
  end
end
def attacks(adversaire)
  puts "#{self.name} attaque #{adversaire.name} !"
  damage_attack=compute_damage
  puts "il lui inflige #{damage_attack} points de dommage"
  adversaire.get_damage(damage_attack)
end

def compute_damage
  return rand(1..6)
end
  
#binding.pry

end

 class HumanPlayer < Player
   attr_accessor :weapon_level

   def initialize(name_to_save)
     super 
     @weapon_level=1
     @life_points=100
    end

    def show_state
      puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
   end
   def compute_damage
     rand(1..6) * @weapon_level
   end
   def search_weapon
     new_weapon_level=rand(1..6)
     puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
     if new_weapon_level>weapon_level then 
       self.weapon_level=new_weapon_level         ###j'affecte la nouvelle arme à l'instance
       puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
     else " Arfff pas mieux que l'arme actuelle"
     end
   end
  
   def search_health_pack
     health_pack=rand(1..6)       # valeur du dé
     puts "healthpack #{health_pack}"
     val_health_pack=0            # mise à 0 valeur du healthpack
     case  health_pack
       when 1 
         puts "Tu n'as rien trouvé"
       when 2..5
         val_health_pack=50
         puts "Bravo, tu as trouvé un pack de +50 points de vie !"
       when 6
         val_health_pack=80
         puts "Waow, tu as trouvé un pack de +80 points de vie !"
     end
      # calcul et affecte le lifepoints  en fct de sa valeur
     (@life_points+val_health_pack)>100? self.life_points=100 : self.life_points=@life_points+val_health_pack

  end


   #binding.pry
 end 

