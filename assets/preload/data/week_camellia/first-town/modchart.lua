-- 1.41secs per section
-- 0.70secs per section/2
-- 0.35secs per section/4

local swaySlowDefault = false 
local swaySlowCentreCam = false 
local swaySlowCentreBF = false 

local swayScreenBF = false
local swayScreenLargerBF = false

local swayFast = false 
local swayFastCentreCam = false 

local swayIntense = false 
local swayIntenseSwapped = false 
local swayIntense2 = false 
local swayIntense3 = false 

local receptor = null
local R0 = null 
local R1 = null 
local R2 = null 
local R3 = null 
local R4 = null 
local R5 = null 
local R6 = null 
local R7 = null 

local currentBeat = null

function songStart()
    R0 = _G['receptor_0']
    R1 = _G['receptor_1']
    R2 = _G['receptor_2']
    R3 = _G['receptor_3']
    R4 = _G['receptor_4']
    R5 = _G['receptor_5']
    R6 = _G['receptor_6']
    R7 = _G['receptor_7']
end

function update(elapsed)
    if swaySlowDefault then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat))
        end
    end
    if swaySlowCentreCam then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 32 * math.sin((currentBeat)) + 320
        end
    end
    if swaySlowCentreBF then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 32 * math.sin((currentBeat)) - 320
        end
    end
    if swayScreenBF then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 320 * math.sin((currentBeat)) - 320
            receptor.y = receptor.defaultY - 48 * math.cos((currentBeat + i*6) * math.pi)
        end
    end
    if swayScreenLargerBF then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 480 * math.sin((currentBeat)) - 320
            receptor.y = receptor.defaultY - 64 * math.cos((currentBeat + i*6) * math.pi)
        end
    end
    if swayFast then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 64 * math.sin((currentBeat))
        end
    end
    if swayFastCentreCam then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 128 * math.sin((currentBeat)) + 320
        end
    end
    if swayIntenseDefault then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 64 * math.sin((currentBeat))
            receptor.y = receptor.defaultY - 16 * math.sin((currentBeat + i*32) * math.pi)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 64 * math.sin((currentBeat))
            receptor.y = receptor.defaultY - 16 * math.sin((currentBeat + i*32) * math.pi)
        end
    end
    if swayIntenseSwapped then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 64 * math.sin((currentBeat)) + 640
            receptor.y = receptor.defaultY - 16 * math.sin((currentBeat + i*32) * math.pi)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 64 * math.sin((currentBeat)) - 640
            receptor.y = receptor.defaultY - 16 * math.sin((currentBeat + i*32) * math.pi)
        end
    end
    if swayIntenseDefault2 then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 80 * math.sin((currentBeat))
            receptor.y = receptor.defaultY - 32 * math.sin((currentBeat + i*32) * math.pi)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 80 * math.sin((currentBeat))
            receptor.y = receptor.defaultY - 32 * math.sin((currentBeat + i*32) * math.pi)
        end
    end
    if swayIntenseDefault3 then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 320 * math.sin((currentBeat)) + 320
            receptor.y = receptor.defaultY - 32 * math.sin((currentBeat + i*32) * math.pi)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 320 * math.sin((currentBeat)) - 320
            receptor.y = receptor.defaultY - 32 * math.sin((currentBeat + i*32) * math.pi)
        end
    end
end

function stepHit(step)
-- Flying Up Arrow
    if step == 128 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.y, 0.35)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.35)
        end
        R4:tweenAlpha(0, 0.35)
        R5:tweenAlpha(0, 0.35)
        R6:tweenAlpha(0, 5.64)
        R7:tweenAlpha(0, 0.35)
    end
    if step == 132 then 
        swaySlowCentreCam = true 
        swayScreenBF = true 
    end
    if step == 208 then 
        swayScreenBF = false 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX
            receptor.y = receptor.defaultY
        end
    end
    if step == 248 then 
        swaySlowCentreCam = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.70)
            receptor.tweenAngle(receptor, receptor.angle - 360, 0.70)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.70)
        end
    end
-- Normal Swaying
    if step == 256 then 
        swaySlowDefault = false 
    end
-- Flying Up Arrow (Drop)
    if step == 384 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.y, 0.35)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.35)
        end
        R4:tweenAlpha(0, 0.35)
        R5:tweenAlpha(0, 0.35)
        R6:tweenAlpha(0, 5.64)
        R7:tweenAlpha(0, 0.35)
    end
    if step == 388 then 
        swaySlowCentreCam = true 
        swayScreenBF = true 
    end
    if step == 448 then 
        swaySlowCentreCam = false  
        swayScreenBF = false  
        swayFastCentreCam = true
        swayScreenLargerBF = true 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 5.64)
        end
    end
    if step == 496 then 
        swayFastCentreCam = false 
        swayScreenLargerBF = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.35)
            receptor.tweenAngle(receptor, receptor.angle - 360, 0.35)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.35)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.35)
        end
    end
-- First Chorus 
    if step == 512 then 
        swayFast = true 
    end
    -- Flickering Notes On Arrow Press
    if step == 571 then 
        R0.alpha = 0 
        R7.alpha = 0
    end
    if step == 572 then 
        R0.alpha = 1 
        R7.alpha = 1 
        R1.alpha = 0 
        R6.alpha = 0 
    end
    if step == 573 then 
        R1.alpha = 1 
        R6.alpha = 1 
        R2.alpha = 0 
        R5.alpha = 0 
    end
    if step == 574 then 
        R2.alpha = 1 
        R5.alpha = 1 
        R3.alpha = 0 
        R4.alpha = 0 
    end
    if step == 575 then 
        R3.alpha = 1 
        R4.alpha = 1 
        R2.alpha = 0 
        R5.alpha = 0 
    end
    if step == 576 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 1 
        end
    end
    -- Flickering Notes on Arrow Press Part 2
    if step == 699 then 
        R0.alpha = 0 
        R7.alpha = 0
    end
    if step == 700 then 
        R0.alpha = 1 
        R7.alpha = 1 
        R1.alpha = 0 
        R6.alpha = 0 
    end
    if step == 701 then 
        R1.alpha = 1 
        R6.alpha = 1 
        R2.alpha = 0 
        R5.alpha = 0 
    end
    if step == 702 then 
        R2.alpha = 1 
        R5.alpha = 1 
        R3.alpha = 0 
        R4.alpha = 0 
    end
    if step == 703 then 
        R3.alpha = 1 
        R4.alpha = 1 
        R2.alpha = 0 
        R5.alpha = 0 
    end
    if step == 704 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 1 
        end
    end
-- Swapping Sides! 
    if step == 760 then 
        swayFast = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.defaultY, 0.70)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.70)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.defaultY, 0.70)
            receptor.tweenAngle(receptor, receptor.angle - 360, 0.70)
        end
    end
    if step == 768 then 
        swayIntenseSwapped = true 
    end
-- Swap Back! 
    if step == 888 then 
        swayIntenseSwapped = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.70)
            receptor.tweenAngle(receptor, receptor.angle - 360, 0.70)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.70)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.70)
        end
    end
    if step == 896 then 
        swayIntenseDefault = true 
    end
--Blinky Blinky Part 
    if step == 1024 then 
        swayIntenseDefault = false
        for i = 4, 7 do  
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.defaultY, 0.35)
        end
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 0 
        end
        R0.x = R0.defaultX
        R1.x = R1.defaultX + 60 
        R2.x = R2.defaultX + 580
        R3.x = R3.defaultX + 640 
    end
    if step == 1028 then 
        swaySlowCentreBF = true 
    end
-- Blinking Part for Cam
    -- left arrow
    if step == 1073 
    or step == 1121 
    or step == 1185 
    or step == 1201 
    or step == 1239
    or step == 1273 then 
        R0.alpha = 1
    end
    if step == 1074 
    or step == 1122
    or step == 1186 
    or step == 1202 
    or step == 1240 
    or step == 1274 then 
        R0:tweenAlpha(0, 0.35)
    end
    -- down arrow
    if step == 1057 
    or step == 1079 
    or step == 1111 
    or step == 1133 
    or step == 1153 
    or step == 1207 then 
        R1.alpha = 1
    end
    if step == 1058 
    or step == 1080 
    or step == 1112 
    or step == 1134 
    or step == 1154 
    or step == 1208 then 
        R1:tweenAlpha(0, 0.35)
    end
    -- up arrow
    if step == 1089 
    or step == 1149 
    or step == 1217 
    or step == 1261 then 
        R2.alpha = 1
    end
    if step == 1090 
    or step == 1150 
    or step == 1218 
    or step == 1262 then 
        R2:tweenAlpha(0, 0.35)
    end
    -- right arrow
    if step == 1047 
    or step == 1105 
    or step == 1145 
    or step == 1175 
    or step == 1233 
    or step == 1249 
    or step == 1277 then 
        R3.alpha = 1
    end
    if step == 1048 
    or step == 1106 
    or step == 1146 
    or step == 1176 
    or step == 1234 
    or step == 1250 
    or step == 1278 then 
        R3:tweenAlpha(0, 0.35)
    end
-- Slow Return to Centre 
    if step == 1280 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 5.64)
            receptor.tweenAlpha(receptor, 1, 5.64)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 5.64)
        end
    end
-- Bridge
    if step == 1400 then 
        swaySlowCentreBF = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.70)
            receptor.tweenAlpha(receptor, 1, 0.70)
        end
    end
-- Flying Up Arrow (Drop) Again 
    if step == 1536 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.y, 0.35)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.35)
        end
        R4:tweenAlpha(0, 0.35)
        R5:tweenAlpha(0, 0.35)
        R6:tweenAlpha(0, 5.64)
        R7:tweenAlpha(0, 0.35)
    end
    if step == 1540 then 
        swaySlowCentreCam = true 
        swayScreenBF = true 
    end
    if step == 1600 then 
        swaySlowCentreCam = false  
        swayScreenBF = false  
        swayFastCentreCam = true
        swayScreenLargerBF = true 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 5.64)
        end
    end
    if step == 1656 then 
        swayFastCentreCam = false 
        swayScreenLargerBF = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.35)
            receptor.tweenAngle(receptor, receptor.angle - 360, 0.35)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.35)
            receptor.tweenAngle(receptor, receptor.angle + 360, 0.35)
        end
    end
-- Chorus 
    -- blinking arrows 
    if step == 1664 
    or step == 1667 
    or step == 1670 
    or step == 1676
    or step == 1679 
    or step == 1682 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 1
        end
    end
    if step == 1665 
    or step == 1668 
    or step == 1677 
    or step == 1680 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0.3, 0.1)
        end
    end
    if step == 1671 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0.3, 0.35)
        end
    end
    -- Normal Chorus 
    if step == 1700 then 
        swayIntenseDefault2 = true 
    end
    if step == 1788 then 
        swayIntenseDefault2 = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.35)
        end
    end
    -- blinking arrows 
    if step == 1795 
    or step == 1798 
    or step == 1801 
    or step == 1804 
    or step == 1807 
    or step == 1810 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 1
        end
    end
    if step == 1792 
    or step == 1796 
    or step == 1799 
    or step == 1802 
    or step == 1805 
    or step == 1808 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0.3, 0.10)
        end
    end
    if step == 1824 then 
        swayIntenseDefault2 = true 
    end
    if step == 1912 then 
        swayIntenseDefault2 = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.70)
        end
    end
-- Post Chorus 
    if step == 1920
    or step == 2056 then 
        swayIntenseDefault3 = true 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 1 
        end
    end
    if step == 2050 then 
        swayIntenseDefault3 = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.35)
        end
    end
    if step == 2176 then 
        swayIntenseDefault3 = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.41)
        end
    end
-- Last part 
    if step == 2192 then 
        swayIntenseDefault = true 
    end
    if step == 2304 then 
        swayIntenseDefault = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.41)
        end
    end
    if step == 2424 then 
        for i = 0, 6 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.70)
        end
    end
    if step == 2432 then 
        R7:tweenAlpha(0, 2.82)
    end
end