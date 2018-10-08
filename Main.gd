extends Control

var ganancias = 0
var items = []

func _ready():
	add_user_data()

func add_user_data():
	var user_data = load("res://DatosUsuario.tscn").instance()
	$Panel/VBox.add_child(user_data)
	items.append(user_data)
	
	user_data.connect("edit", self, "_on_edit")
	user_data.connect("delete", self, "_on_delete", [user_data])

func _on_Add_pressed():
	add_user_data()

func _on_edit():
	update_p()
	update_gc($Panel/VBox/HBox/Ganancias.text)
	
func _on_Ganancias_text_changed(new_text):
	update_gc(new_text)
	update_p()
	
func update_gc(ganancias):
	var sumatoria = 0
	
	for item in items:
		var porcentaje = float(item.get_node("HBox/PorcentajeCorrespondiente").text)
		print(porcentaje)
		
		item.get_node("HBox/GananciasCorrespondientes").text = str(porcentaje * float(ganancias) / 100)

func update_p():
	var sumatoria = 0
	
	for item in items:
		sumatoria += float(item.horas_invertidas_text)
	
	# No tiene sentido hacer cálculos si las horas
	# invertidas dan 0
	if sumatoria == 0:
		return
	
	for item in items:
		var horas = float(item.horas_invertidas_text)
		
		item.get_node("HBox/PorcentajeCorrespondiente").text = str(horas / sumatoria * 100)
		
func _on_delete(item):
	items.erase(item)