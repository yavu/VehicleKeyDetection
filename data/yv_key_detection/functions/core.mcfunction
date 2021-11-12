
# タグ消去
    function yv_key_detection:remove

# ベクトル取得
    data modify storage yv:key_detection Motion set from entity @s Motion
    execute store result score |VecX Yv_Sin_Cos run data get storage yv:key_detection Motion[0] 10000
    execute store result score |VecZ Yv_Sin_Cos run data get storage yv:key_detection Motion[2] 10000

# sin cos取得
    execute rotated as @s rotated ~ 0 in overworld positioned 0.0 0.0 0.0 run tp @e[type=armor_stand,tag=Yv_Sin_Cos,limit=1] ^ ^ ^1
    data modify storage yv:key_detection Pos set from entity @e[type=armor_stand,tag=Yv_Sin_Cos,limit=1] Pos
    execute store result score |Sin Yv_Sin_Cos run data get storage yv:key_detection Pos[0] 10000
    execute store result score |Cos Yv_Sin_Cos run data get storage yv:key_detection Pos[2] 10000

# Y軸回転行列
    scoreboard players operation |VecXr Yv_Sin_Cos = |VecX Yv_Sin_Cos
    scoreboard players operation |VecXr Yv_Sin_Cos *= |Cos Yv_Sin_Cos
    scoreboard players operation |Temp Yv_Sin_Cos = |VecZ Yv_Sin_Cos
    scoreboard players operation |Temp Yv_Sin_Cos *= |Sin Yv_Sin_Cos
    scoreboard players operation |VecXr Yv_Sin_Cos -= |Temp Yv_Sin_Cos

    scoreboard players operation |VecZr Yv_Sin_Cos = |VecX Yv_Sin_Cos
    scoreboard players operation |VecZr Yv_Sin_Cos *= |Sin Yv_Sin_Cos
    scoreboard players operation |Temp Yv_Sin_Cos = |VecZ Yv_Sin_Cos
    scoreboard players operation |Temp Yv_Sin_Cos *= |Cos Yv_Sin_Cos
    scoreboard players operation |VecZr Yv_Sin_Cos += |Temp Yv_Sin_Cos

    scoreboard players operation |VecXr Yv_Sin_Cos /= |/ Yv_Sin_Cos
    scoreboard players operation |VecZr Yv_Sin_Cos /= |/ Yv_Sin_Cos

    scoreboard players reset |Temp Yv_Sin_Cos

# タグ付け
    execute if score |VecZr Yv_Sin_Cos matches 65..135 run tag @s add Yv_Key_Front
    execute if score |VecZr Yv_Sin_Cos matches -135..-65 run tag @s add Yv_Key_Back
    execute if score |VecXr Yv_Sin_Cos matches -135..-65 run tag @s add Yv_Key_Right
    execute if score |VecXr Yv_Sin_Cos matches 65..135 run tag @s add Yv_Key_Left
