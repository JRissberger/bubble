extends Sprite2D
#gets a reference to all the bowl sprites
var waterBowl;
var paintBowl;
var soapBowl;
var xenonBowl;
var oxygenBowl;
var heliumBowl;
var tadpoleBowl;
var glitterBowl;
var knifeBowl;
var bowlImages;

func _ready() -> void:
	waterBowl = get_node("waterBowl")
	paintBowl = get_node("paintBowl");
	soapBowl = get_node("soapBowl");
	xenonBowl = get_node("xenonBowl");
	oxygenBowl = get_node("oxygenBowl");
	heliumBowl = get_node("heliumBowl");
	bowlImages = [waterBowl, paintBowl, soapBowl, xenonBowl, oxygenBowl, heliumBowl];
	pass

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#determines what to update in manager based on held object
	#I apologize for the if statements this is gonna be messy
	#Flat adding to the stats so resetting is easier
	if BubbleManager.currentObject == "xenon" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.newBubble.Spd_mult = 6;
		xenonBowl.visible = true;
	
	if BubbleManager.currentObject == "oxygen" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.newBubble.Spd_mult = 8;
		oxygenBowl.visible = true;
	
	if BubbleManager.currentObject == "helium" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.newBubble.Spd_mult = 10;
		heliumBowl.visible = true;
	
	if BubbleManager.currentObject == "water" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.newBubble.Hp = 6;
		waterBowl.visible = true;
	
	if BubbleManager.currentObject == "paint" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.newBubble.Hp = 8;
		paintBowl.visible = true;
	
	if BubbleManager.currentObject == "soap" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.newBubble.Hp = 10;
		soapBowl.visible = true;
	
	if BubbleManager.currentObject == "tadpoles" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.newBubble.Atk = 2;
	
	if BubbleManager.currentObject == "glitter" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.newBubble.Atk = 3;
	
	if BubbleManager.currentObject == "knife" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.newBubble.atk = 4;
	
#clears all ingredients in the bowl. Could make this less 
#expensive by storing what ingredients have been added to the bown
func clearBowl():
	waterBowl.visible = false;
	paintBowl.visible = false;
	soapBowl.visible = false;
	xenonBowl.visible = false;
	oxygenBowl.visible = false;
	heliumBowl.visible = false;
	#TODO uncomment out when these sprites are implemented
	#tadpoleBowl.visible = false;
	#glitterBowl.visible = false;
	#knifeBowl.visible = false;
	

#resets all visible objects (does this regardless of reset or create being made)
func _on_button_pressed() -> void:
	for i in 6:
		bowlImages[i].visible = false;
	BubbleManager.otherAdded = false;
	BubbleManager.liquidAdded = false;
	BubbleManager.gasAdded = false;
	pass # Replace with function body.
