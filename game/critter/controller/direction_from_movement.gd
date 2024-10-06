# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56CritterController
class_name LD56DirectionFromMovement

## Provides fluid facing by movement "direction".

static func find_from(node: Node) -> LD56DirectionFromMovement:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56DirectionFromMovement)
	) as LD56DirectionFromMovement

#############################################################################
# Public Interface
#############################################################################

## Max rate of rotation (in turns/sec).  1 = facing change in 1/4 second.
@export var rotation_rate := 4.0

## Description of signal
#signal mysignal()

## Purpose of variable
#var myvar := 0.0

#############################################################################
# Initialization
#############################################################################

#func constructor():
	#pass
	
func _ready() -> void:
	if critter == null:
		push_warning("No moveable configured for %s" % self)

#############################################################################
# Private/protected members, methods, and inner classes.
#############################################################################

## Direction moving toward
var _toward := 0.0

## Purpose of method
#func method() -> void:
	#pass

## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	if critter != null:
		var movement := critter.movement
		if movement != Vector2.ZERO:
			# The angle we get seems to be 90 degrees offset from the 
			# angfle acquired by the motion vector.  Also, the desird
			# angle needs to be expressed in -PI - PI terms or spinning
			# happens with move_toward() below.
			_toward = movement.angle() + PI/2
			if _toward >= PI:
				_toward -= PI * 2

		var facing := critter.rotation
		if facing != _toward:
			critter.rotation = move_toward(facing, _toward, rotation_rate * PI * _delta)

#func _input(event: InputEvent) -> void:
	#pass
