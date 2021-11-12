
# 乗ってないならタグ消し
    execute as @a unless entity @s[tag=!Yv_Key_Back,tag=!Yv_Key_Front,tag=!Yv_Key_Left,tag=!Yv_Key_Right] unless predicate yv_key_detection:is_riding run function yv_key_detection:remove
