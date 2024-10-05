# Copyright (c) 2024 Rich Harkins.  All Rights Reserved.
extends LD56Critter
class_name LD56Beetle

## Represents the player.

#############################################################################
# Public Interface
#############################################################################

## Node that will carry dung
@export var dung_carrier_node : Node

## Description of signal
#signal mysignal()

## Current dungball in mandables or null if one isn't there.
var dungball : LD56Dungball

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
	if dungball == null:
		dung.reparent(self.dung_carrier_node)
		dung.owner = self
		dungball = dung
	elif dungball.add_dung(dung):
		dung.get_parent().remove_child(dung)

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
	if area is LD56Dungball:
		call_deferred("integrate_dung", area)
