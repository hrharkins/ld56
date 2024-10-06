# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Node
class_name LD56CritterController

## Controls a critter in some way.  Added as a node of the criter.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56CritterController:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56CritterController)
	) as LD56CritterController

#############################################################################
# Public Interface
#############################################################################

# Description of export
@export var critter_override : LD56Critter

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0


#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
## Crtitter being controlled
@onready var critter : LD56Critter = _get_critter()

#func _ready() -> void:
	#pass

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Determines the critter of interest
func _get_critter(type : Variant = LD56Critter) -> LD56Critter:
	if critter_override:
		return critter_override
	else:
		return LD56Ancestry.find_ancestor_of(self, type) as LD56Critter

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
