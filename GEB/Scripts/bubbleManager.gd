extends Node

#tracks the current held object
#this is here exclusively because I'm fighting for my life with signals and I don't have the time for that
#this approach would NOT get a good grade for coding standards my bad
var currentObject = "none";

#tracks what's currently been added to the bubble TODO dont forget to reset these when clicking create!!!
var gasAdded = false;
var liquidAdded = false;
var otherAdded = false;

#variables for the bubble currently being created
var health1 = 5;
var speed1 = 5;
var attack1 = 2;

#variables for the stored opponent bubble
var health2 = 5;
var speed2 = 5;
var attack2 = 2;
