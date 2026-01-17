extends CanvasLayer

@onready var anim: AnimationPlayer = $AnimationPlayer

var _next_scene: PackedScene
var _locked := false

func change_scene(scene: PackedScene):
	if _locked:
		return

	if scene == null:
		push_error("SceneTransition: scene is null")
		return

	_locked = true
	_next_scene = scene
	anim.play("fade")

func _on_animation_finished(anim_name):
	if anim_name == "fade":
		get_tree().change_scene_to_packed(_next_scene)
		anim.play("fade_back")

	elif anim_name == "fade_back":
		# DO NOT unlock here
		pass
