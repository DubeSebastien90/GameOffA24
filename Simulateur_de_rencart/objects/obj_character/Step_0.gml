press_left = keyboard_check_pressed(vk_left);
press_right = keyboard_check_pressed(vk_right);
press_down = keyboard_check_pressed(vk_down);
press_up = keyboard_check_pressed(vk_up);



if (place_meeting(x, y, obj_car)) {
	if obj_crossyroad_controller.mort = false{
		obj_crossyroad_controller.mort = true
		control = false
	}
}

if (obj_crossyroad_controller.level == 1) {
	if (place_meeting(obj_eve.x, obj_eve.y, obj_car)) {
		if obj_crossyroad_controller.mort = false{
			obj_crossyroad_controller.mort = true
			control = false
		}
	}
}

if control{
if press_up {
	if (!place_meeting(x_future, y_future - case_size, obj_wall) and !place_meeting(x_future, y_future - case_size, obj_eve)) {
		x_prev = x_future;
		y_prev = y_future;
		y_future -= case_size;
		
	} 
}

if press_down {
	if (!place_meeting(x_future, y_future + case_size, obj_wall) and !place_meeting(x_future, y_future + case_size, obj_eve)) {
		x_prev = x_future;
		y_prev = y_future;
		y_future += case_size;
	} 
}

if press_left {
	if (!place_meeting(x_future - case_size, y_future, obj_wall) and !place_meeting(x_future - case_size, y_future, obj_eve)) {
		x_prev = x_future;
		y_prev = y_future;
		x_future -= case_size;
	} 
}

if press_right {
	if (!place_meeting(x_future + case_size, y_future, obj_wall) and !place_meeting(x_future + case_size, y_future, obj_eve)) {
		x_prev = x_future;
		y_prev = y_future;
		x_future += case_size;
	} 
}
}

x = lerp(x, x_future, 0.3);
y = lerp(y, y_future, 0.3);

if (obj_crossyroad_controller.level == 1) {
	obj_eve.x = lerp(obj_eve.x, x_prev, 0.3);
	obj_eve.y = lerp(obj_eve.y, y_prev, 0.3);
}

if obj_crossyroad_controller.level == 0{
	if (place_meeting(x, y, obj_objectif)) {
		if obj_crossyroad_controller.succes = false{
			obj_crossyroad_controller.succes = true
			control = false
		}
	}
} else{
	if (place_meeting(x, y, obj_objectif) && place_meeting(obj_eve.x,obj_eve.y,obj_objectif)) {
		if obj_crossyroad_controller.succes = false{
			obj_crossyroad_controller.succes = true
			control = false
		}
	}
}