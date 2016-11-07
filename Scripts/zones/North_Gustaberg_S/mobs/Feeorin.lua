-----------------------------------
-- Area: Crystal War - North Gustaberg [S]
-- MOB: Feeorin 
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn 
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn 
-----------------------------------

function onMobSpawn(mob)
end;

----------------------------------- 
-- onMobDespawn                     
----------------------------------- 
function onMobDespawn(mob)          
end;
----------------------------------- 
-- onMobDeath                       
----------------------------------- 

function onMobDeath(mob, player, isKiller)
    player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    
end;

