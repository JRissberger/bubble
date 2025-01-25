extends Sprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# TODO: check added status of each type. determine what was added based on new health/speed/attack
	# show/hide sprites accordingly
	pass
	
	


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print(BubbleManager.currentObject)
