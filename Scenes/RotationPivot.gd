extends Spatial

var mouse_sensitivity = 0.002 
onready var camera = $RotationPivot/Camera
onready var rotation_helper = $RotationPivot

func _unhandled_input(event):
    if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
        rotation_helper.rotate_x(-event.relative.y * mouse_sensitivity)
        rotate_y(-event.relative.x * mouse_sensitivity)
        rotation_helper.rotation.x = clamp(rotation_helper.rotation.x, -1.2, 1.2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
