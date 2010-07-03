//Snacks
/obj/item/weapon/reagent_containers/food/snacks/candy
	name = "candy"
	desc = "Man, that shit looks good. I bet it's got nougat. Fuck."
	icon_state = "candy"
	heal_amt = 1

/obj/item/weapon/reagent_containers/food/snacks/chips
	name = "chips"
	desc = "Commander Riker's What-The-Crisps"
	icon_state = "chips"
	heal_amt = 1

/obj/item/weapon/reagent_containers/food/snacks/donut
	name = "donut"
	desc = "Goes great with Robust Coffee."
	icon_state = "donut1"
	heal_amt = 1
	New()
		..()
		if(rand(1,3) == 1)
			src.icon_state = "donut2"
			src.name = "frosted donut"
			src.heal_amt = 2
	heal(var/mob/M)
		if(istype(M, /mob/living/carbon/human) && M.job in list("Security Officer", "Head of Security", "Detective"))
			src.heal_amt *= 2
			..()
			src.heal_amt /= 2

/obj/item/weapon/reagent_containers/food/snacks/egg
	name = "egg"
	desc = "An egg!"
	icon_state = "egg"
	amount = 1
	heal_amt = 1

/obj/item/weapon/reagent_containers/food/snacks/flour
	name = "flour"
	desc = "Some flour"
	icon_state = "flour"
	amount = 1

/obj/item/weapon/reagent_containers/food/snacks/liq/humanmeat
	eatsentence = "You take a sip of"
	finsentence = "You finish drinking"
	attemptfeedother = "attempts to force-drink"
	feedsother = "force-drinks"
	feedsotherfin = "finishes drinking"
	eatsound = 'drink.ogg'

/obj/item/weapon/reagent_containers/food/snacks/humanmeat
	name = "-meat"
	desc = "A slab of meat"
	icon_state = "meat"
	var/subjectname = ""
	var/subjectjob = null
	amount = 1

/obj/item/weapon/reagent_containers/food/snacks/assburger
	name = "assburger"
	desc = "This burger gives off an air of awkwardness."
	icon_state = "assburger"
	amount = 5
	heal_amt = 2

/obj/item/weapon/reagent_containers/food/snacks/brainburger
	name = "brainburger"
	desc = "A strange looking burger. It looks almost sentient."
	icon_state = "brainburger"
	amount = 5
	heal_amt = 2

/obj/item/weapon/reagent_containers/food/snacks/liq/milkshake
	name = "milkshake"
	desc = "A rather plain milkshake"
	icon_state = "shake-white"
	amount = 2
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/liq/meatshake
	name = "meatshake"
	desc = "A milkshake made of ..meat?"
	icon_state = "shake-meat"
	amount = 3
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/liq/brainshake
	name = "brainshake"
	desc = "A milkshake made of ..brains?"
	icon_state = "shake-meat"
	amount = 3
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/liq/buttshake
	name = "meatshake"
	desc = "A milkshake made of.. oh come on, that's just unsanitary"
	icon_state = "shake-meat"
	amount = 3
	heal_amt = 2

/obj/item/weapon/reagent_containers/food/snacks/liq/sberryshake
	name = "strawberry milkshake"
	desc = "Tastes like strawberry"
	icon_state = "shake-meat"
	amount = 3
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/liq/bberryshake
	name = "blueberry milkshake"
	desc = "Tastes like blueberry"
	icon_state = "shake-blue"
	amount = 3
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/liq/chocoshake
	name = "chocolate milkshake"
	desc = "Tastes like chocolate"
	icon_state = "shake-white"
	amount = 3
	heal_amt = 4

/obj/item/weapon/reagent_containers/food/snacks/liq/roboshake
	name = "robo-shake"
	desc = "It glistens with metal shavings and wires"
	icon_state = "shake-robo"
	eatsound = 'drink.ogg'
	New()
		var/datum/reagents/R = new/datum/reagents(5)
		reagents = R
		R.my_atom = src
		R.add_reagent("nanites", 3)

/obj/item/weapon/reagent_containers/food/snacks/faggot
	name = "faggot"
	desc = "A great meal all round."
	icon_state = "faggot"
	amount = 1
	heal_amt = 2
	heal(var/mob/M)
		..()

/obj/item/weapon/reagent_containers/food/snacks/donkpocket
	name = "donk-pocket"
	desc = "The food of choice for the seasoned traitor."
	icon_state = "donkpocket"
	heal_amt = 1
	amount = 1
	var/warm = 0
	heal(var/mob/M)
		if(src.warm && M.reagents)
			M.reagents.add_reagent("tricordrazine",15)
		else
			M << "\red It's just not good enough cold.."
		..()

	proc/cooltime()
		if (src.warm)
			spawn( 4200 )
				src.warm = 0
				src.name = "donk-pocket"
		return

/obj/item/weapon/reagent_containers/food/snacks/humanburger
	name = "-burger"
	var/hname = ""
	var/job = null
	desc = "A bloody burger."
	icon_state = "hburger"
	amount = 5
	heal_amt = 2
	heal(var/mob/M)
		..()

/obj/item/weapon/reagent_containers/food/snacks/monkeyburger
	name = "monkeyburger"
	desc = "The cornerstone of every nutritious breakfast."
	icon_state = "mburger"
	amount = 5
	heal_amt = 2

/obj/item/weapon/reagent_containers/food/snacks/roburger
	name = "roburger"
	desc = "The lettuce is the only organic component. Beep."
	icon_state = "roburger"
	New()
		var/datum/reagents/R = new/datum/reagents(5)
		reagents = R
		R.my_atom = src
		R.add_reagent("nanites", 5)

/obj/item/weapon/reagent_containers/food/snacks/monkeymeat
	name = "meat"
	desc = "A slab of meat"
	icon_state = "meat"
	amount = 1

/obj/item/weapon/reagent_containers/food/snacks/pie
	name = "custard pie"
	desc = "It smells delicious. You just want to plant your face in it."
	icon_state = "pie"
	amount = 3

/obj/item/weapon/reagent_containers/food/snacks/waffles
	name = "waffles"
	desc = "Mmm, waffles"
	icon_state = "waffles"
	amount = 5
	heal_amt = 2


/obj/item/weapon/reagent_containers/food/snacks/liq/milk
	name = "soyamilk"
	desc = "Cows on a space station would be stupid."
	icon_state = "milk"
	amount = 5
	heal_amt = 2
	eatsound = 'drink.ogg'

//Grown foods
/obj/item/weapon/reagent_containers/food/snacks/grown/ //New subclass so we can pass on values
	var/seed = ""
	var/plantname = ""
	var/productname = ""
	var/species = ""
	var/lifespan = 0
	var/endurance = 0
	var/maturation = 0
	var/production = 0
	var/yield = 0
	var/potency = -1

/obj/item/weapon/reagent_containers/food/snacks/grown/berries
	name = "berries"
	desc = "Nutritious!"
	icon_state = "berrypile"
	amount = 2
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/grown/chili
	name = "chili"
	desc = "Spicy!"
	icon_state = "chilipepper"
	amount = 1
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/grown/eggplant
	name = "eggplant"
	desc = "Yum!"
	icon_state = "eggplant"
	amount = 2
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/grown/soybeans
	name = "eggplant"
	desc = "Pretty bland, but the possibilities..."
	icon_state = "soybeans"
	amount = 1
	heal_amt = 2

/obj/item/weapon/reagent_containers/food/snacks/grown/tomato
	name = "tomato"
	desc = "Tom-mae-to or to-mah-to? You decide."
	icon_state = "tomato"
	amount = 2
	heal_amt = 5

/obj/item/weapon/reagent_containers/food/snacks/grown/wheat
	name = "wheat"
	desc = "I wouldn't eat this, unless you're one of those health freaks.."
	icon_state = "wheat"
	amount = 1
	heal_amt = 1

//Drinks
/obj/item/weapon/reagent_containers/food/drinks/coffee
	name = "Robust Coffee"
	desc = "Careful, the beverage you're about to enjoy is extremely hot."
	icon_state = "coffee"
	heal_amt = 1
	New()
		var/datum/reagents/R = new/datum/reagents(50)
		reagents = R
		R.my_atom = src
		R.add_reagent("coffee", 30)

/obj/item/weapon/reagent_containers/food/drinks/cola
	name = "space cola"
	desc = "Cola. in space."
	icon_state = "cola"
	heal_amt = 1
	New()
		var/datum/reagents/R = new/datum/reagents(50)
		reagents = R
		R.my_atom = src
		R.add_reagent("cola", 30)

/obj/item/weapon/reagent_containers/food/drinks/beer
	name = "Space Beer"
	desc = "Beer. in space."
	icon_state = "beer"
	heal_amt = 1
	New()
		var/datum/reagents/R = new/datum/reagents(50)
		reagents = R
		R.my_atom = src
		R.add_reagent("beer", 30)
