# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Node
class_name BeetleInput

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

#############################################################################
# Public Interface
#############################################################################

## Description of export
@export var up_input := "ui_up"

## Description of signal
#@signal signal mysignal()

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

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(delta: float) -> void:
	#pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed(up_input):
		print_debug("here")

#func _input(event: InputEvent) -> void:
	#pass
