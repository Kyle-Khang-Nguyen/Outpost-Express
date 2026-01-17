extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.has_node("Lantern"):
		body.get_node("Lantern").visible = false
	if body.has_node("Darkness"):
		body.get_node("Darkness").visible = false


func _on_body_exited(body: Node2D) -> void:
	if body.has_node("Lantern"):
		body.get_node("Lantern").visible = true
	if body.has_node("Darkness"):
		body.get_node("Darkness").visible = true
