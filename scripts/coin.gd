extends Area2D

onready var scn_hud = preload("res://scenes/hud.tscn").instance()
var coins = 0


func _ready():
	#scn_hud.get_node("Panel/Coins").text = String(coins)
	#add_child(scn_hud)
	pass

signal coin_collected


func _on_coin_body_entered(body):
	$AnimationPlayer.play("animation bounce")
	emit_signal("coin_collected")
	set_collision_mask_bit(0, false)
	#body.add_coin()
	#queue_free() #free itself/dstroy it self.free from memory also.



func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
