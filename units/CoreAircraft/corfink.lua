return {
	corfink = {
		acceleration = 0.16,
		brakerate = 0.0125,
		buildcostenergy = 1600,
		buildcostmetal = 50,
		buildpic = "CORFINK.DDS",
		buildtime = 2400,
		canfly = true,
		canmove = true,
		category = "ALL MOBILE NOTLAND NOTSUB ANTIFLAME ANTIEMG ANTILASER VTOL NOWEAPON NOTSHIP NOTHOVER LIGHTAIRSCOUT",
		collide = false,
		cruisealt = 110,
		description = "Scout Plane",
		energymake = 0.2,
		energyuse = 0.2,
		explodeas = "tinyExplosionGeneric",
		footprintx = 2,
		footprintz = 2,
		icontype = "air",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 90,
		maxslope = 10,
		maxvelocity = 12,
		maxwaterdepth = 0,
		name = "Fink",
		objectname = "CORFINK",
		radardistance = 1120,
		seismicsignature = 0,
		selfdestructas = "tinyExplosionGeneric",
		selfdestructcountdown = 1,
		sightdistance = 835,
		turnrate = 770,
		blocking = false,
		customparams = {
			death_sounds = "generic",
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "vtolcrac",
			},
		},
	},
}