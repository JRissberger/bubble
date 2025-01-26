extends ColorRect

var popup;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popup = get_node("../Popup");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		#hides the reset button if needed
	if popup.visible:
		self.visible = false;
	pass


func _on_button_pressed() -> void:
	#call the resetBubble function in bubble manager
	BubbleManager.resetBubble();
