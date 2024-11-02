/// @description Insert description here
// You can write your code in this editor


x += sign(image_xscale) * spd;
//y += cote[1] * spd;

if y > 160 or y < -100 or x < -50 or x > 320 {

	instance_destroy();
}
temps += 5
image_angle = dsin(temps)*5

if hp <= 0{
	obj_canards_controller.nb_fed += 1
	instance_destroy()
}