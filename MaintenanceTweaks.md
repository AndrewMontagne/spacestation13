# Introduction #

So far, there are a small handful of things that could be tweaked or improved upon.  This page is intended to be a place to throw any found or created "Fix this later" code.  Keep an eye out for comments in code that indicate that something is missing, and please add them in this page for reference and tracking.

# Fixes and Tweaks #

List of things requiring tweaks, fixes, or general improvements:
  * Engineering PDA module.
  * Bypassing glass doors.
  * Determine if there's a need for a messaging PDA module
  * Determine if there's a need for a quartermaster PDA module
  * Chef PDA module "Chef MixMasta 9000"
    * Should contain a text file with a lot of the recipes
    * Some recipes should stay SECRET though.
  * Make the screen update faster. For example, when lying down and you're rising up to your feet, your sprite still stays in horizontal position a long time even though you can already move around. The UI updates slow too, etc. May be that this can't be fixed and is because of BYOND.

Please add any additional points to this document, especially when finding notes in code that resemble the following:
> //To-do: new engine monitor, maybe new messaging, new signaler cart??
> //also quartermaster pda I guess


> ## Engineering PDA Module ##

> This comes from a gap in the PDA module code, where the Engine Monitor does **nothing**.  Seeing as the station currently does NOT have any "engines" for mobility sake, I'm intending to move the Engine Monitoring code over to "Power Monitoring", which should provide monitoring of the Solar Panels and any future reactors that get used.


> ## Bypassing glass doors ##

> Caig pointed out that the glass doors cannot be bypassed at this time.  Seems simple to me - I'll try to pull over code from reinforced glass, and allow glass doors to be shattered if struck enough.  This would permanently lock the door into an "open" state.


> ## Determining need... ##

> There's a few comments in the PDA code for a need for messaging and Quartermaster modules.  At a glance, there is a quartermaster module, and I'm not positive messaging is particularly critical, but we can come back to this and figure out what to do with it.


# Bugs #

When a bug is fixed, please strike it ~~out~~ to preserve the numbered list, so it can be referred to later if needed.

  1. Sometimes the rightmost "+" button goes unresponsive in Air Scrubbers' target pressure, even when not maxed out. Other buttons work.
    * Suspected reason: Someone else has been using it before you.
  1. Incendiary grenades do nothing when they explode.
  1. Sometimes access-coded doors open and close a couple of times when you hold and run at them.
    * Never happens with glass doors. Compare code?
  1. Making napalm doesn't work. The reaction does nothing.
  1. When a door is opened with a crowbar in a power-out situation, it will blink once to the closed-door graphic after opening.
  1. "Sandbox-panel" command doesn't seem to do anything in the Sandbox Mode even though there's a lot of code for it.