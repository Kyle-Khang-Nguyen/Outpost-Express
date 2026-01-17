extends Area2D

var turned_on = false
@onready var light_switch: Node2D = $".."
# stores the value whether it is the right switcher
#var light_switch_value = light_switch.right_switch_value

func interact_with_player():
		print("Turned on")
		turned_on = true
		print("I am " + str(light_switch.right_switch_value))
