extends Node2D

var ball = load("res://ball.tscn")
var rng = RandomNumberGenerator.new()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			rng.randomize()
			var r_color = rng.randi_range(0, 6)
			var v_x = rng.randi_range(-250, 250)
			var v_y = rng.randi_range(-250, 250)
			var b = ball.instance()
			b.get_node("ball_pic").set_texture(load("res://sprite/"+String(r_color)+".png"))
			b.set_linear_velocity(Vector2(v_x,v_y))
			b.position = event.position
			add_child(b)
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
