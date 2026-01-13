extends Node2D

# Note: we still need UI art for dialogues
# Note: you can use this as an prefab for dialogues.
# only thing to change is the path in line 13 and the if statement

var ballon_scene = preload("res://Dialogues/game_dialogue_ballon.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var ballon: BaseGameDialogueBalloon = ballon_scene.instantiate()
		get_tree().current_scene.add_child(ballon)
		ballon.start(load("res://Dialogues/Conversations/test_dialogue.dialogue"), "start")
