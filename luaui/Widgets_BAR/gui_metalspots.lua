function widget:GetInfo()
  return {
    name    = "Metalspots",
	desc    = "",
	author  = "Floris",
	date    = "October 2019",
	license = "",
	layer   = 2,
	enabled = true,
  }
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

local OPTIONS = {
	circlePieces					= 3,
	circlePieceDetail				= 20,
	circleSpaceUsage				= 0.8,
	circleInnerOffset				= 0,
	rotationSpeed					= 8,
	
	-- size
	innersize						= 1.86,		-- outersize-innersize = circle width
	outersize						= 2.08,		-- outersize-innersize = circle width
}


local spIsGUIHidden = Spring.IsGUIHidden
local spIsSphereInView = Spring.IsSphereInView
local spTestBuildOrder = Spring.TestBuildOrder

local metalSpots = {}
local valueList = {}
local previousOsClock = os.clock()
local currentRotationAngle = 0
local currentRotationAngleOpposite = 0

local fontfile = LUAUI_DIRNAME .. "fonts/" .. Spring.GetConfigString("bar_font2", "Exo2-SemiBold.otf")
local vsx,vsy = Spring.GetViewGeometry()
local fontfileScale = (0.5 + (vsx*vsy / 5700000))
local fontfileSize = 75
local fontfileOutlineSize = 15
local fontfileOutlineStrength = 1.4
local font = gl.LoadFont(fontfile, fontfileSize*fontfileScale, fontfileOutlineSize*fontfileScale, fontfileOutlineStrength)

local testMexUdefID = UnitDefNames['armmex'].id

function widget:ViewResize()
	vsx,vsy = Spring.GetViewGeometry()
	local newFontfileScale = (0.5 + (vsx*vsy / 5700000))
	if (fontfileScale ~= newFontfileScale) then
		fontfileScale = newFontfileScale
		gl.DeleteFont(font)
		font = gl.LoadFont(fontfile, fontfileSize*fontfileScale, fontfileOutlineSize*fontfileScale, fontfileOutlineStrength)
	end
end


local function DrawCircleLine(innersize, outersize)
	gl.BeginEnd(GL.QUADS, function()
		local detailPartWidth, a1,a2,a3,a4
		local width = OPTIONS.circleSpaceUsage
		local detail = OPTIONS.circlePieceDetail

		local radstep = (2.0 * math.pi) / OPTIONS.circlePieces
		for i = 1, OPTIONS.circlePieces do
			for d = 1, detail do
				
				detailPartWidth = ((width / detail) * d)
				a1 = ((i+detailPartWidth - (width / detail)) * radstep)
				a2 = ((i+detailPartWidth) * radstep)
				a3 = ((i+OPTIONS.circleInnerOffset+detailPartWidth - (width / detail)) * radstep)
				a4 = ((i+OPTIONS.circleInnerOffset+detailPartWidth) * radstep)
				
				--outer (fadein)
				gl.Vertex(math.sin(a4)*innersize, 0, math.cos(a4)*innersize)
				gl.Vertex(math.sin(a3)*innersize, 0, math.cos(a3)*innersize)
				--outer (fadeout)
				gl.Vertex(math.sin(a1)*outersize, 0, math.cos(a1)*outersize)
				gl.Vertex(math.sin(a2)*outersize, 0, math.cos(a2)*outersize)
			end
		end
	end)
end


function widget:Initialize()
	if not WG.metalSpots then
		Spring.Echo("<metalspots> This widget requires the 'Metalspot Finder' widget to run.")
		widgetHandler:RemoveWidget(self)
	end
	currentClock = os.clock()
	local mSpots = WG.metalSpots
	for i = 1, #mSpots do
		local spot = mSpots[i]
		local value = string.format("%0.1f",math.round(spot.worth/1000,1))
		local scale = 0.77 + ((math.max(spot.maxX,spot.minX)-(math.min(spot.maxX,spot.minX))) * (math.max(spot.maxZ,spot.minZ)-(math.min(spot.maxZ,spot.minZ)))) / 10000
		metalSpots[#metalSpots+1] = {spot.x, Spring.GetGroundHeight(spot.x,spot.z), spot.z, value, scale}
		if not valueList[value] then
			valueList[value] = gl.CreateList(function()
				font:Begin()
				font:SetTextColor(1,1,1,1)
				font:SetOutlineColor(0,0,0,0.4)
				font:Print(value, 0, 0, 1.05, "con")
				font:End()
			end)
		end
	end
	circleList = gl.CreateList(DrawCircleLine, OPTIONS.innersize, OPTIONS.outersize)
end


function widget:Shutdown()
	gl.DeleteList(circleList)
	gl.DeleteList(spotList)
	for k,v in pairs(valueList) do
		gl.DeleteList(v)
	end
	gl.DeleteFont(font)
end


function widget:RecvLuaMsg(msg, playerID)
	if msg:sub(1,18) == 'LobbyOverlayActive' then
		chobbyInterface = (msg:sub(1,19) == 'LobbyOverlayActive1')
	end
end


-- periodically check if mex sot is occupied
function widget:GameFrame(gf)
	if gf % 30 == 1 then
		for i = 1, #metalSpots do
			local spot = metalSpots[i]
			if spTestBuildOrder(testMexUdefID, spot[1], spot[2], spot[3], 0) == 0 then
				metalSpots[i][6] = true
			else
				metalSpots[i][6] = false
			end
		end
	end
end


function widget:DrawWorldPreUnit()
	if chobbyInterface then return end
	if spIsGUIHidden() then return end
	
	local clockDifference = (os.clock() - previousOsClock)
	previousOsClock = os.clock()

	gl.DepthTest(false)

	-- animate rotation
	if OPTIONS.rotationSpeed > 0 then
		local angleDifference = (OPTIONS.rotationSpeed) * (clockDifference * 5)
		currentRotationAngle = currentRotationAngle + (angleDifference*0.66)
		if currentRotationAngle > 360 then
		   currentRotationAngle = currentRotationAngle - 360
		end
	
		currentRotationAngleOpposite = currentRotationAngleOpposite - angleDifference
		if currentRotationAngleOpposite < -360 then
		   currentRotationAngleOpposite = currentRotationAngleOpposite + 360
		end
	end

	if spotList then
		gl.DeleteList(spotList)
	end
	spotList = gl.CreateList(function()
		gl.Rotate(currentRotationAngle, 0,1,0)
		gl.Color(1, 1, 1, 0.25)
		gl.CallList(circleList)

		gl.Rotate(-currentRotationAngle*2, 0,1,0)
		gl.Scale(1.18, 1.18, 1.18)
		gl.Color(1, 1, 1, 0.45)
		gl.CallList(circleList)

		gl.Rotate(currentRotationAngle, 0,1,0)
		gl.Billboard()
	end)
	for i = 1, #metalSpots do
		local spot = metalSpots[i]
		if not spot[6] and spIsSphereInView(spot[1], spot[2], spot[3], spot[4]) then
			gl.PushMatrix()
			gl.Translate(spot[1], spot[2], spot[3])
			gl.Scale(21*spot[5],21*spot[5],21*spot[5])
			gl.CallList(spotList)
			gl.CallList(valueList[spot[4]])
			gl.PopMatrix()
		end
    end

    gl.DepthTest(true)
    gl.Color(1,1,1,1)
end