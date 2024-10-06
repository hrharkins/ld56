# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Control
class_name LD56DungMeter

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56DungMeter:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56DungMeter)
	) as LD56DungMeter

#############################################################################
# Public Interface
#############################################################################

## Progrssbar control
@export var progressbar : TextureProgressBar

## Label to set to size of ball
@export var size_label : Label

## Labelk to set to points
@export var points_label : Label

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0


#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	var game := LD56Game.find_from(self)
	if game != null:
		game.dung_carried_updated.connect(update_dung_carried)


#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Updates the score label.
func update_dung_carried(dung: int, max: int, points: int) -> void:
	progressbar.value = dung
	progressbar.max_value = max
	size_label.text = "%d" % dung
	points_label.text = "%d Pts" % points

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

#func _physics_process(_delta: float) -> void:
	#pass

#func _input(event: InputEvent) -> void:
	#pass
