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

func _ready() -> void:
	waterBowl = get_node("waterBowl");
	paintBowl = get_node("paintBowl");
	soapBowl = get_node("soapBowl");
	xenonBowl = get_node("xenonBowl");
	oxygenBowl = get_node("oxygenBowl");
	heliumBowl = get_node("heliumBowl");
	pass

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	#determines what to update in manager based on held object
	#I apologize for the if statements this is gonna be messy
	#Flat adding to the stats so resetting is easier
	if BubbleManager.currentObject == "xenon" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.newBubble.spd_mult = 6;
		xenonBowl.visible = true;
	
	if BubbleManager.currentObject == "oxygen" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.newBubble.spd_mult = 8;
		oxygenBowl.visible = true;
	
	if BubbleManager.currentObject == "helium" && !BubbleManager.gasAdded:
		BubbleManager.gasAdded = true;
		BubbleManager.newBubble.spd_mult = 10;
		heliumBowl.visible = true;
	
	if BubbleManager.currentObject == "water" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.newBubble.hp = 6;
		waterBowl.visible = true;
	
	if BubbleManager.currentObject == "paint" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.newBubble.hp = 8;
		paintBowl.visible = true;
	
	if BubbleManager.currentObject == "soap" && !BubbleManager.liquidAdded:
		BubbleManager.liquidAdded = true;
		BubbleManager.newBubble.hp = 10;
		soapBowl.visible = true;
	
	if BubbleManager.currentObject == "tadpoles" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.newBubble.atk = 2;
	
	if BubbleManager.currentObject == "glitter" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.newBubble.atk = 3;
	
	if BubbleManager.currentObject == "knife" && !BubbleManager.otherAdded:
		BubbleManager.otherAdded = true;
		BubbleManager.newBubble.atk = 4;
	
	
	
