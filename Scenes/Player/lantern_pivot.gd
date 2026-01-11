extends Node2D

@export var max_angle := 18.0        # degrees
@export var swing_speed := 8.0       # smoothing
@export var sway_strength := 1.2     # movement influence

var target_angle := 0.0

func _process(delta):
	# Get player horizontal movement (adjust to your player script)
	var move_x := Input.get_action_strength("right") \
				- Input.get_action_strength("left")

	target_angle = move_x * max_angle * sway_strength
	rotation = lerp(rotation, deg_to_rad(target_angle), swing_speed * delta)
