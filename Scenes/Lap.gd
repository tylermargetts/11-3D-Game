extends Label

var lap = 0

func _ready():
 update_lap()

func update_lap():
 text = "Lap: " + str(lap)