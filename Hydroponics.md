# Introduction #

Hydroponics is growing plants without soil, using only water and nutrients. In SS13, they will be grown for food, air, medicinal herbs, research, and recreation.


# Details #

**Basic Equipment**
  * **Plant Tank** : This is basically a square tank of water on the floor where most of the action takes place. Holds 100 water units.
  * **Seed Dispenser** : Says what it does. Carries 10 of each seed.
  * **Plant Analyzer** : Scans a plant and displays properties.
  * **Water Tank** : Supplies water.
  * **Bucket** : Transports water in units of 30 (already-present bucket does this)
  * **Nutrient solutions** : Various bottled nutrients that effect plants in different ways.

**Seed Properties** : These are properties plants may have, which effect the growing time and end product.
  * **Lifespan** : How many 'growth cycles' a plant is expected to live. Minimum of 3 growth cycles.
    * Min 10 growth cycle.
    * Max 30 growth cycles.
    * -2 to +2 shift per growth phase
  * **Endurance** : Overall health of the plant. It is effected by lack of nutrients and water. Higher endurance, means it can survive harsh conditions longer.
    * Min 1 Endurance
    * Max 100 endurance
    * -5 to +5 shift per growth phase
  * **Maturation Rate** : How many 'growth cycles' it takes to go from planting to full plant.
    * Min 3 growth cycles
    * Max 6 growth cycles
    * -1 to +1 shift per growth phase
  * **Production Rate** : How many growth cycles it takes to be harvestable after it reaches full growth.
    * Min 2 growth cycles
    * Max 10 growth cycles
    * -1 to +1 shift per growth phase
  * **Yield** : How many end products you can gain when harvesting.
    * Min 0 Yield
    * Max 10 yield
    * -2 to +2 shift per growth phase
  * **Potency** : How potent an item is. Always starts at 0. Maximum of 100. Only effects certain products : chili peppers, spinach, medicinal herbs, weed to start with.
    * Min 0 Potency
    * Max 100 Potency
    * -10 to +10 shift per growth phase

**Seeds and Mutations** : Here is a list of seeds and their mutations, plus an explanation of each.

Mutations have a chance of happening when the seed is planted, and effect all resulting products and seeds. If you get an ice pepper mutation, all subsequent plants from that harvest and seeds will be ice peppers.
  * **Chili Seed** : Your basic hot pepper.
    * **Base Stats**
      * **Lifespan** : 10
      * **Endurance** : 10
      * **Maturation Rate** : 5
      * **Production Rate** : 5
      * **Yield** : 4
      * **Potency** : 0
    * **Special Property - Spiciness** : Hotter peppers have a better chance of causing burning damage to someone. At 50-75 potency, a chili will have a chance of causing temporary vision loss. At max potency (100), the chili has a 1% chance of causing someone to explode like a small bomb.
    * **Mutation - Ice Pepper** : 1/20 chance. Instead of heat damage, causes cold damage. At 100 potency, the person will have a chance of some sort of insane death.

**Nutrient Solutions** : Each solution is good for 10 growth cycles.
  * **E-Z-Nutrient** : The basic solution, has 0 modifiers across the board.
    * With a dead plant, chance to grow any mushrooms.
  * **Left 4 Zed** : Doubles the chance of a mutation at the cost of yield and potency chance.
    * With a dead plant, more likely to grow deadly mushrooms.
  * **Robust Harvest** : Doubles maximum
    * With a dead plant, more likely to grow psilocybins.

**Growth Cycle** : Each growth cycle is about 10 seconds in game.
  1. If the seed was just planted, tick its growth indicator.
  1. If the seed was just planted, check mutation chance. If successfull, change the plant accordingly.
  1. If nutrient was just added, reset the nutrient indicator.
  1. If the nutrient indicator hits 1, flag the Plant Tank with N.
  1. Subtract 1-6 water from the tank.
  1. IF the water is below 10, flag the Plant Tank with W.
  1. If plant is still growing, adjust seed properties appropriately.
  1. Check for damage
    * If water is below 1-10, -1 from Health (derived from Endurance)
    * If water is 0, -3 from Health
    * If nutrient indicator is 0, -3 from Health
  1. If plant health hits 0, kill plant.

**FILE DETAILS**

Each seed and plant should preferably be named the following :
  * **Seed** : seed-(plant. IE : seed-chili, seed-eggplant
  * **Seedling** : (plant)-grow1. IE : chili-grow1
  * **Grow Stage 1** : (plant)-grow2
  * **Grow Stage 2** : (plant)-grow3
  * **Grow Stage 3** : (plant)-grow4
  * **Grow Stage 4** : (plant)-grow5
  * **Full Growth** : (plant)-grow6
    * These 6 represent the 'maximum' number of grow stages for a plant.
  * **Harvest Ready** : (plant)-harvest
  * **Dead** : (plant)-dead

## Weeds and Mushrooms ##

If a plant has died in a tank, but still has water, there's a chance weeds will begin to grow. If a plant has died and still has nutrition, mushrooms may start to grow based on the nutrients. If there's water, nutrients and a dead plant, chance is that either will begin to grow in the tank, but not both. After something is growing, you can add water or nutrients to make it grow better. Weeds or mushrooms, however, do not _require_ water or nutrients after they begin growing, but will grow very slow.

**Weeds**

  * **Weeds**: Your typical, annoying weeds. Larger they grow, longer it will take to remove them.
    * Will start to grow twice as often than other types of weeds.
  * **Kudzu**: After it has grown to full size, it will start to expand on the tanks and tiles around it.
    * Moving through kudzu is slow. Most efficiently removed with welder, fire or cleaning grenades.
    * Removed kudzu can give a sprout that will live for a few moments. If you plant it elsewhere warm enough (+40 C?) it will grow again, even on tiles.
  * **Nettles**: Acid coated plants. If not handled without gloves, they will cause mild burn damage.
    * More potent nettles do more damage. Maxed out nettles can stun people.
    * Can be boiled with water in an oven, after blending, to make healing nettle soup. More potent nettles heal more. Microwaved soup heals less.
    * Can mutate to expand like kudzu.
    * Can mutate into black **Death Nettles**, which burn and stun like hell.

**Mushrooms**

  * **Fly Amanita**: _Amanita muscaria_: Red with white spots, poisonous. If consumed, deals damage.
    * Can be replanted for potency. More potent Fly Amanitas deal more damage. Toxins need to be countered with Anti-Toxins and Spaceacillin.
    * Can be added to food. Unless boiled, will cause damage. However heating removes psychedelic effects.
    * Mild hallucinogenic effects.
    * Attracts flies. You can hear buzzing near them.
    * Extraction may yield little α-amanitin (poison) or little psilocybin (hallucinogen).
    * Can mutate into yellow or green amanitas.
  * **Destroying Angel**: _Amanita Virosa_: White, slimmer version of Death Caps. Much more poisonous. Possibly kills if eaten.
    * Max potency Destroying Angel will kill for certain if eaten. Less effect if added to food.
    * Little or medium amount of α-amanitin can be extracted from these mushrooms, which is a liver destroying toxin.
    * Toxic effects can be negated with a high dosage of Spaceacillin and anti-toxins.
  * **Chanterelle**: _Cantharellus Cibarius_: Small, yellow, tasty mushroom. Can be eaten raw. Heals more after cooking.
    * Has anti-toxin effects and helps curing hangover.
  * **Liberty Cap**: _Psilocybe Semilanceata_: A kind of small, plentiful magic mushroom. Medium hallucinogenic effects.
    * Extraction may yield little or medium amount of psilocybin.
    * Can be bred for potency.
    * **Tower Caps**: _Cappus Turris_: Large mushrooms originally found underground. Grows faster if not exposed to light.
    * Construction materials can be extracted from it. Metal would be the easy way, while adding wood and things to build out of it would be the harder but more interesting way.
  * **Plump Helmets**: _Plumus Hellmus_: Relatives to Tower Caps, also large mushrooms originally found underground. Grows faster if not exposed to light.
    * Can be made into very filling biscuits.
  * **Brown mold**: _Stemonitis Splendens_: Grows to adjacent tiles when exposed to heat, consuming it in the process. Growing speed isn't affected by nutrients or water, relying fully on the presence or abscence of heat.