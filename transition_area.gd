extends Area2D

@export var scene_to_change_to: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneTransition.change_scene(scene_to_change_to)
		print("Switch")
