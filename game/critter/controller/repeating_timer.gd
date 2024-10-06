# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56CritterController
class_name LD56RepeatingTimer

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56RepeatingTimer:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56RepeatingTimer)
	) as LD56RepeatingTimer

#############################################################################
# Public Interface
#############################################################################

## Period to trigger signal
@export var after := 3.0

## Random pause period beyond "after"
@export var random_after := 0.0

## Enablement
@export var enabled := true

## Restart
@export var auto_restart := true

## Triggered on repeat
signal timeout()

## Purpose of variable
#var myvar := 0.0

## Restarts the timer.
func restart(offset := 0.0) -> void:
	_remaining = after + random_after * randf() + offset

## Triggers the timeout and restarts
func trigger(offset := 0.0) -> void:
	timeout.emit()
	restart(offset)

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	restart()

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
var _remaining := 0.0

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

func _physics_process(delta: float) -> void:
	if enabled:
		_remaining -= delta
		if _remaining < 0:
			trigger(_remaining)

#func _input(event: InputEvent) -> void:
	#pass
