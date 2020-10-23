extends CanvasLayer
#var scn_coin = preload("res://scenes/coin.tscn")
var coins = 0
export var coins_to_go_next_level = 3

func _ready():
	$Panel/Coins.text = String(coins)
	
	pass


func _physics_process(delta):
	checkForCoins()


func checkForCoins():
	if coins >= coins_to_go_next_level:
		get_tree().change_scene("res://scenes/level1.tscn")


func _on_coin_collected():
	print("_on_coin_collected called..")
	coins += 1
	$Panel/Coins.text = String(coins)
	pass # Replace with function body.
