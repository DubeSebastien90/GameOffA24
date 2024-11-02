press_left = keyboard_check(vk_left)
press_right = keyboard_check(vk_right)

if press_left{
	direction += 0.6
}
if press_right{
	direction -= 0.6
}


image_angle = direction