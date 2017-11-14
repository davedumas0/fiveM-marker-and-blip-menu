controlPressed = 0
markerXSize = 1.5
markerYSize = 1.5
markerZSize = 1.5
Citizen.CreateThread(function ()
 while true do
 Citizen.Wait(0)
  if DoesBlipExist(markBlip) then 
   markerBlipTable.markerBlipType = markBlipType
   markerBlipTable.markerBlip = markBlip
  end
 end
end)
markcoords = {}
markerTable = {}
markerBlipTable = {}

local options = {
    x = 0.11,
    y = 0.2,
    width = 0.22,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "mission creator menu",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}
----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------this gets info about spawned entity and player----------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
ghg = 0
Citizen.CreateThread(function()	

  while true do

  markerTableLength = #markerTable
     Citizen.Wait(0)
 
  for ghg = 0, 31 do  
	 for hgh = 7, 11 do
	    if IsControlPressed(ghg, hgh) then
		  ghg00 = ghg
		  hgh00 = hgh
         --Notify("control pressed is: "..tostring(ghg00).." "..tostring(hgh00))
	     --Citizen.Trace("control pressed is: "..ghg00.." "..hgh00)
		 --TriggerServerEvent('buttonAndGroup', ghg00, hgh00)
	    end
	  end
	 for hgh1 = 14, 66 do
	    if IsControlPressed(ghg, hgh1) then
		  ghg01 = ghg
		  hgh01 = hgh1
         --Notify("control pressed is: "..tostring(ghg01).." "..tostring(hgh01))
	     --Citizen.Trace("control pressed is: "..ghg01.." "..hgh01)
		 --TriggerServerEvent('buttonAndGroup', ghg01, hgh01)
	    end
	  end
	 for hgh2 = 70, 94 do
	    if IsControlPressed(ghg, hgh2) then
		  ghg02 = ghg
		  hgh02 = hgh2
         --Notify("control pressed is: "..tostring(ghg02).." "..tostring(hgh02))
	     --Citizen.Trace("control pressed is: "..ghg02.." "..hgh02)
		 --TriggerServerEvent('buttonAndGroup', ghg02, hgh02)
	    end
	  end	  
	 for hgh3 = 96, 220 do
	    if IsControlPressed(ghg, hgh3) then
		 hgh03 = hgh3
		 ghg03 = ghg
         --Notify("control pressed is: "..tostring(ghg03).." "..tostring(hgh03))
	     --Citizen.Trace("control pressed is: "..ghg03.." "..hgh03)
		 --TriggerServerEvent('buttonAndGroup', ghg03, hgh03)
	    end
	  end
	 for hgh4 = 222, 238 do
	    if IsControlPressed(ghg, hgh4) then
		 hgh04 = hgh4
		 ghg04 = ghg
         --Notify("control pressed is: "..tostring(ghg04).." "..tostring(hgh04))
	     --Citizen.Trace("control pressed is: "..ghg04.." "..hgh04)
	     --TriggerServerEvent('buttonAndGroup', ghg04, hgh04)
		end
	  end
	 for hgh4 = 241, 345 do
	    if IsControlPressed(ghg, hgh4) then
		 hgh04 = hgh4
		 ghg04 = ghg
         --Notify("control pressed is: "..tostring(ghg04).." "..tostring(hgh04))
	     --Citizen.Trace("control pressed is: "..ghg04.." "..hgh04)
	     --TriggerServerEvent('buttonAndGroup', ghg04, hgh04)
		end
	  end	  
  end

	 playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)
	 playerCoordsX = playerCoords.x
	 playerCoordsY = playerCoords.y
	 playerCoordsZ = playerCoords.z
	 playerHeading = GetEntityHeading(GetPlayerPed(PlayerId()))
-----------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------this checks if the spawned entity exists and moves it as player pushes buttons---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------

 
--if left shift is pressed then movement speed is slower
	if IsControlPressed(0, 21) then
	
      	moveSpeed = 0.01
		moveSpeed1 = 0.2
    else 
        moveSpeed = 0.1
		moveSpeed1 = 1.3
	end
	 
	 if IsControlPressed(0, 213) then
  coordsX = playerCoordsX
  coordsY = playerCoordsY
  coordsZ = playerCoordsZ
	 end
	 if markerLoop and IsControlPressed(0, 21) then  
       minusCoords = 0.3
	 else
	   minusCoords = 10.3
	 end	 
--left key
-- if control "left" key is pressed then it adds 0.01 to the x coord
	 if markerLoop and IsControlPressed(1, 174) then  
       coordsX = coordsX - minusCoords
	 end	 
--right key
-- if control "right" key is pressed then it subtract's 0.01 from the x coord
	 if markerLoop and IsControlPressed(1, 175) then
       coordsX = coordsX + minusCoords
	 end
--pageup
-- if control "pageUp" key is pressed then it adds 0.01 to the z coord
	 if markerLoop and IsControlPressed(1, 10) then
       coordsZ = coordsZ + minusCoords
	 end
--pagedown
-- if control "pageDown" key is pressed then it subtract's 0.01 from the z coord
	 if markerLoop and IsControlPressed(0, 11) then	 
		coordsZ = coordsZ - minusCoords		
	 end	
--up key
-- if control "up" key is pressed then it subtract's 0.01 from the y coord
	 if markerLoop and IsControlPressed(0, 27) then
       coordsY = coordsY - minusCoords
	 end
--down key
-- if control "down" key is pressed then it adds 0.01 to the y coord
	 if markerLoop and IsControlPressed(0, 173) then
	   coordsY = coordsY + minusCoords			
	  end   
-- if control "num +" key is pressed then it adds 1 to markerType
	 if markerLoop and IsControlJustPressed(0, 96) then
	  if markType <30 then
	   markType = markType + 1			
	  end
	 end   
-- if control "num -" key is pressed then it subtract's 1 to markerType
	 if markerLoop and IsControlJustPressed(0, 97) then
	  if markType >0 then
	   markType = markType - 1			
	  end
	 end
-- if control "-" key is pressed then it subtract's 1 to markerType
	 if markerLoop and IsControlJustPressed(0, 84) then
	  if markBlipType >0 then
	   markBlipType = markBlipType - 1			
	  end
	 end
-- if control "=" key is pressed then it adds 1 to markerType
	 if markerLoop and IsControlJustPressed(0, 83) then
	  if markBlipType < 560 then
	   markBlipType = markBlipType + 1			
	  end
	 end
 
	 if not IsControlPressed(0, 21) then
	  if IsControlPressed(0, 19) and IsControlPressed(1, 82) then
	   markerYSize = markerYSize - 0.1
	  end
	 end	 
	 if IsControlPressed(0, 21) and IsControlPressed(1, 81) then
	   markerYSize = markerYSize + 0.1
     elseif IsControlPressed(0, 21) and IsControlPressed(1, 82) then
	   markerYSize = markerYSize - 0.1			
	 end 
	 if not IsControlPressed(0, 21) and not IsControlPressed(0, 19) then
	  if IsControlPressed(1, 81) then
      markerXSize = markerXSize + 0.1
	  end
	 end
	 if not IsControlPressed(0, 21) and not IsControlPressed(0, 19) then
	  if IsControlPressed(1, 82) then
      markerXSize = markerXSize - 0.1
	  end
	 end	 
	 if IsControlPressed(0, 21) then
	  if IsControlPressed(0, 19) and IsControlPressed(1, 82) then
	   markerZSize = markerZSize - 0.1
	  end
	 end
	 if IsControlPressed(0, 21) then
	  if IsControlPressed(0, 19) and IsControlPressed(1, 82) then
	   markerYSize = markerZSize + 0.1
	  end
	 end
	end 
    
end)



function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end

--[[*************************************************************]]
------------------------------------------------------------------
--------------------------main menu-------------------------------
------------------------------------------------------------------
--[[*************************************************************]]
function Main()
markerVisible = false
    markType = 0
	markBlipType = 560
    markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "mission creator"
    options.menu_subtitle = "~o~main menu"
    ClearMenu()
    Menu.addButton("~y~marker creator ~b~menu", "markerLoop0", nil)
end
function markerLoop0()
    markerVisible = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "mission creator menu"
    options.menu_subtitle = "~o~mission marker menu"
    ClearMenu()
	Menu.addButton("~y~draw marker", "markerLoop1", nil)
    Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)
end
function markerLoop1()
  Notify("markerBlipType "..tostring(markerBlipTable.markerBlipType))
  markerVisible = true
  coordsX = playerCoordsX
  coordsY = playerCoordsY
  coordsZ = playerCoordsZ
 markerLoop = true
Citizen.CreateThread(function()
    markBlip = AddBlipForCoord(coordsX,coordsY,coordsZ)
    SetBlipAsShortRange(markBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("temp")
    EndTextCommandSetBlipName(markBlip)  
 while markerLoop do
  markcoords.X = coordsX
  markcoords.Y = coordsY
  markcoords.Z = coordsZ 
  marksizeX = markerXSize
  marksizeY = markerYSize
  marksizeZ = markerZSize
   Citizen.Wait(0)
  DrawMarker(markType, markcoords.X, markcoords.Y, markcoords.Z, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, marksizeX, marksizeY, marksizeZ, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    drawMarkerCoords(markcoords.X, markcoords.Y, markcoords.Z)
    SetBlipSprite(markBlip, markBlipType)
    SetBlipCoords(markBlip, markcoords.X, markcoords.Y, markcoords.Z)
  if IsControlJustPressed(1, 177) then 
   if DoesBlipExist(markBlip) then
    RemoveBlip(markBlip)
   end
   Main()
  end  
 end
end)
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press backspace to ~r~cancel")
    options.menu_title = "my menyoo"
    options.menu_subtitle = "~o~main menu 3"
    ClearMenu()
    Menu.addButton("~b~save marker location", "saveMarker", nil)
end


function saveMarker()
      markerVisible = true
    addMarkerToTable()
	--markerLoop = false
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "mission creator menu"
    options.menu_subtitle = "~o~mission marker menu"
    ClearMenu()
    Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)
end
num = 1
function addMarkerToTable()	

markcoords.X = coordsX
markcoords.Y = coordsY
markcoords.Z = coordsZ
	Citizen.Wait(0)
	
	TriggerServerEvent('markers', markBlipType, markType, markcoords.X, markcoords.Y, markcoords.Z)
	TriggerServerEvent("startmarkers", true)
end


--[[*************************************************************]]
------------------------------------------------------------------
-----------------------other stuff-------------------
------------------------------------------------------------------
--[[*************************************************************]]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press F5 to open/close menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)	
                    if IsControlJustReleased(1, 168) then
                        Main() -- Menu to draw
                        Menu.hidden = not Menu.hidden -- Hide/Show the menu
						      if DoesBlipExist(markBlip) then
                               RemoveBlip(markBlip)
                              end 
                    end
                    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
                end       
end)

function drawMarkerCoords(X, Y, Z)
 x = X
 y = Y
 z = Z
end

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if markerVisible~=false then 	 
  local position = "marker x coords: "..tostring(x)
  local offset = {x = 0.290, y = 0.850}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 0.5
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	 end  	  
	end		
end)
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if markerVisible~=false then 	  
  local position = "marker y coords: "..tostring(y)
  local offset = {x = 0.290, y = 0.830}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 0.5
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if markerVisible~=false then 	  
  local position = "marker z coords: "..tostring(z)
  local offset = {x = 0.290, y = 0.810}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 0.5
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if markerVisible~=false then 	  
  local position = "marker blip type: "..tostring(markBlipType)
  local offset = {x = 0.700, y = 0.1024}
  local rgb = {r = 25, g = 50, b = 220}
  local alpha = 255
  local scale = 0.2
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)
---------------------------------------------------------------------------------------------------------------------------
--bunker blip sprit id's {565, 564}

Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(804.42199707031, -3010.1801269531, -40.795426177978)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, 804.42199707031, -3010.1801269531, -40.795426177978, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(1101.5930175781, -3003.4763183594, -39.900534057617)
 SetBlipSprite(temp2, 66)
    while true do
      Citizen.Wait(0)
     DrawMarker(28, 1101.5930175781, -3003.4763183594, -39.900534057617, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(974.42424316408, -3000.8261230468, -35.562767028809)
 SetBlipSprite(temp2, 66)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 974.42424316408, -3000.8261230468, -35.562767028809, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(402.89709472656, -964.87854003906, -99.004180908203)
 SetBlipSprite(temp2, 474)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 402.89709472656, -964.87854003906, -99.004180908203, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)

Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(308.93092651367, -998.05611572266, -94.195205688477)
 SetBlipSprite(temp2, 375)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 308.93092651367, -998.05611572266, -94.195205688477, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(258.90057373047, -996.93989257813, -98.697715759277)
 SetBlipSprite(temp2, 375)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 258.90057373047, -996.93989257813, -98.697715759277, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(228.82740783691, -997.54565429688, -98.697700500488)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 228.82740783691, -997.54565429688, -98.697700500488, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(377.14212036133, -1008.7520874023, -98.69303894043)
 SetBlipSprite(temp2, 102)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 377.14212036133, -1008.7520874023, -98.69303894043, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(198.39839172363, -1019.3025512695, -98.999992370605)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 198.39839172363, -1019.3025512695, -98.999992370605, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(200.35911560059, -999.96746826172, -98.99991607666)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 200.35911560059, -999.96746826172, -98.99991607666, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(403.35256958008, -997.36779785156, -99.000244140625)
 SetBlipSprite(temp2, 280)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 403.35256958008, -997.36779785156, -99.000244140625, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-800.34017333984, 339.75618286133, 158.59896850586)
 SetBlipSprite(temp2, 375)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -800.34017333984, 339.75618286133, 158.59896850586, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-792.74711914063, 339.54885864258, 206.21823120117)
 SetBlipSprite(temp2, 371)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -792.74711914063, 339.54885864258, 206.21823120117, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-209.26104736333, 305.97191772461, 95.223571777344)
 SetBlipSprite(temp2, 58)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -209.26104736333, 305.97191772461, 95.223571777344, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(959.91900939941, -3000.3303222656, 96.947174072266)
 SetBlipSprite(temp2, 419)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 959.91900939941, -3000.3303222656, 40.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(847.1547241211, 3121.5551757813, 40.144426345825)
 SetBlipSprite(temp2, 401)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 847.1547241211, 3121.5551757813, 40.144426345825, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-1833.9641113281, 3294.8911132813, -38.9513671875)
 SetBlipSprite(temp2, 400)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -1833.9641113281, 3294.8911132813, -38.9513671875, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-1516.5516601563, -3264.6349609376, -300.80566101074)
 SetBlipSprite(temp2, 388)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -1516.5516601563, -3264.6349609376, -300.80566101074, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-1315.4859130859, -3072.3915039063, -54.562936401367)
 SetBlipSprite(temp2, 396)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -1315.4859130859, -3072.3915039063, -54.562936401367, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(988.05462646484, -97.991850280761, 73.346481323242)
 SetBlipSprite(temp2, 348)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, 988.05462646484, -97.991850280761, 73.346481323242, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-136.07287597656, -630.18206787109, 135.09765014648)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, -136.07287597656, -630.18206787109, 135.09765014648, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-117.49379730225, -568.11627197266, 135.39765014648)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, -117.49379730225, -568.11627197266, 135.39765014648, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-191.00825500488, -579.14587402344, 135.99766540527)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, -191.00825500488, -579.14587402344, 135.99766540527, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(172.8853302002, -1005.6874389648, -98.999977111816)
 SetBlipSprite(temp2, 369)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, 172.8853302002, -1005.6874389648, -98.999977111816, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-1253.6600341797, -2998.8000488281, -48.107715606689)
 SetBlipSprite(temp2, 474)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, -1253.6600341797, -2998.8000488281, -48.107715606689, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(1094.9801025391, -3101.7758789063, -39.002712249756)
 SetBlipSprite(temp2, 474)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 1094.9801025391, -3101.7758789063, -39.002712249756, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)

Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(414.39008789062, -977.62189331054, -99.005057525634)
 SetBlipSprite(temp2, 498)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, 414.39008789062, -977.62189331054, -99.005057525634, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(1657.54296875, 4838.9516601563, 41.123391723633)
 SetBlipSprite(temp2, 498)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, 1657.54296875, 4838.9516601563, 41.123391723633, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(814.74658203125, -93.68635559082, 79.399029541016)
 SetBlipSprite(temp2, 498)
    while true do
      Citizen.Wait(0)
     DrawMarker(1, 814.74658203125, -93.68635559082, 79.399029541016, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)

Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-3029.7143554688, 23.545057296753, 10.118409156799)
 SetBlipSprite(temp2, 560)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -3029.7143554688, 23.545057296753, 10.118409156799, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
Citizen.CreateThread(function()
 local temp2 = AddBlipForCoord(-1493.1330566406, -385.87356567383, 39.852191925049)
 SetBlipSprite(temp2, 560)
    while true do
      Citizen.Wait(0)
     DrawMarker(0, -1493.1330566406, -385.87356567383, 39.852191925049, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
    end
 end)
