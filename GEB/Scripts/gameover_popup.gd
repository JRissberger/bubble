extends ColorRect
#text for the "bubble created" popup

var popupText;
var arraySize = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popupText = get_node("Body");


func game_over(winner) -> void:
	popupText.text = str(winner.title, " won!")
	#displays popup
	self.visible = true;
