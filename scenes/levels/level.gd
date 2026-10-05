extends Node2D
@onready var curve: Curve2D = $Paths/Path1.get_curve()
@onready var start_pos:Vector2 = curve.sample_baked( 0.0)
@onready var tower_bases := $Map/TowerBases
@onready var BuildUI:BuildUi = $UI/BuildUI
@onready var entities := $Entities

var current_base: TowerBase


var EnemyScene := preload("res://scenes/Enemy/enemy.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for tb in tower_bases.get_children():
		tb.click.connect(_on_TB_click)
	generate_enemy()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func generate_enemy():
	var enemy:Enemy = EnemyScene.instantiate()
	enemy.position = start_pos
	enemy.path = $Paths/Path1
	enemy.curve = curve
	entities.add_child(enemy)
	
func  _on_TB_click(TB:TowerBase):
	if BuildUI.position != TB.position:
		BuildUI.position = TB.position
		BuildUI.visible = true
		current_base = TB
	else:
		BuildUI.reset()
		current_base = null


func _on_build_ui_build_tower(tower_type: int) -> void:
	if current_base:
		BuildUI.reset()
		current_base.queue_free()
