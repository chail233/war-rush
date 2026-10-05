extends Control
class_name BuildUi

signal build_tower(tower_type: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_arrow_button_pressed() -> void:
	build_tower.emit(Global.TowerType.Arrow)


func reset():
	position = Vector2(-200, -200)
	visible = false