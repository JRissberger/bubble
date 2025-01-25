extends ColorRect


#sets newBubble stats back to default
func _on_button_pressed() -> void:
	BubbleManager.newBubble.Hp = 5;
	BubbleManager.newBubble.Atk = 1;
	BubbleManager.newBubble.Spd_mult = 5;
	print(BubbleManager.newBubble.Spd_mult);
	
	#call the resetBubble function in bubble manager
	BubbleManager.resetBubble();
	
	# clear the bowl
