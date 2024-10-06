# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56CritterController
class_name LD56OnWallHit

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56OnWallHit:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56OnWallHit)
	) as LD56OnWallHit

#############################################################################
# Public Interface
#############################################################################

## Minimum time between triggers
@export var hysterisis := 2

## Description of signal
signal wall_hit()

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

## Time remaining to wait before retriggering
var _wait_time := 0.0

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

func _physics_process(_delta: float) -> void:
	if _wait_time > 0:
		_wait_time -= _delta
	else:
		if critter.is_on_wall():
			_wait_time = hysterisis
			wall_hit.emit()

#func _input(event: InputEvent) -> void:
	#pass
