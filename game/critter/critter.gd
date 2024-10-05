# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends CharacterBody2D
class_name LD56Critter

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

#############################################################################
# Public Interface
#############################################################################

## Speed factor for beetle.  Unit is in tiles/sec.
@export var base_speed := 1.0

## Description of signal
#@signal signal mysignal()

## Current desired movement cirection
var movement := Vector2.ZERO

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

## Begin movement.  Limited by physics for this critter.
func move(dir: Vector2) -> void:
	movement = dir
	
## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	var speed := base_speed / _delta
	velocity = movement * speed
	move_and_slide()

#func _input(event: InputEvent) -> void:
	#pass
