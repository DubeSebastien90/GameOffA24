rot += rotSpeed

spd -= 0.003

x += (dcos(dir)*spd) 
y += (-dsin(dir)*spd)

if spd < 0.05{
	image_alpha = lerp(image_alpha,0,0.1)
	if image_alpha < 0.1{
		instance_destroy()
	}
}
