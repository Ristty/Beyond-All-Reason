if (not gadgetHandler:IsSyncedCode()) then
	return false
end

GameShortName = Game.gameShortName
VFS.Include("luarules/gadgets/scavengers/Configs/"..GameShortName.."/config.lua")
--for i = 1,#scavconfig do
--Spring.Echo("scavconfig value "..i.." = "..scavconfig[i])
--end

function ScavSendMessage(message)
	if scavconfig.messenger then
		SendToUnsynced("SendMessage", message)
	end
end

function ScavSendVoiceMessage(filedirectory)
	if scavconfig.messenger then
		Spring.SendCommands("scavplaysoundfile "..filedirectory)
	end
end

VFS.Include("luarules/gadgets/scavengers/API/api.lua")
VFS.Include("luarules/gadgets/scavengers/Modules/unit_controller.lua")

if scavconfig.modules.buildingSpawnerModule then
	ScavengerBlueprintsT0 = {}
	ScavengerBlueprintsT1 = {}
	ScavengerBlueprintsT2 = {}
	ScavengerBlueprintsT3 = {}
	ScavengerBlueprintsT4 = {}
	ScavengerBlueprintsT0Sea = {}
	ScavengerBlueprintsT1Sea = {}
	ScavengerBlueprintsT2Sea = {}
	ScavengerBlueprintsT3Sea = {}
	ScavengerBlueprintsT4Sea = {}
	VFS.Include("luarules/gadgets/scavengers/Modules/building_spawner.lua")
end

if scavconfig.modules.constructorControllerModule then
	ScavengerConstructorBlueprintsT0 = {}
	ScavengerConstructorBlueprintsT1 = {}
	ScavengerConstructorBlueprintsT2 = {}
	ScavengerConstructorBlueprintsT3 = {}
	ScavengerConstructorBlueprintsT4 = {}
	ScavengerConstructorBlueprintsT0Sea = {}
	ScavengerConstructorBlueprintsT1Sea = {}
	ScavengerConstructorBlueprintsT2Sea = {}
	ScavengerConstructorBlueprintsT3Sea = {}
	ScavengerConstructorBlueprintsT4Sea = {}
	VFS.Include("luarules/gadgets/scavengers/Modules/constructor_controller.lua")
end

if scavconfig.modules.factoryControllerModule then
	VFS.Include("luarules/gadgets/scavengers/Modules/factory_controller.lua")
end

if scavconfig.modules.unitSpawnerModule then
	VFS.Include("luarules/gadgets/scavengers/Modules/unit_spawner.lua")
end

VFS.Include("luarules/gadgets/scavengers/Modules/spawn_beacons.lua")
VFS.Include("luarules/gadgets/scavengers/Modules/messenger.lua")

local function DisableUnit(unitID)
	Spring.MoveCtrl.Enable(unitID)
	Spring.MoveCtrl.SetNoBlocking(unitID, true)
	Spring.MoveCtrl.SetPosition(unitID, Game.mapSizeX+500, 2000, Game.mapSizeZ+500) --don't move too far out or prevent_aicraft_hax will explode it!
	Spring.SetUnitCloak(unitID, true)
	Spring.SetUnitHealth(unitID, {paralyze=99999999})
	Spring.SetUnitNoDraw(unitID, true)
	Spring.SetUnitStealth(unitID, true)
	Spring.SetUnitNoSelect(unitID, true)
	Spring.SetUnitNoMinimap(unitID, true)
	Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, { 0 }, 0)
	Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE, { 0 }, 0)
end

local function DisableCommander()
	local teamUnits = Spring.GetTeamUnits(scavengerAITeamID)
	for _, unitID in ipairs(teamUnits) do
		DisableUnit(unitID)
	end
end



function gadget:GameFrame(n)
	if n == 1 then
		Spring.Echo("New Scavenger Spawner initialized")
	end
	
	if scavconfig.messenger == true and n%30 == 0 then
		pregameMessages(n)
	end

	if n == 15 and GaiaTeamID ~= Spring.GetGaiaTeamID() then
		DisableCommander()
	end

	if n == 100 and globalScore then
		Spring.SetTeamResource(GaiaTeamID, "ms", 1000000)
		Spring.SetTeamResource(GaiaTeamID, "es", 1000000)
		Spring.SetGlobalLos(GaiaAllyTeamID, false)
	end
	if n%30 == 0 and globalScore then
		Spring.SetTeamResource(GaiaTeamID, "ms", 1000000)
		Spring.SetTeamResource(GaiaTeamID, "es", 1000000)
		Spring.SetTeamResource(GaiaTeamID, "m", 1000000)
		Spring.SetTeamResource(GaiaTeamID, "e", 1000000)
		if BossWaveStarted == true then
			BossWaveTimer(n)
		end
	end
	if n%1800 == 0 and n > 100 then
		teamsCheck()
		UpdateTierChances(n)
		if (BossWaveStarted == false) and globalScore > scavconfig.timers.BossFight and unitSpawnerModuleConfig.bossFightEnabled then
			BossWaveStarted = true
		end
	end

	if n%90 == 0 and scavconfig.modules.buildingSpawnerModule then
		SpawnBlueprint(n)
	end
	if n%30 == 0 and scavconfig.modules.unitSpawnerModule then
		if scavconfig.modules.unitSpawnerModule then
			SpawnBeacon(n)
			UnitGroupSpawn(n)
		end
		if scavconfig.modules.constructorControllerModule and constructorControllerModuleConfig.useconstructors and n > 9000 then
			SpawnConstructor(n)
		end
		local scavengerunits = Spring.GetTeamUnits(GaiaTeamID)
		if scavengerunits then
			for i = 1,#scavengerunits do
				local scav = scavengerunits[i]
				local scavDef = Spring.GetUnitDefID(scav)
				local collectorRNG = math.random(0,5)

				if scavconfig.modules.constructorControllerModule then
					if constructorControllerModuleConfig.useconstructors then
						if scavConstructor[scav] and Spring.GetCommandQueue(scav, 0) <= 0 then
							ConstructNewBlueprint(n, scav)
						end
					end

					if constructorControllerModuleConfig.useresurrectors and collectorRNG == 0 then
						if scavResurrector[scav] then
							ResurrectorOrders(n, scav)
						end
					end

					if constructorControllerModuleConfig.usecollectors and collectorRNG == 0 then
						if scavCollector[scav] then
							CollectorOrders(n, scav)
						end
					end

					if scavAssistant[scav] and Spring.GetCommandQueue(scav, 0) <= 0 then
						AssistantOrders(n, scav)
					end
				end

				if scavconfig.modules.factoryControllerModule then
					if scavFactory[scav] and #Spring.GetFullBuildQueue(scav, 0) <= 0 then
						FactoryProduction(n, scav, scavDef)
					end
				end

				if n%900 == 0 and not scavStructure[scav] and not scavConstructor[scav] and not scavResurrector[scav] and not scavAssistant[scav] and not scavCollector[scav] and not scavFactory[scav] and not scavSpawnBeacon[scav] then
					SelfDestructionControls(n, scav, scavDef)
				end
				if Spring.GetCommandQueue(scav, 0) <= 1 and not scavStructure[scav] and not scavConstructor[scav] and not scavResurrector[scav] and not scavAssistant[scav] and not scavCollector[scav] and not scavFactory[scav] and not scavSpawnBeacon[scav] then
					ArmyMoveOrders(n, scav, scavDef)
				end

			end
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
	if unitTeam == GaiaTeamID then
		selfdx[unitID] = nil
		selfdy[unitID] = nil
		selfdz[unitID] = nil
		oldselfdx[unitID] = nil
		oldselfdy[unitID] = nil
		oldselfdz[unitID] = nil
		scavNoSelfD[unitID] = nil
		scavConstructor[unitID] = nil
		scavAssistant[unitID] = nil
		scavResurrector[unitID] = nil
		scavCollector[unitID] = nil
		scavStructure[unitID] = nil
		scavFactory[unitID] = nil
		scavSpawnBeacon[unitID] = nil
		UnitSuffixLenght[unitID] = nil
		SpawnBeacon(n)
		if UnitDefs[unitDefID].name == "scavengerdroppodbeacon_scav" then
			numOfSpawnBeacons = numOfSpawnBeacons - 1
		end
	end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
	if unitTeam == GaiaTeamID then
		local UnitName = UnitDefs[unitDefID].name
		if string.find(UnitName, "_scav") then
			UnitSuffixLenght[unitID] = string.len(scavconfig.unitnamesuffix)
		else
			UnitSuffixLenght[unitID] = 0
		end
		if UnitName == "scavengerdroppod_scav" then
			Spring.GiveOrderToUnit(unitID, CMD.SELFD,{}, {"shift"})
		end
		if UnitName == "scavengerdroppodbeacon_scav" then
			scavSpawnBeacon[unitID] = true
			numOfSpawnBeacons = numOfSpawnBeacons + 1
		end
		-- CMD.CLOAK = 37382
		Spring.GiveOrderToUnit(unitID,37382,{1},{""})
		-- Fire At Will
		Spring.GiveOrderToUnit(unitID,CMD.FIRE_STATE,{2},{""})
		scavStructure[unitID] = UnitDefs[unitDefID].isBuilding
		for i = 1,#NoSelfdList do
			if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == NoSelfdList[i] then--string.find(UnitName, NoSelfdList[i]) then
				scavStructure[unitID] = true
			end
		end

		if scavconfig.modules.constructorControllerModule then
			if constructorControllerModuleConfig.useconstructors then
				for i = 1,#ConstructorsList do
					if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == ConstructorsList[i] then
						scavConstructor[unitID] = true
					end
				end
			end

			if constructorControllerModuleConfig.useresurrectors then
				for i = 1,#Resurrectors do
					if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == Resurrectors[i] then
						scavResurrector[unitID] = true
					end
				end
				for i = 1,#ResurrectorsSea do
					if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == ResurrectorsSea[i] then
						scavResurrector[unitID] = true
					end
				end
			end

			if constructorControllerModuleConfig.usecollectors then
				for i = 1,#Collectors do
					if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == Collectors[i] then
						scavCollector[unitID] = true
					end
				end
			end

			for i = 1,#AssistUnits do
				if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == AssistUnits[i] then
					scavAssistant[unitID] = true
				end
			end
		end

		if scavconfig.modules.factoryControllerModule then
			for i = 1,#Factories do
				if string.sub(UnitName, 1, string.len(UnitName)-UnitSuffixLenght[unitID]) == Factories[i] then
					scavFactory[unitID] = true
				end
			end
		end
	end
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
	if unitTeam == GaiaTeamID then
		-- CMD.CLOAK = 37382
		Spring.GiveOrderToUnit(unitID,37382,{1},{""})
		-- Fire At Will
		Spring.GiveOrderToUnit(unitID,CMD.FIRE_STATE,{2},{""})
		Spring.GiveOrderToUnit(unitID,CMD.MOVE_STATE,{2},{""})
	end
end
