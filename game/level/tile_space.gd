# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Node2D
class_name LD56TileSpace

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56TileSpace:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56TileSpace)
	) as LD56TileSpace

#############################################################################
# Public Interface
#############################################################################

## The elements tile map to return dung to
@export var elements_map : TileMapLayer

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0

## Accept a dungball (returns it to the elements layer)
func accept_dungball(ball: LD56Dungball) -> void:
	ball.reparent(elements_map)
	
func dung_remaining() -> int:
	var remaining := 0
	for child in elements_map.get_children():
		if child is LD56Dungball:
			remaining += child.size
	return remaining

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

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

#func _physics_process(_delta: float) -> void:
	#pass

#func _input(event: InputEvent) -> void:
	#pass
