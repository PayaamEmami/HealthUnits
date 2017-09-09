-- [[ FormatNumber: Formats the number argument and returns the formatted version (Ex: 6583984 -> 6.58M) ]]
local FormatNumber = function(num)
    local convertedNumber

    -- Checks empty variable
    if not num then
        return 0
    elseif num >= 1000000000000 then
        -- Trillion
        convertedNumber = string.format("%.2f", (num / 1000000000000)) .. "T"
    elseif num >= 1000000000 then
        -- Billion
        convertedNumber = string.format("%.2f", (num / 1000000000)) .. "B"
    elseif num >= 1000000 then
        -- Million
        convertedNumber = string.format("%.2f", (num / 1000000)) .. "M"
    elseif num >= 1000 then
        -- Thousands
        convertedNumber = string.format("%.0f", (num / 1000)) .. "K"
    else
        -- Hundreds
        convertedNumber = num
    end

    return convertedNumber
end

-- [[ Updates the status text values to formatted numbers ]]
hooksecurefunc(
    "TextStatusBar_UpdateTextStringWithValues",
    function()
		-- Unformatted health/mana values (Ex: '29343920')
		PlayerHealth = UnitHealth("player")
		PlayerMana = UnitMana("player")
		
		TargetHealth = UnitHealth("target")
		TargetMana = UnitMana("target")
		
		FocusHealth = UnitHealth("focus")
		FocusMana = UnitMana("focus")
	
        -- Formatted health/mana values (Ex: '29.34M')
        FormattedPlayerHealth = FormatNumber(UnitHealth("player"))
        FormattedPlayerMana = FormatNumber(UnitMana("player"))

        FormattedTargetHealth = FormatNumber(UnitHealth("target"))
        FormattedTargetMana = FormatNumber(UnitMana("target"))

        FormattedFocusHealth = FormatNumber(UnitHealth("focus"))
        FormattedFocusMana = FormatNumber(UnitMana("focus"))

        -- Updates the frames with formatted values
        if(PlayerHealth > 0) then
            PlayerFrameHealthBar.TextString:SetText(FormattedPlayerHealth)
		end
        if(PlayerMana > 0) then
            PlayerFrameManaBar.TextString:SetText(FormattedPlayerMana)
        end
        
        if(TargetHealth > 0) then
            TargetFrameHealthBar.TextString:SetText(FormattedTargetHealth)
        end
        if(TargetMana > 0) then
            TargetFrameManaBar.TextString:SetText(FormattedTargetMana)
        end
        
        if(FocusHealth > 0) then
            FocusFrameHealthBar.TextString:SetText(FormattedFocusHealth)
        end
        if(FocusMana > 0) then
            FocusFrameManaBar.TextString:SetText(FormattedFocusMana)
        end
    end
)
