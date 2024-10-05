# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56Element
class_name LD56Hole

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

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

## Delegates beetle dropping the ball into the hole.
func interact_with_beetle_ball(beetle: LD56Beetle) -> void:
	super(beetle)
	var ball := beetle.drop_ball()
	if ball != null:
		LD56Game.find_from(self).add_score(ball.size * ball.size)
		ball.queue_free()

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
