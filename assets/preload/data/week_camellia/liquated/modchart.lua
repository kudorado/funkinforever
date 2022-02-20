-- 1.71secs per section
-- 0.85secs per section/2
-- 0.42secs per section/4

local swaySlow = false 
local swaySlowCamCentre = false 
local swayIntenseDefault = false 
local swayIntenserDefault = false 
local swayScreenCam = false 

local fadingCam = false 
local faded = false

local waitForBeatFade = false 

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
    if swaySlowCamCentre then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat)) + 320
        end
    end
    if swaySlowSwapped then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat)) + 640
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat)) - 640
        end
    end
    if swayIntenseDefault then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 64 * math.sin((currentBeat))
            receptor.y = receptor.defaultY + 16 * math.cos((currentBeat + i*32) * math.pi)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 64 * math.sin((currentBeat))
            receptor.y = receptor.defaultY + 16 * math.cos((currentBeat + i*32) * math.pi)
        end
    end
    if swayIntenserDefault then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 80 * math.sin((currentBeat))
            receptor.y = receptor.defaultY - 32 * math.cos((currentBeat + i*32) * math.pi)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 80 * math.sin((currentBeat))
            receptor.y = receptor.defaultY - 32 * math.cos((currentBeat + i*32) * math.pi)
        end
    end
    if swayScreenCam then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 320 * math.sin((currentBeat)) + 320
            receptor.y = receptor.defaultY - 48 * math.cos((currentBeat + i*8) * math.pi)
        end
    end
    if fadingCam then 
        if curBeat % 2 == 0 and not waitForBeatFade then 
            waitForBeatFade = true 
            faded = not faded
            if faded then 
                for i = 0, 3 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 0.5, 0.85)
                end
            else
                for i = 0, 3 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 0.1, 0.85)
                end
            end
        end
    end
end

function beatHit(beat)
    waitForBeatFade = false 
end

function keyPressed(key)
    if curStep >= 1920 and curStep < 2176 then
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            if key == 'left' then 
                receptor.tweenPos(receptor, receptor.defaultX - 340, receptor.y, 0.05)
            elseif key == 'down' then  
                receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 20, 0.05)
            elseif key == 'up' then 
                receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 20, 0.05)
            elseif key == 'right' then 
                receptor.tweenPos(receptor, receptor.defaultX - 300, receptor.y, 0.05)
            end
        end
    end
    if curStep >= 2176 and curStep < 2416 then
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            if key == 'left' then 
                receptor.tweenPos(receptor, receptor.defaultX - 360, receptor.y, 0.05)
            elseif key == 'down' then  
                receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.05)
            elseif key == 'up' then 
                receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.05)
            elseif key == 'right' then 
                receptor.tweenPos(receptor, receptor.defaultX - 280, receptor.y, 0.05)
            end
        end
    end
end

function stepHit(step)
-- Moving Arrows for Cam 
    if step == 64 then 
        R0:tweenAlpha(0, 1.71)
        R1:tweenAlpha(0, 1.71)
        R3:tweenAlpha(0, 1.71)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 1.71)
        end
    end
    if step == 80 then 
        R1:tweenAlpha(1, 1.71)
        R2:tweenAlpha(0, 1.71)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 1.71)
        end
    end
    if step == 96 then 
        R1:tweenAlpha(0, 1.71)
        R3:tweenAlpha(1, 1.71)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 1.71)
        end
    end
    if step == 112 then 
        R2:tweenAlpha(1, 0.85)
        R3:tweenAlpha(0, 0.85)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.85)
        end
    end
    if step == 120 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.85)
            receptor.tweenAlpha(receptor, 1, 0.85)
        end
    end
-- Moving Arrows for BF
    if step == 128 then 
        R6:tweenAlpha(0, 1.71)
        R7:tweenAlpha(0, 1.71)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.y, 1.71)
        end
    end
    if step == 144 then 
        R4:tweenAlpha(0, 1.71)
        R6:tweenAlpha(1, 1.71)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 1.71)
        end
    end
    if step == 160 then 
        R5:tweenAlpha(0, 1.71)
        R4:tweenAlpha(1, 1.71)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 1.71)
        end
    end
    if step == 176 then 
        R4:tweenAlpha(0, 0.85)
        R5:tweenAlpha(1, 0.85)
        R6:tweenAlpha(0, 0.85)
        R7:tweenAlpha(1, 0.85)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.85)
        end
    end
    if step == 184 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.85)
            receptor.tweenAlpha(receptor, 1, 0.85)
        end
    end
-- Moving Arrows for Cam 
    if step == 188 then 
        for i = 1, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.42)
        end
    end
    if step == 192 then 
        R0:tweenAlpha(0, 1.71)
        R2:tweenAlpha(1, 1.71)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 1.71)
        end
    end
    if step == 208 then 
        R2:tweenAlpha(0, 1.71)
        R1:tweenAlpha(1, 1.71)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 1.71)
        end
    end
    if step == 224 then 
        R1:tweenAlpha(0, 1.71)
        R3:tweenAlpha(1, 1.71)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 1.71)
        end
    end
    if step == 240 then 
        R3:tweenAlpha(0, 0.85)
        R2:tweenAlpha(1, 0.85)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.85)
        end
    end
    if step == 248 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.85)
            receptor.tweenAlpha(receptor, 1, 0.85)
        end
    end
    -- Blinking Note for This Part
    if step == 210 
    or step == 214 
    or step == 218 
    or step == 238 then 
        R0.alpha = 1
    end
    if step == 211 
    or step == 215 
    or step == 219 
    or step == 239 then 
        R0:tweenAlpha(0, 0.3)
    end
    -- down arrow 
    if step == 206 
    or step == 242 
    or step == 246 then 
        R1.alpha = 1
    end
    if step == 207 
    or step == 243
    or step == 247 then 
        R1:tweenAlpha(0, 0.3)
    end
    -- up arrow 
    if step == 226 
    or step == 230 
    or step == 234 then 
        R2.alpha = 1
    end
    if step == 227 
    or step == 231 
    or step == 235 then 
        R2:tweenAlpha(0, 0.3)
    end
    -- right arrow 
    if step == 194 
    or step == 198 
    or step == 202 
    or step == 222 then 
        R3.alpha = 1
    end
    if step == 195 
    or step == 199 
    or step == 203 
    or step == 223 then 
        R3:tweenAlpha(0, 0.3)
    end
-- Soft Part
    if step == 256 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 1.71)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.85)
        end
    end
    if step == 272 then 
        swaySlowCamCentre = true 
    end
    if step == 312 then 
        swaySlowCamCentre = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.85)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.85)
        end
    end
    if step == 320 then 
        swaySlowDefault = true 
    end
    if step == 358 then 
        swaySlowDefault = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.defaultY, 2.50)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.defaultY, 2.50)
        end
    end
    if step == 384 then 
        swaySlowSwapped = true 
    end
    if step == 486 then 
        swaySlowSwapped = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.25)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.25)
        end
    end
-- Arrow Duet Part 1 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 512 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.85)
        end
        if step == 522 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end 
        if step == 524 then 
            receptor.tweenPos(receptor, receptor.defaultX - 64, receptor.y, 0.20)
        end
        if step == 526 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.85)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 512 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.85)
        end
        if step == 522 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.20)
        end 
        if step == 524 then 
            receptor.tweenPos(receptor, receptor.defaultX + 64, receptor.y, 0.20)
        end
        if step == 526 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.85)
        end
    end
    if step == 544 then 
        swayIntenseDefault = true 
    end
    if step == 572 then 
        swayIntenseDefault = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end
-- Arrow Duet Part 2
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 576 then 
            receptor.tweenPos(receptor, receptor.defaultX - 64, receptor.y, 0.85)
        end 
        if step == 586 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.20)
        end
        if step == 588 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.20)
        end
        if step == 590 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.85)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 576 then 
            receptor.tweenPos(receptor, receptor.defaultX + 64, receptor.y, 0.85)
        end 
        if step == 586 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.20)
        end
        if step == 588 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.20)
        end
        if step == 590 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.85)
        end
    end
    if step == 608 then 
        swayIntenseDefault = true 
    end
    if step == 636 then 
        swayIntenseDefault = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end
-- Arrow Duet Part 3 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 640 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.85)
        end
        if step == 650 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end 
        if step == 652 then 
            receptor.tweenPos(receptor, receptor.defaultX - 64, receptor.y, 0.20)
        end
        if step == 654 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.85)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 640 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.85)
        end
        if step == 650 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.20)
        end 
        if step == 652 then 
            receptor.tweenPos(receptor, receptor.defaultX + 64, receptor.y, 0.20)
        end
        if step == 654 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.85)
        end
    end
    if step == 672 then 
        swayIntenserDefault = true 
    end
    if step == 700 then 
        swayIntenserDefault = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end
-- Arrow Duet Part 4 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 704 then 
            receptor.tweenPos(receptor, receptor.defaultX - 64, receptor.y, 0.85)
        end
        if step == 714 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.20)
        end
        if step == 716 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.20)
        end
        if step == 718 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.60)
        end
        if step == 730 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.20)
        end
        if step == 732 then 
            receptor.tweenPos(receptor, receptor.defaultX + 64, receptor.y, 0.20)
        end
        if step == 734 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 2.5)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 704 then 
            receptor.tweenPos(receptor, receptor.defaultX + 64, receptor.y, 0.85)
        end
        if step == 714 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.20)
        end
        if step == 716 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.20)
        end
        if step == 718 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.60)
        end
        if step == 730 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.20)
        end
        if step == 732 then 
            receptor.tweenPos(receptor, receptor.defaultX - 64, receptor.y, 0.20)
        end
        if step == 734 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 2.5)
        end
    end
    if step == 752 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.85)
        end
    end
-- Centred Arrow Time 
    if step == 762 then 
        R1.x = R1.x + 60 
        R2.x = R2.x + 580
        R3.x = R3.x + 640 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 320 
        end
    end
    if step == 768 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 6.8)
        end
    end
    -- Blinking Notes for Cam 
    -- left arrow 
    if step == 768 or step == 776 
    or step == 780 or step == 792 
    or step == 796 or step == 808 
    or step == 812 or step == 824 
    or step == 828 then 
        R0.alpha = 1 
    end
    if step == 769 or step == 777 
    or step == 781 or step == 793 
    or step == 797 or step == 809 
    or step == 813 or step == 825 
    or step == 829 then 
        R0:tweenAlpha(0, 0.1)
    end
    -- down arrow 
    if step == 772 or step == 784 
    or step == 788 or step == 800 
    or step == 804 or step == 816 
    or step == 820 then 
        R1.alpha = 1
    end
    if step == 773 or step == 785 
    or step == 789 or step == 801 
    or step == 805 or step == 817 
    or step == 821 then 
        R1:tweenAlpha(0, 0.1)
    end
    -- up arrow 
    if step == 768 or step == 778 
    or step == 782 or step == 794 
    or step == 798 or step == 810 
    or step == 814 or step == 826 
    or step == 830 then 
        R2.alpha = 1
    end
    if step == 769 or step == 779 
    or step == 783 or step == 795 
    or step == 799 or step == 811 
    or step == 815 or step == 827 
    or step == 831 then 
        R2:tweenAlpha(0, 0.1)
    end
    -- right arrow 
    if step == 770 or step == 774 
    or step == 786 or step == 790 
    or step == 802 or step == 806 
    or step == 818 or step == 822 then 
        R3.alpha = 1
    end
    if step == 771 or step == 775 
    or step == 787 or step == 791 
    or step == 803 or step == 807 
    or step == 819 or step == 823 then 
        R3:tweenAlpha(0, 0.1)
    end
    if step == 832 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
    end
-- Beatdrop! 
    if step == 880 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i] 
            receptor.x = receptor.defaultX + 320 
        end
    end
    if step == 882
    or step == 884 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.x = receptor.defaultX 
        end
    end
    if step == 883 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i] 
            receptor.x = receptor.defaultX + 640 
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.x = receptor.defaultX - 640 
        end
    end
    if step == 886 then 
        R0.alpha = 0 
        R7.alpha = 0 
    end
    if step == 887 then 
        R1.alpha = 0 
        R6.alpha = 0 
    end
    if step == 888 then 
        R2.alpha = 0 
        R5.alpha = 0 
    end
    if step == 889 then 
        R3.alpha = 0 
        R4.alpha = 0 
    end
    if step == 892 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
    end
-- Chorus 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i] 
        if step == 896 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.y, 0.85)
        end
        if step == 920 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.60)
        end
        if step == 928 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.30)
        end
        if step == 936 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.85)
        end
        if step == 984 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.60)
        end
        if step == 990 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.42)
        end
        if step == 1080 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.20)
        end
        if step == 1083 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
        if step == 1086 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.20)
        end
        if step == 1088 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.85)
        end
        if step == 1112 then 
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.y, 0.60)
        end
        if step == 1118 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.85)
        end
        if step == 1136 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.71)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i] 
        if step == 896 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.85)
        end
        if step == 920 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.60)
        end
        if step == 926 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 80, 0.85)
        end
        if step == 952 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 955 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.20)
        end
        if step == 958 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.20)
        end
        if step == 964 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.60)
        end
        if step == 970 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.20)
        end
        if step == 978 then 
            receptor.tweenPos(receptor, receptor.defaultX - 160, receptor.y, 0.60)
        end
        if step == 984 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.60)
        end
        if step == 990 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.85)
        end
        if step == 1018 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.20)
        end
        if step == 1021 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.20)
        end
        if step == 1032 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.y, 0.60)
        end
        if step == 1048 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.60)
        end
        if step == 1054 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.20)
        end
        if step == 1060 then 
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.defaultY, 0.20)
        end 
        if step == 1092 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
        if step == 1112 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 80, 0.60)
        end
        if step == 1118 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.85)
        end
        if step == 1136 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.71)
        end 
    end
-- Post Chorus 
    if step == 1152 then 
        swayIntenseDefault = true 
    end
    if step == 1276 then 
        swayIntenseDefault = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end
    if step == 1280 then 
        swayIntenserDefault = true 
    end
    if step == 1344
    or step == 1359 then 
        swayIntenserDefault = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
            receptor.tweenAlpha(receptor, 0, 1.45)
        end
    end
    if step == 1358
    or step == 1374
    or step == 1408 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.alpha = 1
        end
    end
    if step == 1375 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 0, 3.42)
        end
    end
-- Another Soft Part 
    if step == 1504 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 3.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 0, 3.42)
        end
    end
    if step == 1536 then 
        swaySlowCamCentre = true 
    end
    if step == 1584 then 
        swaySlowCamCentre = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.71)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 1, 1.71)
        end
    end
    if step == 1600 then 
        swaySlowDefault = true 
    end
-- Chorus (Key Pressed Function)
    if step == 1904 then 
        swaySlowDefault = false 
        swayScreenCam = true 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.alpha = 0 
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.x = receptor.defaultX - 320
        end
    end
    if step == 1912 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 1, 0.85)
        end
    end
    if step == 2176 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 0.3, 0.85)
        end
    end
    if step == 2304 then 
        fadingCam = true 
    end
-- Ending
    if step == 2416 then 
        fadingCam = false 
        swayScreenCam = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.71)
            receptor.tweenAlpha(receptor, 1, 1.71)
        end
    end
    if step == 2662 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenAlpha(receptor, 0, 1.71)
        end
    end
end
