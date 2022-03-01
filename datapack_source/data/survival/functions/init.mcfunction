#Generate scoreboard values.
scoreboard objectives add survival.thirst dummy
scoreboard objectives add survival.tick dummy
scoreboard objectives add survival.rng dummy

#Announce in chat.
tellraw @a {"text":"\\uE000 Synical's Survival \\uE000","color":"dark_blue"}