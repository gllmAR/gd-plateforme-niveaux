extends Node

@export var monnaies = 0
signal monnaie_collectee

signal cle_collectee

func debloquer_cle(groupe_cle):
	cle_collectee.emit(groupe_cle)


func augmenter_monnaies():
	monnaies += 1
	monnaie_collectee.emit(monnaies)

func changer_scene(nouvelle_scene:PackedScene):
	if not nouvelle_scene:
		var path = "<null>"
		if typeof(nouvelle_scene) == TYPE_OBJECT and nouvelle_scene and nouvelle_scene.has_method("resource_path"):
			path = nouvelle_scene.resource_path
		push_warning("Main.changer_scene called with null/invalid nouvelle_scene; aborting scene change. resource_path=%s" % path)
		return
	print("changer scene -> %s" % str(nouvelle_scene))
	get_tree().call_deferred("change_scene_to_packed", nouvelle_scene)
