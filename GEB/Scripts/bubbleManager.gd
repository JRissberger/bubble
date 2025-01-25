extends Node

#ingredient enums
enum Liquid{
	Water,
	Soap,
	Paint,
};

enum Gas{
	Helium,
	Oxygen,
	Xenon
};

enum OtherObject{
	Tadpoles,
	Knife,
	Glitter
};

var newBubble = bubble.new();
var opponentBubble = bubble.new();
#tracks the current held object
#this is here exclusively because I'm fighting for my life with signals and I don't have the time for that
#this approach would NOT get a good grade for coding standards my bad
var currentObject = "none";

#tracks what's currently been added to the bubble TODO dont forget to reset these when clicking create!!!
var gasAdded = false;
var liquidAdded = false;
var otherAdded = false;


func _ready() -> void:
	
	pass # Replace with function body.

#call this when the "create bubble" button is clicked. Makes the bubble given ingrediants from bowl
func createBubble(liquid: Liquid, gas: Gas, otherObject: OtherObject) -> bubble:
	var newBubble;
	#Attack
	#HP
	#Speed
	newBubble = bubble.new();
	return newBubble;
