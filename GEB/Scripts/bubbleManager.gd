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

#RNG
var random = RandomNumberGenerator.new();
var statUpperLimit = 15;
var radiusUpperLimit = 90;

func _ready():
	
	pass # Replace with function body.

#call this when the "create" button is clicked. 
#since the creater already modifies the "new bubble", we have the new bubble already made
#add the new bubble and store it into the list of bubbles at hand; 
#reset the newBubble variable to a fresh bubble
func createBubble():
	#TODO: do we want to check and make sure the player has added one of each type?
	newBubble.playerCreated = true;
	#store the bubble into the list of bubbles we have on hand
	bubbles.push_back(newBubble);
	#resets trackers of what's been added
	resetBubble();
	
#resets the newBubble object.
func resetBubble():
	#clear the bubble
	newBubble = bubble.new();
	gasAdded = false;
	liquidAdded = false;
	otherAdded = false;
	#garbage collector should be able to sweep up the "used" bubble later
	
#creates a bubble via rng and adds to the list of bubbles
func createEnemyBubble():
	var atk = random.randi() % statUpperLimit + 1;
	var hp = random.randi() % statUpperLimit + 1;
	var spd_mult = random.randi() % statUpperLimit + 1;
	var radius = random.randi() % radiusUpperLimit + 30;
	var enemyBubble = bubble.new(hp, spd_mult, atk, radius);
	bubbles.push_back(enemyBubble);
	
#call this function when the match is over
func clearBubbles():
	var winningBubble;
	
	#loop through all the bubbles to find the one marked as a winner
	#seems silly since currently it is just 1 v 1 bubble duels, 
	#however this is in consideration if we make it to battle royale implementation
	for b in bubbles.size():
		if(bubbles[b].winner):
			winningBubble = bubbles[b];
	
	#reset the winning bubble. 
	#If the player made this bubble, it is no longer theirs
	winningBubble.playerCreated = false;
	winningBubble.winner = false;
	#clear the bubbles list
	bubbles = [];
	#add back the winning bubble
	bubbles.push_back(winningBubble);
