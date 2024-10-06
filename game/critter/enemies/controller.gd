# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56CritterController
class_name LD56EnemyController

## Purpose of this script.
##
## Desription of this script.
## See https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html#bbcode-and-class-reference

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56EnemyController:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56EnemyController)
	) as LD56EnemyController

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
	
@onready var enemy : LD56Enemy = critter as LD56Enemy

#func _ready() -> void:
	#pass

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Purpose of member
#var _local := 0.0

## Makes sure we have an enemy in particular
func _get_critter(type : Variant = LD56Enemy) -> LD56Critter:
	return super(type)

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
