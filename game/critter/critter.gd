# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends CharacterBody2D
class_name LD56Critter

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

static func find_from(node: Node) -> LD56Critter:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Critter)
	) as LD56Critter

#############################################################################
# Public Interface
#############################################################################

## Speed factor for beetle.  Unit is in tiles/sec.
@export var base_speed := 1.0

## Signalled when critter starts moving
signal started_moving(critter: LD56Critter)

## Signalled when critter stops moving
signal stopped_moving(critter: LD56Critter)

## Current desired movement cirection
var movement := Vector2.ZERO

## Speed after computation -- readonly
var speed : float : get=get_speed

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

## Tracks if we were moving at the lastest physics updated
var _was_moving := false

## Begin movement.  Limited by physics for this critter.
func move(dir: Vector2) -> void:
	movement = dir
	
## Virtual function to get the speed of the critter.
func get_speed() -> float:
	return base_speed
	
## Virtal function to take action on collisions.
func on_collision():
	pass

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	var _speed := speed / _delta
	velocity = movement * _speed
	var now_moving := velocity.length() > 0
	if now_moving != _was_moving:
		_was_moving = now_moving
		if now_moving:
			started_moving.emit(self)
		else:
			stopped_moving.emit(self)
			
	if move_and_slide():
		on_collision()

#func _input(event: InputEvent) -> void:
	#pass
