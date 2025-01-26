extends ColorRect
#text for the "bubble created" popup
var popupText;
var arraySize = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popupText = get_node("Body");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	#gets array size to access proper bubble data
	arraySize = BubbleManager.bubbles.size();
	popupText.text = ("Health: " + str(BubbleManager.bubbles[arraySize-1].Hp) + "\nAttack: " + 
	str(BubbleManager.bubbles[arraySize-1].Atk) + "\nSpeed: " + str(BubbleManager.bubbles[arraySize-1].Spd_mult)
	+ "\n\n\nSelect BATTLE! to enter the arena!");
	#displays popup
	self.visible = true;
