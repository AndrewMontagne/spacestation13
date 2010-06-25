/obj/item/seeds
	name = "seed"
	icon = 'hydroponics.dmi'
	icon_state = "seed"
	flags = FPRINT |  TABLEPASS
	var/mypath = "/obj/item/seeds"
	var/plantname = ""
	var/productname = ""
	var/species = ""
	var/lifespan = 0
	var/endurance = 0
	var/maturation = 0
	var/production = 0
	var/yield = 0
	var/potency = -1

/obj/item/seeds/chiliseed
	name = "chili plant seeds"
	icon_state = "seed-chili"
	mypath = "/obj/item/seeds/chiliseed"
	species = "chili"
	plantname = "chili plant"
	productname = "/obj/item/weapon/reagent_containers/food/snacks/grown/chili"
	lifespan = 10
	endurance = 10
	maturation = 5
	production = 5
	yield = 4
	potency = 0

/obj/item/seeds/berryseed
	name = "berry seeds"
	icon_state = "seed-berry"
	mypath = "/obj/item/seeds/berryseed"
	species = "berry"
	plantname = "berry bush"
	productname = "/obj/item/weapon/reagent_containers/food/snacks/grown/berries"
	lifespan = 10
	endurance = 10
	maturation = 6
	production = 5
	yield = 4