
#> Private Declares
# @internal
    #declare tag Yv_Sin_Cos
    #declare tag Yv_Key_Front
    #declare tag Yv_Key_Back
    #declare tag Yv_Key_Right
    #declare tag Yv_Key_Left

# スコアボード
    scoreboard objectives add Yv_Sin_Cos dummy
    scoreboard players set |/ Yv_Sin_Cos 17500

# チャンクロード
    execute in overworld run forceload add 0 0

# sin cos取得用アマスタ
    execute in overworld run kill @e[type=armor_stand,tag=Yv_Sin_Cos]
    execute in overworld positioned 0 1 0 unless entity @e[type=armor_stand,tag=Yv_Sin_Cos,distance=..3] run summon armor_stand 0 1 0 {Small:1b,Invisible:1b,Marker:1b,Tags:["Yv_Sin_Cos"]}
