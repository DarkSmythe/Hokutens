-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(MOD_DEF, 30);
	mob:setMod(MOD_SLEEPRES, 400);
end;

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobEngaged(mob)
	mob:setMobMod(MOBMOD_RAGE, 3600);	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(BEHEMOTHS_BANE);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local Behemoth = mob:getID();
    local King_Behemoth = mob:getID()+1;
    local ToD = GetServerVariable("[POP]King_Behemoth");
    local kills = GetServerVariable("[PH]King_Behemoth");
    local popNow = (math.random(1,5) == 3 or kills > 6);

    if (LandKingSystem_HQ ~= 1 and ToD <= os.time(t) and popNow == true) then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if (LandKingSystem_NQ == 0) then
            DeterMob(Behemoth, true);
        end

        DeterMob(King_Behemoth, false);
        UpdateNMSpawnPoint(King_Behemoth);
        GetMobByID(King_Behemoth):setRespawnTime(math.random(75600,86400));
    else
        if (LandKingSystem_NQ ~= 1) then
            UpdateNMSpawnPoint(Behemoth);
            mob:setRespawnTime(math.random(75600,86400));
            SetServerVariable("[PH]King_Behemoth", kills + 1);
        end
    end
end;