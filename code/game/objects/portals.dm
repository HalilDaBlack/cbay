/obj/portal
	name = "portal"
	icon = 'ICON/obj/stationobjs.dmi'
	icon_state = "portal"
	density = 1
	var/failchance = 4
	var/obj/item/target = null
	var/creator = null
	anchored = 1.0

/obj/portal/New()
	spawn(300)
		del(src)
		return
	return

/obj/portal/attack_hand(mob/M as mob)
	spawn(0)
		src.teleport(M)
		return
	return

/obj/portal/Bumped(mob/M as mob|obj)
	spawn(0)
		src.teleport(M)
		return
	return

/obj/portal/HasEntered(AM as mob|obj)
	spawn(0)
		src.teleport(AM)
		return
	return

/obj/portal/proc/teleport(atom/movable/M as mob|obj)
	if(istype(M, /obj/effects)) //sparks don't teleport
		return
	if (M.anchored)
		return
	if (src.icon_state == "portal1")
		return
	if (!( src.target ))
		del(src)
		return
	if (istype(M, /atom/movable))
		if(prob(failchance)) //oh dear a problem, put em in deep space
			src.icon_state = "portal1"
			do_teleport(M, locate(rand(5, world.maxx - 5), rand(5, world.maxy -5), getZLevel(Z_SPACE)), 0)
		else
			do_teleport(M, src.target, 1) ///You will appear adjacent to the beacon

