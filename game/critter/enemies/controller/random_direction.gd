# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56EnemyController
class_name LD56RandomDirection

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56RandomDirection:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56RandomDirection)
	) as LD56RandomDirection

#############################################################################
# Public Interface
#############################################################################

## Directional Choices
@export var choices : Array[Vector2] = [
	Vector2.UP,
	Vector2.DOWN, 
	Vector2.LEFT,
	Vector2.RIGHT
]
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
	
func _ready() -> void:
	pick_direction()

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Picks a new direction to go
func pick_direction() -> void:
	critter.move(choices.pick_random())

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
