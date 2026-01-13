extends Area2D

@export var required_item: String

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if InventoryManager.has_item(required_item):
			InventoryManager.remove_item(required_item)
			print("Delivered:", required_item)
			# Optional: reward player here
		else:
			print("You don’t have", required_item)
