return {
	corap = {
		acceleration = 0,
		brakerate = 0,
		buildcostenergy = 1400,
		buildcostmetal = 870,
		builder = true,
		shownanospray = false,
		buildinggrounddecaldecayspeed = 30,
		buildinggrounddecalsizex = 9,
		buildinggrounddecalsizey = 9,
		buildinggrounddecaltype = "corap_aoplane.dds",
		buildpic = "CORAP.DDS",
		buildtime = 7180,
		canmove = true,
		category = "ALL PLANT NOTLAND NOWEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -14 -23",
		collisionvolumescales = "110 33 50",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Produces Level 1 Aircraft",
		energystorage = 100,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 8,
		footprintz = 6,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 40,
		maxdamage = 1925,
		maxslope = 15,
		maxwaterdepth = 0,
		metalstorage = 100,
		name = "Aircraft Plant",
		objectname = "CORAP",
		radardistance = 510,
		radaremitheight = 40,
		seismicsignature = 0,
		selfdestructas = "largeBuildingexplosiongenericSelfd",
		sightdistance = 273,
		terraformspeed = 500,
		usebuildinggrounddecal = true,
		workertime = 100,
		yardmap = "oooooooooooooooooooooooooooooooooooooooooooooooo",
		buildoptions = {
			"corca",
			"corfink",
			"corveng",
			"corshad",
			"corvalk",
			"corbw",
		},
		customparams = {
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -14 -23",
				collisionvolumescales = "110 33 50",
				collisionvolumetype = "Box",
				damage = 1155,
				description = "Aircraft Plant Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 7,
				footprintz = 6,
				height = 20,
				hitdensity = 100,
				metal = 540,
				object = "CORAP_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 578,
				description = "Aircraft Plant Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 6,
				footprintz = 6,
				height = 4,
				hitdensity = 100,
				metal = 216,
				object = "6X6B",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "pairactv",
			},
		},
	},
}
