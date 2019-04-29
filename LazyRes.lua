local HealComm = nil;

local resSpell = "Redemption";

local _,playerClass = UnitClass("player");

if playerClass == "PRIEST" then
    resSpell = "Resurrection";
elseif playerClass == "SAHAMAN" then
    resSpell = "Ancestral Spirit";
end

-- local classcolors = { DRUID="FF7D0A", HUNTER="ABD473", MAGE="69CCF0", PALADIN="F58CBA", PRIEST="FFFFFF", ROGUE="FFF569", SHAMAN="F58CBA", WARLOCK="9482C9", WARRIOR="C79C6E" }

function LazyRes()

    if HealComm == nil then HealComm = AceLibrary("HealComm-1.0") end
    
    CastSpellByName(resSpell);
    
    local classOrder = {"SHAMAN", "PALADIN", "PRIEST", "DRUID", "MAGE", "HUNTER", "WARLOCK", "WARRIOR", "ROGUE"};
    
    for c=1,table.getn(classOrder) do
        for r=1,GetNumRaidMembers() do
            local raidId = "raid"..r;
            
            local _, raidClass = UnitClass(raidId);
    
            if UnitIsDead(raidId)
            and not UnitIsGhost(raidId)
            and not HealComm:UnitisResurrecting(UnitName(raidId))
            and raidClass == classOrder[c] then
                if SpellIsTargeting() and SpellCanTargetUnit(raidId) then
                    SpellTargetUnit(raidId);
                    -- DEFAULT_CHAT_FRAME:AddMessage("Resurrecting \124cFF"..classcolors[classOrder[c]].."\124Hitem:19:0:0:0:0:0 :0: \124h"..UnitName(raidId).."\124h\124r");
                end                
            end
        end
    end
end

SLASH_LAZYRES1 = "/lazyres";
SlashCmdList.LAZYRES = LazyRes