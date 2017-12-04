local canHandsUp = true
local GUI							= {}
GUI.Time							= 0

AddEventHandler("handsup:toggle", function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()
	local handsup = false
	while true do
		Wait(0)
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("random@mugging3")
		if canHandsUp then
			if (IsControlPressed(1, Config.handsUP.clavier) and (GetGameTimer() - GUI.Time) > 150) or ((IsControlPressed(2, Config.handsUP.manette1) and IsControlPressed(2, Config.handsUP.manette2)) and (GetGameTimer() - GUI.Time) > 150) then
				if handsup then
					if DoesEntityExist(lPed) then
						Citizen.CreateThread(function()
							RequestAnimDict("random@mugging3")
							while not HasAnimDictLoaded("random@mugging3") do
								Citizen.Wait(100)
							end

							if handsup then
								handsup = false
								ClearPedSecondaryTask(lPed)
                                TriggerServerEvent("esx_thief:update", handsup)
							end
						end)
					end
				else
					if DoesEntityExist(lPed) then
						Citizen.CreateThread(function()
							RequestAnimDict("random@mugging3")
							while not HasAnimDictLoaded("random@mugging3") do
								Citizen.Wait(100)
							end

							if not handsup then
								handsup = true
								TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
                                TriggerServerEvent("esx_thief:update", handsup)
							end
						end)
					end
				end
				
				GUI.Time  = GetGameTimer()
			end

		end
	end
end)