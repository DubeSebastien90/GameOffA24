randomize()

bobber_size = 40
icon_size = 8
jauge_size = 128

//bobber
acc = 0
grav = 0.12
vspd = 0

//icon
min_pos = 16
max_pos = 16+jauge_size-icon_size
y_dir = 16+(jauge_size/2)-(icon_size/2)
cooldown_dir = 10

//temps
win_condition = 60*10
temps_rendu = 60*4

//animation
cle_x = 0
cle_y = 0
cle_x_dir = 0
cle_y_dir = 0
buff = 0.1

fin = -1
cooldown_fin = 90

my_bobber = instance_create_depth(40,16+jauge_size-bobber_size,depth-1,obj_bobber)
my_icon = instance_create_depth(40,16+(jauge_size/2)-(icon_size/2),depth-2,obj_cle_icon)