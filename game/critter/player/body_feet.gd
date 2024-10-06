# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends AnimatedSprite2D
class_name LD56BodyFeet

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

static func find_from(node: Node) -> LD56BodyFeet:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56BodyFeet)
	) as LD56BodyFeet

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

## Handles start of motion
func started_moving() -> void:
	play()
	
func stopped_moving() -> void:
	pause()

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


func _on_beetle_started_moving(_critter: LD56Critter) -> void:
	started_moving()

func _on_beetle_stopped_moving(_critter: LD56Critter) -> void:
	stopped_moving()
