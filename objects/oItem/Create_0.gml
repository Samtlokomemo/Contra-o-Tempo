//Sem armas
itens[0] = ds_map_create()
ds_map_add(itens[0], "sprite", -1)
ds_map_add(itens[0], "projectile", -1)
ds_map_add(itens[0], "projspd", 0)
ds_map_add(itens[0], "projdmg", 0)
ds_map_add(itens[0], "projdelay", 0)
ds_map_add(itens[0], "automatic", false)

//Arco
itens[1] = ds_map_create()
ds_map_add(itens[1], "sprite", sArco)
ds_map_add(itens[1], "projectile", sProjectile)
ds_map_add(itens[1], "projspd", 8)
ds_map_add(itens[1], "projdmg", 3)
ds_map_add(itens[1], "projdelay", 30)

//Lança
itens[2] = ds_map_create()
ds_map_add(itens[2], "sprite", sLanca)
ds_map_add(itens[2], "projectile", sLanca)
ds_map_add(itens[2], "projspd", 8)
ds_map_add(itens[2], "projdmg", 3)
ds_map_add(itens[2], "projdelay", 60 * 1)

itemId = -1
itemDir = -1
itemX = 0
itemY = 0
canAttack = true

changeItem(self, 2)
