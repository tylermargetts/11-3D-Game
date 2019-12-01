extends CollisionShape

var lap = 0
signal inclap

func _ready():
	var WorldNode = get_node("/root/World")
	connect("inclap", WorldNode, "increase_lap")
	
func _physics_process(delta):
	var bodies = .Get_Colliding_Bodies()
	for body in bodies:
		if body.is_in_group("Lines"):
			emit_signal("inclap")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
