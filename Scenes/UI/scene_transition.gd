extends CanvasLayer

@onready var anim: AnimationPlayer = $AnimationPlayer

var _next_scene := ""

func change_scene(scene_path: String, transition := "fade"):
	_next_scene = scene_path
	anim.play(transition)

func _on_animation_finished(anim_name):
	if anim_name == "fade":
		get_tree().change_scene_to_file(_next_scene)
		anim.play_backwards("fade")
