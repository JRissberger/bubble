extends Node

var newBubble = bubble.new();
var opponentBubble = bubble.new();
#tracks the current held object
#this is here exclusively because I'm fighting for my life with signals and I don't have the time for that
#this approach would NOT get a good grade for coding standards my bad
var currentObject = "none";

#where all of the bubble objects will be stored
var bubbles = [];

#tracks what's currently been added to the bubble
var gasAdded = false;
var liquidAdded = false;
var otherAdded = false;


func _ready():
	
	pass # Replace with function body.

#call this when the "create" button is clicked. 
#since the creater already modifies the "new bubble", we have the new bubble already made
#add the new bubble and store it into the list of bubbles at hand; 
#reset the newBubble variable to a fresh bubble
func createBubble():
	#resets trackers of what's been added
	#TODO: do we want to check and make sure the player has added one of each type?
	var gasAdded = false;
	var liquidAdded = false;
	var otherAdded = false;
	#store the bubble into the list of bubbles we have on hand
	bubbles.push_back(newBubble);
	resetBubble();
	
#resets the newBubble object.
func resetBubble():
	#clear the bubble
	newBubble = bubble.new();
	#garbage collector should be able to sweep up the "used" bubble later
