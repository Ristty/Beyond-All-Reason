return {
	scavcommander = {
		acceleration = 0.18,
		activatewhenbuilt = true,
		autoheal = 5,
		brakerate = 1.125,
		buildcostenergy = 26000,
		buildcostmetal = 2700,
		builddistance = 145,
		builder = true,
		buildpic = "CORCOM.PNG",
		buildtime = 75000,
		cancapture = true,
		canmanualfire = true,
		canmove = true,
		capturespeed = 1800,
		category = "ALL WEAPON COMMANDER NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CANBEUW EMPABLE",
		cloakcost = 100,
		cloakcostmoving = 1000,
		collisionvolumeoffsets = "0 3 0",
		collisionvolumescales = "28 52 28",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Scavenger Commander",
		energymake = 25,
		explodeas = "mediumexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		hidedamage = false,
		icontype = "corcommander",
		idleautoheal = 20,
		idletime = 1800,
		losemitheight = 40,
		mass = 5000,
		maxdamage = 3000,
		maxslope = 20,
		maxvelocity = 1.25,
		maxwaterdepth = 35,
		metalmake = 1.5,
		mincloakdistance = 50,
		movementclass = "COMMANDERKBOT",
		name = "Scavenger Commander",
		nochasecategory = "ALL",
		objectname = "Units/CORCOM.s3o",
		pushresistant = true,
		radardistance = 700,
		radaremitheight = 40,
		reclaimable = false,
		script = "Units/CORCOM.cob",
		seismicsignature = 0,
		selfdestructas = "commanderExplosion",
		selfdestructcountdown = 5,
		showplayername = false,
		sightdistance = 450,
		sonardistance = 450,
		terraformspeed = 1500,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.825,
		turnrate = 1133,
		upright = true,
		workertime = 2000,
		buildoptions = {
			[1] = "corsolar",
			[2] = "corwin",
			[3] = "cormstor",
			[4] = "corestor",
			[5] = "cormex",
			[6] = "cormakr",
			[7] = "corlab",
			[8] = "corvp",
			[9] = "corap",
			[10] = "coreyes",
			[11] = "corrad",
			[12] = "cordrag",
			[13] = "corllt",
			[14] = "corrl",
			[15] = "cordl",
			[16] = "cortide",
			[17] = "coruwms",
			[18] = "coruwes",
			[19] = "coruwmex",
			[20] = "corfmkr",
			[21] = "corsy",
			[22] = "corfdrag",
			[23] = "cortl",
			[24] = "corfrt",
			[25] = "corfrad",
			[26] = "corhllt",
			[27] = "corhlt",
			[28] = "corerad",
			[29] = "corjamt",
			[30] = "corvipe",
			[31] = "corpun",
			[32] = "corarad",
			[33] = "corshroud",
			[34] = "corflak",
			[35] = "corint",
			[36] = "cordoom",
			[37] = "armpb",
			[38] = "armpacko",
			[39] = "armamb",
			[40] = "scallt",
			[41] = "scahllt",
			[42] = "scahlt",
			[43] = "scavape",
			[44] = "scaint",
			

		},
		customparams = {
			area_mex_def = "cormex",
			iscommander = false,
			model_author = "Mr Bob",
			normaltex = "unittextures/Core_normal.dds",
			paralyzemultiplier = 0.025,
			subfolder = "",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "35 12 54",
				collisionvolumetype = "cylY",
				damage = 10000,
				description = "Scavenger Commander Wreckage",
				energy = 1000,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 1000,
				object = "Units/corcom_dead.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 5000,
				description = "Scavenger Commander Debris",
				energy = 1000,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 1000,
				object = "Units/cor2X2C.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:com_sea_laser_bubbles",
				[2] = "custom:barrelshot-medium",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture2",
			cloak = "kloak2",
			repair = "repair2",
			uncloak = "kloak2un",
			underattack = "warning2",
			unitcomplete = "kccorsel",
			working = "reclaim1",
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
				[1] = "kcormov",
			},
			select = {
				[1] = "kccorsel",
			},
		},
		weapondefs = {
			scavcomlaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = "custom:laserhit-small-purple",
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 5.5,
				name = "J7Laser",
				noselfdamage = true,
				range = 300,
				reloadtime = 0.4,
				rgbcolor = "0.85 0 1",
				soundhitdry = "",
				soundhitwet = "sizzle",
				-- soundhitwetvolume = 0.5,
				soundstart = "lasrfir1",
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 2,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 75,
					fighters = 110,
					subs = 5,
				},
			},
			corcomsealaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.3,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = "custom:laserhit-small-blue",
				firestarter = 35,
				firesubmersed = true,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.3,
				laserflaresize = 5.5,
				name = "J7NSLaser",
				noselfdamage = true,
				range = 260,
				reloadtime = 1,
				rgbcolor = "0.2 0.2 0.6",
				rgbcolor2 = "0.2 0.2 0.2",
				soundhitdry = "",
				soundhitwet = "sizzle",
				-- soundhitwetvolume = 0.5,
				soundstart = "uwlasrfir1",
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 5,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontype = "BeamLaser",
				weaponvelocity = 900,
				damage = {
					default = 150,
					subs = 75,
				},
			},
			scavdisintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				bouncerebound = 0,
				cegtag = "dgunprojectile",
				commandfire = false,
				--craterareaofeffect = 20,
				craterboost = 0,
				cratermult = 0.75,
				edgeeffectiveness = 0.15,
				energypershot = 2000,
				explosiongenerator = "custom:expldgun",
				firestarter = 100,
				firesubmersed = false,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				name = "Disintegrator",
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 0.9,
				rgbcolor = "0.85 0 1",
				soundhit = "xplomas2",
				soundhitwet = "sizzle",
				-- soundhitwetvolume = 0.5,
				soundstart = "disigun1",
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontimer = 4.2,
				weapontype = "DGun",
				weaponvelocity = 300,
				customparams = {
					expl_light_heat_radius_mult = 2.8,
					expl_light_heat_strength_mult = 0.66,
					expl_light_mult = 0.35,
					expl_light_radius_mult = 1.15,
				},
				damage = {
					default = 150,
				},
			},
			repulsor1 = {
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				name = "PlasmaRepulsor",
				range = 50,
				soundhitwet = "sizzle",
				-- soundhitwetvolume = 0.5,
				weapontype = "Shield",
				damage = {
					default = 100,
				},
				shield = {
					alpha = 0.25,
					energyuse = 0,
					force = 2.5,
					intercepttype = 479,
					power = 1000,
					powerregen = 20,
					powerregenenergy = 0,
					radius = 50,
					repulser = false,
					smart = true,
					startingpower = 1000,
					visible = false,
					visiblehitframes = 0,
					badcolor = {
						[1] = 1,
						[2] = 0.2,
						[3] = 0.2,
						[4] = 0.25,
					},
					goodcolor = {
						[1] = 0.2,
						[2] = 1,
						[3] = 0.2,
						[4] = 0.2,
					},
				},
			},
		},
		weapons = {
			[1] = {
				def = "SCAVCOMLASER",
				onlytargetcategory = "NOTSUB",
			},
			[2] = {
				badtargetcategory = "VTOL",
				def = "CORCOMSEALASER",
			},
			[3] = {
				def = "SCAVDISINTEGRATOR",
				onlytargetcategory = "NOTSUB",
			},
			[4] = {
				def = "REPULSOR1",
			},
		},
	},
}
