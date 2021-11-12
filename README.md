# VehicleKeyDetection
乗り物に乗っているプレイヤーの入力した移動キーを取得する事ができるライブラリ

対応バージョン: **1.16~**

---
## DL
[こちら](https://github.com/yavu/VehicleKeyDetection/releases/latest/download/VehicleKeyDetection.zip)をDLして下さい

## 使い方
キー検知したいプレイヤーを対象に`function yv_key_detection:core`を毎tick実行することで、その時押している移動キーに応じたtagが付与されます  

### 例
```mcfunction
# 移動キーのtagを付与
execute as @s run function yv_key_detection:core

# 前進キーが押されているなら"Ｗ"とチャット
execute as @s[tag=Yv_Key_Front] run say Ｗ

# 前進キーと右移動キーが両方押されているなら"Ｗ＋Ｄ"とチャット
execute as @s[tag=Yv_Key_Front,tag=Yv_Key_Right] run say Ｗ＋Ｄ
```

## 注意事項
* チャンク`0, 0`がforceloadされます

## 連絡先
[Twitter](https://twitter.com/Yavu_8B)
