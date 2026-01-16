extends AnimatedSprite2D

@onready var door: AnimatedSprite2D = $"."
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var door_collider: CollisionShape2D = $StaticBody2D/DoorCollider

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if !door_collider.disabled:
		door_collider.disabled = true
	elif door_collider.disabled:
		door_collider.disabled = false
