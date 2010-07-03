/obj/machinery/hydroponics
	name = "Hydroponics Tray"
	icon = 'hydroponics.dmi'
	icon_state = "hydrotray"
	density = 1
	anchored = 1
	var/waterlevel = 100 // The amount of water in the tray (max 100)
	var/nutrilevel = 10 // The amount of nutrient in the tray (max 10)
	var/yieldmod = 1 //Modifier to yield
	var/mutmod = 1 //Modifier to mutation chance
	var/age = 0 // Current age
	var/dead = 0 // Is it dead?
	var/health = 0 // It's health.
	var/lastproduce = 0 // Last time it was harvested
	var/lastcycle = 0 //Used for timing of cycles.
	var/cycledelay = 200 // About 10 seconds / cycle
	var/planted = 0 // Is it occupied?
	var/harvest = 0; //Ready to harvest?
	var/obj/item/seeds/myseed = null // The currently planted seed

obj/machinery/hydroponics/process()

	if(world.time > (src.lastcycle + src.cycledelay))
		src.lastcycle = world.time
		if(src.planted & !src.dead)
			src.age++
			src.waterlevel -= rand(1,6)
			if(src.nutrilevel > 0)
				src.nutrilevel -= 1
			if(src.waterlevel < 0)
				src.waterlevel = 0
			if(src.waterlevel <= 0)
				src.health -= 3
			else if(src.waterlevel <= 5)
				src.health -= 1
			if(src.waterlevel > 10 & src.nutrilevel > 0)
				src.health += 1
			if(src.health > src.myseed.endurance)
				src.health = src.myseed.endurance
			if(src.age > src.myseed.lifespan)
				src.health -= 5
			if(src.health <= 0)
				src.dead = 1
				src.harvest = 0
			if(src.age > src.myseed.production && (src.age - src.lastproduce) > src.myseed.production && (!src.harvest && !src.dead))
				var/m_count = 0
				while(m_count < src.mutmod)
					src.mutate()
					m_count++;
				if(src.yieldmod > 0)
					src.harvest = 1
				else
					src.lastproduce = src.age
		src.updateicon()
	return

obj/machinery/hydroponics/proc/updateicon()
	//Refreshes the icon
	overlays = null
	if(src.planted)
		if(dead)
			overlays += image('hydroponics.dmi', icon_state="[src.myseed.species]-dead")
		else if(src.harvest)
			overlays += image('hydroponics.dmi', icon_state="[src.myseed.species]-harvest")
		else if(src.age < src.myseed.maturation)
			var/t_growthstate = ((src.age / src.myseed.maturation) * 6)
			overlays += image('hydroponics.dmi', icon_state="[src.myseed.species]-grow[round(t_growthstate)]")
			src.lastproduce = src.age //Cheating by putting this here, it means that it isn't instantly ready to harvest
		else
			overlays += image('hydroponics.dmi', icon_state="[src.myseed.species]-grow6")

		if(src.waterlevel <= 10)
			overlays += image('hydroponics.dmi', icon_state="over_lowwater")
		if(src.nutrilevel <= 2)
			overlays += image('hydroponics.dmi', icon_state="over_lownutri")
		if(src.health <= (src.myseed.endurance / 2))
			overlays += image('hydroponics.dmi', icon_state="over_lowhealth")
		if(src.harvest)
			overlays += image('hydroponics.dmi', icon_state="over_harvest")
	return

obj/machinery/hydroponics/proc/mutate() // Mutates the current seed

	src.myseed.lifespan += rand(-2,2)
	if(src.myseed.lifespan < 10)
		src.myseed.lifespan = 10
	if(src.myseed.lifespan > 30)
		src.myseed.lifespan = 30

	src.myseed.endurance += rand(-5,5)
	if(src.myseed.endurance < 10)
		src.myseed.endurance = 10
	if(src.myseed.endurance > 100)
		src.myseed.endurance = 100

	src.myseed.production += rand(-1,1)
	if(src.myseed.production < 2)
		src.myseed.production = 2
	if(src.myseed.production > 10)
		src.myseed.production = 10

	src.myseed.yield += rand(-2,2)
	if(src.myseed.yield < 0)
		src.myseed.yield = 0
	if(src.myseed.yield > 10)
		src.myseed.yield = 10

	if(src.myseed.potency != -1) //Not all plants have a potency
		src.myseed.potency += rand(-10,10)
		if(src.myseed.potency < 0)
			src.myseed.potency = 0
		if(src.myseed.potency > 100)
			src.myseed.potency = 100

obj/machinery/hydroponics/attackby(var/obj/item/O as obj, var/mob/user as mob)

	//Called when mob user "attacks" it with object O
	if (istype(O, /obj/item/weapon/reagent_containers/glass/bucket))
		var/b_amount = O.reagents.get_reagent_amount("water")
		if(b_amount > 0 && src.waterlevel < 100)
			if(b_amount + src.waterlevel > 100)
				b_amount = 100 - src.waterlevel
			O.reagents.remove_reagent("water", b_amount)
			src.waterlevel += b_amount
			playsound(src.loc, 'slosh.ogg', 25, 1)
			user << "You fill the tray with [b_amount] units of water."
		else if(src.waterlevel >= 100)
			user << "\red The hydroponics tray is already full."
		else
			user << "\red The bucket is not filled with water."
		src.updateicon()
	else if ( istype(O, /obj/item/nutrient/) )
		var/obj/item/nutrient/myNut = O
		user.u_equip(O)
		src.nutrilevel = 10
		src.yieldmod = myNut.yieldmod
		src.mutmod = myNut.mutmod
		user << "You replace the nutrient solution in the tray"
		del(O)
		src.updateicon()
	else if (istype(O, /obj/item/seeds/))
		if(!src.planted)
			user.u_equip(O)
			user << "You plant the [O.name]"
			src.dead = 0
			src.myseed = O
			src.planted = 1
			src.age = 1
			src.health = src.myseed.endurance
			src.lastcycle = world.time
			O.loc = src
			if((user.client  && user.s_active != src))
				user.client.screen -= O
			O.dropped(user)
			src.updateicon()
		else
			user << "\red The tray already has a seed in it!"

	return

/obj/machinery/hydroponics/attack_hand(mob/user as mob)
	if(src.harvest)
		var/item = text2path(src.myseed.productname)
		var/t_amount = 0

		while ( t_amount < (src.myseed.yield * src.yieldmod ))
			var/obj/item/weapon/reagent_containers/food/snacks/grown/t_prod = new item(user.loc)
			t_prod.seed = src.myseed.mypath
			t_prod.species = src.myseed.species
			t_prod.lifespan = src.myseed.lifespan
			t_prod.endurance = src.myseed.endurance
			t_prod.maturation = src.myseed.maturation
			t_prod.production = src.myseed.production
			t_prod.yield = src.myseed.yield
			t_prod.potency = src.myseed.potency
			t_amount++
		src.harvest = 0
		src.lastproduce = src.age
		if((src.yieldmod * src.myseed.yield) <= 0)
			usr << text("\red You fail to harvest anything useful")
		else
			usr << text("You harvest from the [src.myseed.plantname]")
			if(src.myseed.oneharvest)
				src.planted = 0
				src.dead = 0
		src.updateicon()
	else if(src.dead)
		src.planted = 0
		src.dead = 0
		usr << text("You remove the dead plant from the tray")
		del(src.myseed)
		src.updateicon()
	else
		if(src.planted && !src.dead)
			usr << text("The hydroponics tray has a [src.myseed.plantname] planted")
			if(src.health <= (src.myseed.endurance / 2))
				usr << text("The plant looks unhealthy")
		else
			usr << text("The hydroponics tray is empty")
		usr << text("Water: [src.waterlevel]/100")
		usr << text("Nutrient: [src.nutrilevel]/10")