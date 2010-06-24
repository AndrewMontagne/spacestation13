/obj/item/seeds
	name = "seed"
	icon = 'seeds.dmi'
	icon_state = "seed"
	flags = FPRINT |  TABLEPASS
	var/plantname = ""
	var/productname = ""
	var/lifespan = 0
	var/endurance = 0
	var/maturation = 0
	var/production = 0
	var/yield = 0
	var/potency = -1

/obj/item/seeds/chiliseed
	name = "chili seed"
	icon_state = "seed1"
	plantname = "Chili"
	productname = "/obj/item/weapon/reagent_containers/food/snacks/chili"
	lifespan = 10
	endurance = 10
	maturation = 5
	production = 5
	yield = 4
	potency = 0

/obj/item/seeds/eggplantseed
	name = "eggplant seed"
	icon_state = "seed2"
	plantname = "Eggplant"
	productname = "/obj/item/weapon/reagent_containers/food/snacks/egg"
	lifespan = 10
	endurance = 10
	maturation = 5
	production = 5
	yield = 4