obj/machinery/hydroponics/process()

	if(world.time > (src.lastcycle + src.cycledelay))
		src.lastcycle = world.time

	src.waterlevel -= rand(1,6)
	if(src.waterlevel < 0)
		src.waterlevel = 0

	src.updateicon()

	return

obj/machinery/hydroponics/proc/updateicon()
	//Refreshes the icon
	overlays = null
	if(src.active)
		if(src.waterlevel <= 10)
			overlays += image('hydroponics.dmi', icon_state="over_lowwater")

obj/machinery/hydroponics/attackby(var/obj/item/O as obj, var/mob/user as mob)

	//Called when mob user "attacks" it with object O
	if (istype(O, /obj/item/weapon/reagent_containers/glass/bucket))
		src.b_amount = O.reagents.get_reagent_amount("water")
		src.active = 1
		if(src.b_amount > 0 && src.waterlevel < 100)
			if(src.b_amount + src.waterlevel > 100)
				src.b_amount = 100 - src.waterlevel
			O.reagents.remove_reagent("water", src.b_amount)
			src.waterlevel += src.b_amount
			playsound(src.loc, 'slosh.ogg', 25, 1)
			user << "You fill the tray with [src.b_amount] units of water."
		else if(src.waterlevel >= 100)
			user << "\red The hydroponics tray is already full."
		else
			user << "\red The bucket is not filled with water."
	return

/obj/machinery/hydroponics/examine()
	set src in view()
	..()
	usr << text("The hydroponics tray has [src.waterlevel] units of water in it")
	return