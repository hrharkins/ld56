# meta-default: true
extends _BASE_
class_name _CLASS_

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
	move_and_slide()

#func _input(event: InputEvent) -> void:
	#pass
