#Init new players
execute as @a[tag=!survival.init] run scoreboard players set @s survival.thirst 20
execute as @a[tag=!survival.init] run tag @s add survival.init

#Thirst Effect
execute as @a if predicate survival:in_desert run scoreboard players add @s survival.tick 1
execute as @a unless predicate survival:in_desert if score @s survival.tick matches 1.. run scoreboard players remove @s survival.tick 1

execute as @a if score @s survival.tick matches 3600.. run tag @s add survival.thirst
execute as @a if score @s survival.tick matches 0..0 run tag @s remove survival.thirst

#RNG
execute as @a[gamemode=!creative,gamemode=!spectator] store result score @s survival.rng run loot spawn ~ ~ ~ loot survival:rng
execute as @a[gamemode=!creative,gamemode=!spectator,tag=!survival.thirst] if score @s survival.rng matches 1000..1000 if score @s survival.thirst matches 1.. run scoreboard players remove @s survival.thirst 1
execute as @a[gamemode=!creative,gamemode=!spectator,tag=survival.thirst] if score @s survival.rng matches 950..1000 if score @s survival.thirst matches 1.. run scoreboard players remove @s survival.thirst 1

#Apply Wither Effect if bar hits 0.
execute as @a[gamemode=!creative,gamemode=!spectator] if score @s survival.thirst matches 0..0 run effect give @s wither 2 1 true

#Display UI
execute as @a[gamemode=!creative,gamemode=!spectator] at @s if block ~ ~1 ~ minecraft:water run title @s actionbar ""
execute as @a[gamemode=!creative,gamemode=!spectator,tag=!survival.thirst] at @s unless block ~ ~1 ~ minecraft:water run function survival:bar
execute as @a[gamemode=!creative,gamemode=!spectator,tag=survival.thirst] at @s unless block ~ ~1 ~ minecraft:water run function survival:thirst_bar