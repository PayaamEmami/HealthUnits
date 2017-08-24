-- [[ FormatNumber: Formats the number argument and returns the formatted version (Ex: 6583984 -> 6.58M)]]
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
        convertedNumber = string.format("%.0f", (num / 1000)) .. "k"
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
        -- Converts numbers and stores into variables
        PlayerHealth = FormatNumber(UnitHealth("player"))
        PlayerMana = FormatNumber(UnitMana("player"))

        TargetHealth = FormatNumber(UnitHealth("target"))
        TargetMana = FormatNumber(UnitMana("target"))

        FocusHealth = FormatNumber(UnitHealth("focus"))
        FocusMana = FormatNumber(UnitMana("focus"))

        -- Updates the frames with formatted values
        PlayerFrameHealthBar.TextString:SetText(PlayerHealth)
        PlayerFrameManaBar.TextString:SetText(PlayerMana)

        TargetFrameHealthBar.TextString:SetText(TargetHealth)
        TargetFrameManaBar.TextString:SetText(TargetMana)

        FocusFrameHealthBar.TextString:SetText(FocusHealth)
        FocusFrameManaBar.TextString:SetText(FocusMana)
    end
)
