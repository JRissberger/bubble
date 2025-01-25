extends Sprite2D

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#determines what to update in manager based on held object
	#I apologize for the if statements this is gonna be messy
	#Flat adding to the stats so resetting is easier
	if BubbleManager.currentObject == "xenon" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.speed1 = 6;
	
	if BubbleManager.currentObject == "oxygen" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.speed1 = 8;
	
	if BubbleManager.currentObject == "helium" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.speed1 = 10;
	
	if BubbleManager.currentObject == "water" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.health1 = 6;
	
	if BubbleManager.currentObject == "paint" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.health1 = 8;
	
	if BubbleManager.currentObject == "soap" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.health1 = 10;
	
	if BubbleManager.currentObject == "tadpoles" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.attack1 = 4;
	
	if BubbleManager.currentObject == "glitter" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.attack1 = 3;
	
	if BubbleManager.currentObject == "knife" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.attack1 = 5;
	
	
	
