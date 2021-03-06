/obj/item/assembly/shock_kit
	name = "electrohelmet assembly"
	desc = "This appears to be made from both an electropack and a helmet."
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "shock_kit"
	var/obj/item/clothing/head/helmet/part1 = null
	var/obj/item/device/electropack/part2 = null
	w_class = 5.0
	flags = CONDUCT

/obj/item/assembly/shock_kit/Destroy()
	qdel(part1)
	qdel(part2)
	..()
	return

/obj/item/assembly/shock_kit/attackby(obj/item/weapon/W as obj, mob/user as mob, params)
	if(istype(W, /obj/item/weapon/wrench))
		var/turf/T = loc
		if(ismob(T))
			T = T.loc
		part1.loc = T
		part2.loc = T
		part1.master = null
		part2.master = null
		part1 = null
		part2 = null
		qdel(src)
		return
	add_fingerprint(user)
	return

/obj/item/assembly/shock_kit/attack_self(mob/user as mob)
	part1.attack_self(user)
	part2.attack_self(user)
	add_fingerprint(user)
	return

/obj/item/assembly/shock_kit/receive_signal()
	if(istype(loc, /obj/structure/stool/bed/chair/e_chair))
		var/obj/structure/stool/bed/chair/e_chair/C = loc
		C.shock()
	return
