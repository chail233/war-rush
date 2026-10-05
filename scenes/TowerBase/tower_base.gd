extends Node2D
class_name TowerBase

@onready var area := $Area2D
var index:int

signal click(TB)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	$HighLight.visible = true



func _on_area_2d_mouse_exited() -> void:
	$HighLight.visible = false



func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		click.emit(self)
