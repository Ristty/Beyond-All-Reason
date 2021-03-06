return {
	armpwbosst1_scav = {
		acceleration = 0.414,
		brakerate = 0.69,
		buildcostenergy = 9600000,
		buildcostmetal = 480000,
		buildpic = "ARMPW.PNG",
		buildtime = 1420000,
		canmove = true,
		category = "KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "120 220 120",
		collisionvolumetype = "CylY",
		--corpse = "DEAD",
		description = "Holy #### it's huge Peewee!",
		energymake = 0.3,
		energyuse = 0.3,
		explodeas = "advancedFusionExplosion",
		footprintx = 20,
		footprintz = 20,
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 300000,
		maxslope = 17,
		mass = 999999995904,
		maxvelocity = 0.80,
		maxwaterdepth = 120,
		movementclass = "BOSSPEEWEE6",
		name = "Huge Peewee",
		nochasecategory = "VTOL",
		objectname = "Units/scavboss/armpwbossT1.s3o",
		script = "Units/scavboss/armpwbossT1.cob",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 1500,
		turninplace = true,
		turninplaceanglelimit = 360,
		turninplacespeedlimit = 0.1848,
		turnrate = 121.440002,
		upright = true,
		customparams = {
			description_long = "Peewee is a basic infantry Kbot. Being very cheap to build and having high top speeds can be useful for scouting and taking down unguarded metal extractors and eco. In late T1 warfare Peewees can be used for ambushing Commanders and speedy skirmishing. Light armor and short range makes it susceptible to defensive towers and riot tanks",
			model_author = "Kaiser",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armkbots",
			wpn1turretx = 300,
			wpn1turrety = 300,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.979118347168 -0.453806965332 -0.796119689941",
				collisionvolumescales = "30.1392364502 18.4953460693 29.797164917",
				collisionvolumetype = "Box",
				damage = 192,
				description = "Peewee Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 40,
				hitdensity = 100,
				metal = 29,
				object = "Units/armpw_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 96,
				description = "Peewee Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 12,
				object = "Units/arm2X2F.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-large",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg2",
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
				[1] = "servtny2",
			},
			select = {
				[1] = "servtny2",
			},
		},
		weapondefs = {
			emg = {
				areaofeffect = 8,
				avoidfeature = false,
				burst = 10,
				burstrate = 0.00,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:plasmahit-huge",
				firestarter = 100,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				intensity = 0.7,
				name = "Rapid-fire huge g2g plasma guns",
				noselfdamage = true,
				proximityPriority = -1.5,
				range = 1250,
				reloadtime = 0.5,
				rgbcolor = "1 0.95 0.4",
				size = 8,
				--soundhit = "lasrhit1",
				soundhitwet = "splshbig",
				-- soundhitwetvolume = 0.5,
				soundstart = "flashemg",
				sprayangle = 1180,
				tolerance = 5000,
				targetMoveError = 0.5,
				turret = true,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 800,
				damage = {
					commanders = 55,
					bombers = 30,
					default = 110,
					fighters = 30,
					subs = 10,
					vtol = 30,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "EMG",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
