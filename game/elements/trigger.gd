# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Area2D
class_name LD56Trigger

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Trigger:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Trigger)
	) as LD56Trigger

#############################################################################
# Public Interface
#############################################################################

## Node that receives the method call.
@export var type : Script

## Description of signal
signal triggered(source)

## Purpose of variable
#var myvar := 0.0


#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	area_entered.connect(_on_collision)
	body_entered.connect(_on_collision)

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Purpose of method
func _on_collision(other) -> void:
	if is_instance_of(other, type):
		triggered.emit(other)

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
