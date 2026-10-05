extends Area2D
class_name Enemy


var path:Path2D
var curve: Curve2D
var speed := 100
var progress := 0.0
var direction := Vector2.ZERO

var health := 100




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	$AnimatedSprite2D.flip_h = direction.x < 0




func _physics_process(delta: float) -> void:
	if path:
		progress += speed * delta
		global_position = curve.sample_baked(progress)
		var next_position: Vector2 = curve.sample_baked(progress+0.01)
		direction = (next_position - global_position).normalized()
