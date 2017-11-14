
local temp1 = 1 
   RegisterServerEvent("buttonAndGroup")
AddEventHandler("buttonAndGroup", function(inputGroup, input)
 
 file = io.open("C:\\server-data\\resources\\test3\\temp.txt", "a")
 file:write("\n \" button group:\" "..inputGroup.." \" button number:\" "..input)
 file:close()
end)


   RegisterServerEvent('markers')
AddEventHandler('markers', function(markBlipType, markType, X, Y, Z)
 local createthread = "Citizen.CreateThread(function()"
 local setlocalvar = "\n local temp"
       setlocalvar2 = "temp"
 local temp1 = temp1+1
 local appendnumtolocalvar = temp1 
 local a1B = " = " 
 local addblip = "AddBlipForCoord("
 local closeline = ")" 
 local setmarkblipsprite = "\n SetBlipSprite("
 local num521 = ", "..markBlipType

 local a7 = ""

 local whileloop = "\n    while true do"
 local citwait = "\n      Citizen.Wait(0)"
 local drawmark = "\n     DrawMarker("
 local searater = ", "
 local closedrawmark = ", 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )"
 local endwhileloop = "\n    end"
 local closethread = "\n end)\n"
-----------------------------------------------------------------------
-----------------------------------------------------------------------
 file = io.open("C:\\server-data\\resources\\test3\\menu3.lua", "a")
 file:write(createthread..setlocalvar..appendnumtolocalvar..a1B..addblip..X..searater..Y..searater..Z..closeline..setmarkblipsprite..setlocalvar2..appendnumtolocalvar..num521..closeline..whileloop..citwait..drawmark..markType..searater..X..searater..Y..searater..Z..closedrawmark..endwhileloop..closethread)
 file:close()
 end)
 
 