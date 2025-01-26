extends ColorRect

#reminder to add one thing of each category
var popup;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popup = get_node("addReminder");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	#only allows creation if one thing from each category has been added
	if BubbleManager.gasAdded && BubbleManager.liquidAdded && BubbleManager.otherAdded:
		#hides create button
		self.visible = false;
		#call the resetBubble function in bubble manager
		BubbleManager.createBubble();
	else:
		popup.visible = true;

func _input(event:InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			popup.visible = false;
