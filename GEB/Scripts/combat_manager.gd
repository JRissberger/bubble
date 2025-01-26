extends Node


@export var bubble1: bubble
@export var bubble2: bubble
@export var popup: ColorRect
# Called when the node enters the scene tree for the first time.

func update():
	if (bubble1.health <= 0 || bubble2.health <= 0):
		bubble1.set_physics_process(false)
		bubble2.set_physics_process(false)
		if (bubble1.health > bubble2.health):
			popup.game_over(bubble1)
		else:
			popup.game_over(bubble2)
