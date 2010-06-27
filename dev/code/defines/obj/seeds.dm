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
	lifespan = 20
	endurance = 15
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
	lifespan = 20
	endurance = 15
	maturation = 6
	production = 5
	yield = 1

/obj/item/seeds/eggplantseed
	name = "eggplant seeds"
	icon_state = "seed-eggplant"
	mypath = "/obj/item/seeds/eggplantseed"
	species = "eggplant"
	plantname = "eggplant plant"
	productname = "/obj/item/weapon/reagent_containers/food/snacks/grown/eggplant"
	lifespan = 25
	endurance = 15
	maturation = 6
	production = 6
	yield = 2

/obj/item/seeds/icepepperseed
	name = "ice pepper seeds"
	icon_state = "seed-icepepper"
	mypath = "/obj/item/seeds/icepepperseed"
	species = "pepper"
	plantname = "ice pepper plant"
	productname = "/obj/item/weapon/reagent_containers/food/snacks/grown/icepepper"
	lifespan = 25
	endurance = 15
	maturation = 4
	production = 4
	yield = 4
	potency = 0