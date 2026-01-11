class_name Player
extends CharacterBody2D


@onready var sprite: Sprite2D = $PlayerSprite
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var lantern_pivot: Node2D = $LanternPivot


@export var movement_speed : float = 200
var character_direction : Vector2

func _physics_process(delta: float) -> void:
	character_direction.x = Input.get_axis("left", "right")
	character_direction.y = Input.get_axis("up", "down")
	character_direction = character_direction.normalized()
	
	# Sprite Flip
	if character_direction.x > 0:
		sprite.flip_h = false
		lantern_pivot.scale.x = 1
	elif character_direction.x < 0:
		sprite.flip_h = true
		lantern_pivot.scale.x = -1
		
	if character_direction:
		velocity = character_direction * movement_speed
		if !anim.is_playing() or anim.current_animation != "walk":
			anim.play("walk")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if !anim.is_playing() or anim.current_animation != "idle":
			anim.play("idle")
			
	move_and_slide()



#@export var speed := 200.0
#
#@onready var anim: AnimationPlayer = $AnimationPlayer
#
#var last_dir := Vector2.DOWN
#var current_anim := ""
#
#func _physics_process(delta: float) -> void:
	#var direction: Vector2 = GameInputEvents.movement_input()
	#
	#if direction == Vector2.UP:
		#anim.play("idle_up")
	#elif direction == Vector2.RIGHT:
		#anim.play("idle_right")
	#elif direction == Vector2.DOWN:
		#anim.play("idle_down")
	#elif direction == Vector2.LEFT:
		#anim.play("idle_left")
	##else:
		##anim.play("idle_down")
		#
	#if direction == Vector2.UP:
		#anim.play("walk_up")
	#elif direction == Vector2.RIGHT:
		#anim.play("walk_right")
	#elif direction == Vector2.DOWN:
		#anim.play("walk_front")
	#elif direction == Vector2.LEFT:
		#anim.play("walk_left")
	#
	#velocity = direction * speed
#
	#move_and_slide()
