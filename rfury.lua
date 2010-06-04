if(select(2, UnitClass'player') ~= 'PALADIN') then return end

local eventer = CreateFrame("Frame", nil, UIParent);
local eventex = eventer:CreateTexture(nil,"LOW")
eventex:SetTexCoord(0.1,0.9,0.1,0.9)

local bg = eventer:CreateTexture(nil,"BACKGROUND")
bg:SetTexture(0,0,0,1)

eventer:RegisterEvent("PLAYER_ENTERING_WORLD")
eventer:RegisterEvent("UNIT_AURA")

eventer:SetScript("OnEvent", function()
	local baseDefense, armorDefense = UnitDefense("player")
	if((armorDefense > 0 and not(UnitBuff("player","Righteous Fury"))))then
		if(UnitIsDeadOrGhost("player") ~= 1)then
			eventer:Show()
			eventex:SetTexture("Interface\\Icons\\Spell_holy_sealoffury")
		else
			eventer:Hide()
		end
	else
		eventer:Hide()
	end
end)

eventex:SetAllPoints(eventer)
bg:SetPoint("TOPLEFT", eventer, "TOPLEFT", -1, 1)
bg:SetPoint("BOTTOMRIGHT", eventer, "BOTTOMRIGHT", 1, -1)
eventer:SetWidth(30)
eventer:SetHeight(30)
eventer:SetPoint("CENTER", -155, -270)






