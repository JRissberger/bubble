extends Sprite2D

var dragging = false;
var objectOffset = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if dragging:
		position = get_global_mouse_position() - objectOffset


func _on_button_button_down() -> void:
	dragging = true;
	objectOffset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false;
