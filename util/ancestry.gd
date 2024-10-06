# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends Object
class_name LD56Ancestry

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

## Returns an ancestor based on a parent type.
static func find_ancestor_of(descendant: Node, type: Variant) -> Variant:
	while descendant != null and not is_instance_of(descendant, type):
		descendant = descendant.get_parent()
	return descendant

#############################################################################
# Initialization
#############################################################################

#func constructor():
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
