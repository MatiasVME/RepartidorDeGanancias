extends Control

signal edit
signal delete

var horas_invertidas_text = 0

func _on_Remove_pressed():
	emit_signal("delete")
	queue_free()

func _on_HorasInvertidas_text_changed(new_text):
	horas_invertidas_text = new_text
	emit_signal("edit")
	print("HorasInvertidas: ", horas_invertidas_text)
