extends ColorRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_button_pressed() -> void:
	#call the resetBubble function in bubble manager
	BubbleManager.createBubble();
	
	#hides creation button
	self.visible = false;
