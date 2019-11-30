extends Spatial

export var lap = 0

func increase_lap(s):
 lap += int(s)
 find_node("Lap").update_lap()
 if lap >= 4:
  get_tree().change_scene("res://Scenes/Win.tscn")
