# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Label
class_name LD56ValueDisplay

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56ValueDisplay:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56ValueDisplay)
	) as LD56ValueDisplay

#############################################################################
# Public Interface
#############################################################################

## Description of export
@export var signal_name : String

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
		game.connect(signal_name, update_value, CONNECT_DEFERRED)

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Updates the score label.
func update_value(value: int) -> void:
	text = str(value)

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
