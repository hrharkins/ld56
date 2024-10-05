# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Node
class_name LD56BeetleInput

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

#############################################################################
# Public Interface
#############################################################################

## Description of export
@export var input_config := LD56InputConfig.new()

## Sent when input movement state changes
signal movement(dir: Vector2)

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

var _velocity := Vector2.ZERO

#func _process(delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	var config := input_config
	var velocity := Input.get_vector(
		config.left, config.right,
		config.up, config.down
	)
	if velocity != _velocity:
		_velocity = velocity
		movement.emit(velocity)

#func _input(event: InputEvent) -> void:
	#pass
