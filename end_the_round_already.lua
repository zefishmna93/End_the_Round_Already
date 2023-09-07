local radarDelay = CreateConVar("ttt_end__the_round_radar_delay", 60, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "The time in seconds to delay after the min number of players are left to trigger the radar randomat")
local wallHackDelay = CreateConVar("ttt_end_the_round_wall_hack_delay", 120, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "The time in seconds to delay after the radar randomat triggers to trigger the wall hack randomat")
local minPlayers = CreateConVar("ttt_end_the_round_min_players", 2, {FCVAR_NOTIFY, FCVAR_ARCHIVE}, "The minimum number of players needed to be left alive before the randomats trigger")
local events = { "randomat_radarsforeveryone", "wallhack"}

hook.Add("PlayerDeath", "EndTheRound_PlayerDeath", function(victim, infl, attacker)
    if GetRoundState() != ROUND_ACTIVE then return end
    if timer.Exists("RadarDelay") then return end
    
    local plyCount = 0
    for _, p in ipairs(player.GetAll()) do
        if p:Alive() and not p:IsSpec() and p:GetRoleTeam() != ROLE_TEAM_JESTER then
            plyCount = plyCount + 1
        end
    end
    if plyCount > minPlayers:GetInt() then return end
    

    timer.Create("RadarDelay", radarDelay:GetInt(), 1, function()
        -- If one of these is running already, don't start a new one
        if not Randomat:IsEventActive(events[1]) then 
            Randomat:TriggerEvent(events[1])
        end

        
        timer.Create("WallHackDelay", wallHackDelay:GetInt(), 1, function()
            if not Randomat:IsEventActive(events[2]) then
                Randomat:EndActiveEvent("randomat_radarsforeveryone", true) 
                Randomat:TriggerEvent(events[2])
            end
        end)
    end)
end)

hook.Add("TTTEndRound", "SpectatorRandomats_TTTEndRound", function()
    timer.Remove("RadarDelay")
    timer.Remove("WallHackDelay")
end)