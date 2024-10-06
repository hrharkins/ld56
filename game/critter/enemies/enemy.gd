# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56Critter
class_name LD56Enemy

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Enemy:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Enemy)
	) as LD56Enemy

#############################################################################
# Public Interface
#############################################################################

## Description of export
#@export var myexport := 0

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0

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

## Purpose of method
#func method() -> void:
	#pass

## Purpose of inner class
#class MyClass:
	#pass
	
## Overload to adjust speed stat
#func get_speed() -> float:
	#var speed := super()
	#return speed

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

#func _physics_process(_delta: float) -> void:
	#super(_delta)

#func _input(event: InputEvent) -> void:
	#pass
	
