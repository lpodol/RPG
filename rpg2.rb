beast1 = {"name"=>"tiger"}
beast_array = [beast1];


# health counts
hero_health = 10
baddie_health = 10

# who's alive?
hero_alive = true
baddie_alive = true

# intro
puts "Hey, Beastmaster. What do they call you?"
name = gets.chomp.upcase
puts "So glad you're here, #{name}. Our village has been plagued by a series of terrible beasts, and we desperately need you to gain mastery over the hordes. Will you fight this snake? Y/N?"
answer = gets.chomp.upcase

def flight(healthH,aliveH,aliveB,healthB)
  initial_health = healthH
  healthH-=2
  puts "You ran away. Your health count has dropped from #{initial_health} to #{healthH}. You are a horrendous coward and no true beastmaster. We spit on your name and curse your descendents."
  if healthH == 0
    aliveH = false
    puts "The villagers have murdered you for your cowardice. Tales of your shame reach your home and loved ones. You are unmourned."
  else
    puts "Are you sure? We heard you were the bravest of the land. Y/N"
    query = gets.chomp.upcase
    if query == "N"
      flight(healthH,aliveH,aliveB,healthB)
    elsif query == "Y"
      fight(healthH,aliveH,aliveB,healthB)
    end
  end
end


def fight(healthH,aliveH,aliveB,healthB)
  initial_health = healthH
  hero_turn = true
  while aliveH == true && aliveB ==true
    #run hero hit
    if hero_turn
      damage_chance = rand(1..100) #this is the 20% chance the hero hits
      damage_baddie = rand(2..4)
      damage_hero = rand(1..3)
      if damage_chance <= 20
        puts "You missed!"
        hero_turn = false
      elsif damage_chance > 20
        healthB-=damage_baddie
        puts "You got a hit!"
        if healthB > 0
          puts "The beast's health has dropped to #{healthB}."
        elsif healthB <= 0
          puts "The beast is dead!"
          aliveB = false
        else
          hero_turn = false
        end
      end
    elsif hero_turn == false
      # bad_turn
      if damage_chance <= 40
        puts "Lucky you; he missed. Strike!"
        hero_turn = true
      elsif damage_chance > 40
        healthH-=damage_hero
        puts "You've been wounded! Your health has dropped to #{healthH}. Strike again to save yourself."
        if healthH <= 0
          aliveH =false
        else
          hero_turn = true
        end
      end
    end #ends battle loop
  end #ends while loop
  if aliveH == false
    puts "You are so dead."
  else
    puts "You have lived to fight another day! Will you fight for us again? Y/N"
    healthH = initial_health + 1
    puts healthH
    aliveB = true
    healthB = healthH # you can reset baddie health to 10 or increment lealevels
    query = gets.chomp.upcase
    healthH = fight_or_flight?(query,healthH,aliveH,aliveB,healthB)
  end
end


def fight_or_flight?(answer, healthH, aliveH, aliveB,healthB)
  if answer == "N"
    flight(healthH,aliveH,aliveB,healthB)
  elsif answer == "Y"
    puts "BATTLE ROUND!"
    puts "You make the first move."
    fight(healthH,aliveH,aliveB,healthB)
  end
end

hero_health = fight_or_flight?(answer,hero_health,hero_alive,baddie_alive,baddie_health)
# action begins
puts "You have #{hero_health} health points."
# defs
