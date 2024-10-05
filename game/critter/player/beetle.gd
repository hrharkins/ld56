# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56Critter
class_name LD56Beetle

## Represents the player.

## Locates this class in the node tree based on a descendant.
static func find_from(node: Node) -> LD56Beetle:
	return (
		LD56Ancestry.find_ancestor_of(node, LD56Beetle)
	) as LD56Beetle

#############################################################################
# Public Interface
#############################################################################

## Node that will carry dung
@export var dung_carrier_node : Node

## Percent impact to speed when fully laden
@export var fully_laden_pct := 60.0

## Description of signal
#signal mysignal()

## Current dungball in mandables or null if one isn't there.
var dungball : LD56Dungball

## Drop the ball
func drop_ball() -> LD56Dungball:
	var ball := dungball
	dung_carrier_node.remove_child(ball)
	dungball = null
	return ball

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

## Try to incorporate a new dungball into the current one, grabbing the new
## one if we don't have one already.
func integrate_dung(dung: LD56Dungball) -> void:
	if dung == dungball:
		return
	elif dungball == null:
		dung.reparent(self.dung_carrier_node)
		dung.position = Vector2.ZERO
		dungball = dung
		print_debug(dungball)
	elif dungball.add_dung(dung):
		dung.queue_free()
	else:
		push_warning("Cannot add dung")
		
# Computes the beetle's current speed.
func get_speed() -> float:
	var _speed := super()
	if dungball != null:
		_speed *= 1.0 - (
			(fully_laden_pct / 100.0) 
			* (dungball.size * 1.0 / dungball.max_size)
		)
	return _speed
	
## Purpose of inner class
#class MyClass:
	#pass

#############################################################################
# Event processing, signal handlers
#############################################################################

#func _process(_delta: float) -> void:
	#pass

func _physics_process(_delta: float) -> void:
	super(_delta)

#func _input(event: InputEvent) -> void:
	#pass
	
func _on_item_sense_area_entered(area: Area2D) -> void:
	if area is LD56Element:
		area.call_deferred("interact_with_beetle_ball", self)
