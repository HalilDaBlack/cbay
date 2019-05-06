/obj/mopbucket/New()
	var/datum/reagents/R = new/datum/reagents(50)
	reagents = R
	R.my_atom = src


/obj/mopbucket/examine()
	set src in usr
	usr << text("\icon[] [] contains [] units of water left!", src, src.name, src.reagents.total_volume)
	..()

/obj/mopbucket/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/mop))
		if (src.reagents.total_volume >= 2)
			src.reagents.trans_to(W, 2)
			user << "\blue You wet the mop"
			playsound(src.loc, 'OGGS/effects/slosh.ogg', 25, 1)
		if (src.reagents.total_volume < 1)
			user << "\blue Out of water!"
	return

/obj/mopbucket/ex_act(severity)
	switch(severity)
		if(1.0)
			del(src)
			return
		if(2.0)
			if (prob(50))
				del(src)
				return
		if(3.0)
			if (prob(5))
				del(src)
				return
