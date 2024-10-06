# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Node2D
class_name LD56Element

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

static func find_from(node: Node) -> LD56Element:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Element)
	) as LD56Element

#############################################################################
# Public Interface
#############################################################################

## Description of export
#@export var myexport := 0

## Description of signal
#signal mysignal()

## Purpose of variable
#var is_mobile := false

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
#func _ready() -> void:
	#pass

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0


## Called when player's item area interactw with this element.
func interact_with_beetle_ball(_beetle: LD56Beetle) -> void:
	pass
	
func interact_with_beetle_mouth(_beetle: LD56Beetle) -> void:
	pass

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
