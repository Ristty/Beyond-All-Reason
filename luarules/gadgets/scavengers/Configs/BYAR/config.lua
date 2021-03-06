Spring.Echo("[Scavengers] Config initialized")

scavconfig = {
	unitnamesuffix = "_scav",
	messenger = true, -- BYAR specific thing, don't enable otherwise (or get gui_messages.lua from BYAR)
	modules = {
		buildingSpawnerModule 			= true,
		constructorControllerModule 	= true,
		factoryControllerModule 		= true,
		unitSpawnerModule 				= true,
	},
	timers = {
		-- globalScore values
		T0start								= 1,
		T1start								= 400,
		T1low								= 600,
		T1med								= 800,
		T1high								= 1000,
		T1top								= 1200,
		T2start								= 1500,
		T2low								= 2000,
		T2med								= 2500,
		T2high								= 3000,
		T2top								= 4000,
		T3start								= 5000,
		T3low								= 6000,
		T3med								= 7000,
		T3high								= 8000,
		T3top								= 9000,
		T4start								= 10000,
		T4low								= 12000,
		T4med								= 14000,
		T4high								= 16000,
		T4top								= 20000,
		BossFight							= 50000,
	},
	other = {
		heighttolerance						= 30, -- higher = allow higher height diffrences
	}
}


-- Modules configs
buildingSpawnerModuleConfig = {
	spawnchance 						= 90,
}

unitSpawnerModuleConfig = {
	bossFightEnabled					= true,
	BossWaveTimeLeft					= 900,
	aircraftchance 						= 5, -- higher number = lower chance
	globalscoreperoneunit 				= 800,
	spawnchance							= 30,
	beaconspawnchance					= 30,
	landmultiplier 						= 0.75,
	airmultiplier 						= 1.5,
	seamultiplier 						= 0.2,

	t0multiplier						= 2,
	t1multiplier						= 1.5,
	t2multiplier						= 0.3,
	t3multiplier						= 0.05,
	t4multiplier						= 0.01,
}

constructorControllerModuleConfig = {
	constructortimerstart				= 120, -- ammount of seconds it skips from constructortimer for the first spawn (make first spawn earlier - this timer starts on timer-Timer1)
	constructortimer 					= 220, -- time in seconds between commander/constructor spawns
	constructortimerreductionframes		= 36000,
	minimumconstructors					= 3,
	useresurrectors						= true,
	useconstructors						= true,
	usecollectors						= true,
}

unitControllerModuleConfig = {
	minimumrangeforfight				= 650,
}



-- Functions which you can configure
function CountScavConstructors()
	return UDC(GaiaTeamID, UDN.corcom_scav.id) + UDC(GaiaTeamID, UDN.armcom_scav.id)
end

function UpdateTierChances(n)
	-- Must be 100 in total
	
	if globalScore > scavconfig.timers.T4top then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 15
		TierSpawnChances.T3 = 60
		TierSpawnChances.T4 = 25
	elseif globalScore > scavconfig.timers.T4high then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 20
		TierSpawnChances.T3 = 60
		TierSpawnChances.T4 = 20
	elseif globalScore > scavconfig.timers.T4med then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 20
		TierSpawnChances.T3 = 65
		TierSpawnChances.T4 = 15
	elseif globalScore > scavconfig.timers.T4low then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 25
		TierSpawnChances.T3 = 65
		TierSpawnChances.T4 = 10
	elseif globalScore > scavconfig.timers.T4start then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 30
		TierSpawnChances.T3 = 65
		TierSpawnChances.T4 = 5
	elseif globalScore > scavconfig.timers.T3top then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 30
		TierSpawnChances.T3 = 70
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T3high then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 40
		TierSpawnChances.T3 = 60
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T3med then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 50
		TierSpawnChances.T3 = 50
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T3low then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 75
		TierSpawnChances.T3 = 25
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T3start then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 90
		TierSpawnChances.T3 = 10
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T2top then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 100
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T2high then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 25
		TierSpawnChances.T2 = 75
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T2med then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 50
		TierSpawnChances.T2 = 50
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T2low then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 75
		TierSpawnChances.T2 = 25
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T2start then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 90
		TierSpawnChances.T2 = 10
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T1top then
		TierSpawnChances.T0 = 0
		TierSpawnChances.T1 = 100
		TierSpawnChances.T2 = 0
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T1high then
		TierSpawnChances.T0 = 25
		TierSpawnChances.T1 = 75
		TierSpawnChances.T2 = 0
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T1med then
		TierSpawnChances.T0 = 50
		TierSpawnChances.T1 = 50
		TierSpawnChances.T2 = 0
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T1low then
		TierSpawnChances.T0 = 75
		TierSpawnChances.T1 = 25
		TierSpawnChances.T2 = 0
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	elseif globalScore > scavconfig.timers.T1start then
		TierSpawnChances.T0 = 90
		TierSpawnChances.T1 = 10
		TierSpawnChances.T2 = 0
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	else
		TierSpawnChances.T0 = 100
		TierSpawnChances.T1 = 0
		TierSpawnChances.T2 = 0
		TierSpawnChances.T3 = 0
		TierSpawnChances.T4 = 0
	end
end