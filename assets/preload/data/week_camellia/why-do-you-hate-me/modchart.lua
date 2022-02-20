-- 1.71secs per section
-- 0.845secs per section/2
-- 0.42secs per section/4

local swayScreenCam = false

local waitForBeatFade = false 
local fade = false 

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
    if swayScreenCam then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 320 * math.sin((currentBeat)) + 320
            receptor.y = receptor.defaultY - 48 * math.cos((currentBeat + 1*8) * math.pi)
        end
    end
    if fading then 
        if curBeat % 1 == 0 and not waitForBeatFade then 
            waitForBeatFade = true 
            fade = not fade
            if fade then 
                for i = 0, 7 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 0.1, 1.71)
                end
            else 
                for i = 0, 7 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 1, 1.71)
                end
            end
        end
    end
end

function beatHit(beat)
    waitForBeatFade = false 
end

function stepHit(step)
-- Push Out BF Notes 
    if step == 1 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.42)
        end
    end
    if step == 128 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 320 
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 320
        end
    end
    if step == 156 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY, 0.42)
        R4:tweenAngle(R4.angle - 360, 0.42)
        R5:tweenPos(R5.defaultX - 580, R5.defaultY, 0.42)
        R5:tweenAngle(R5.angle - 360, 0.42)
        R6:tweenPos(R6.defaultX - 60, R6.defaultY, 0.42)
        R6:tweenAngle(R6.angle + 360, 0.42)
        R7:tweenPos(R7.defaultX, R7.defaultY, 0.42)
        R7:tweenAngle(R7.angle + 360, 0.42)
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
    end
-- Swap Notes 
    if step == 220 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.defaultY, 0.42)
        end
        R4:tweenAngle(R4.angle + 360, 0.42)
        R5:tweenAngle(R5.angle + 360, 0.42)
        R6:tweenAngle(R6.angle - 360, 0.42)
        R7:tweenAngle(R7.angle - 360, 0.42)

        R0:tweenPos(R0.defaultX, R0.defaultY, 0.42)
        R0:tweenAngle(R0.angle - 360, 0.42)
        R1:tweenPos(R1.defaultX + 60, R1.defaultY, 0.42)
        R1:tweenAngle(R1.angle - 360, 0.42)
        R2:tweenPos(R2.defaultX + 580, R2.defaultY, 0.42)
        R2:tweenAngle(R2.angle + 360, 0.42)
        R3:tweenPos(R3.defaultX + 640, R3.defaultY, 0.42)
        R3:tweenAngle(R3.angle + 360, 0.42)
    end
-- Diagonal Notes 
    if step == 316 or step == 380 
    or step == 444 or step == 508 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
    if step == 284 or step == 412 then 
        R4:tweenPos(R4.x, R4.defaultY + 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.42)
    end
    if step == 348 or step == 476 then 
        R4:tweenPos(R4.x, R4.defaultY - 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.42)
    end
    -- Cam Flying Notes 
    if step == 380 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 0.42)
            receptor.tweenAlpha(receptor, 0.3, 0.42)
        end
        R0:tweenAngle(R0.angle + 360, 0.42)
        R1:tweenAngle(R1.angle + 360, 0.42)
        R2:tweenAngle(R2.angle - 360, 0.42)
        R3:tweenAngle(R3.angle - 360, 0.42)
    end
    if step == 384 then 
        swayScreenCam = true 
    end
    if step == 512 then 
        swayScreenCam = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 0.42)
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
    end
-- Slow Return 
    if step == 516 then 
        fading = true 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 12.82)
        end
    end
-- Arrow Duet Nice 
    if step == 624 then 
        fading = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 1.71)
        end
    end
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 640 then 
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.defaultY - 80, 1.3)
        end
        if step == 652 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.20)
        end
        if step == 654 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 656 then 
            receptor.tweenPos(receptor, receptor.defaultX + 120, receptor.y, 0.20)
        end
        if step == 658 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 666 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.20)
        end
        if step == 668 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 640 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.defaultY + 80, 1.3)
        end
        if step == 652 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 654 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 656 then 
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.y, 0.20)
        end
        if step == 658 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 666 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 668 then  
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
    end
-- Arrow Beating 
    -- 1 
    if step == 672 then 
        R3:tweenPos(R3.x, R3.defaultY - 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY - 40, 0.10)
    end
    if step == 673 then 
        R2:tweenPos(R2.x, R2.defaultY - 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY - 40, 0.10)
    end
    if step == 674 then 
        R1:tweenPos(R1.x, R1.defaultY - 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY - 40, 0.10)
    end
    if step == 675 then 
        R0:tweenPos(R0.x, R0.defaultY - 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY - 40, 0.10)
    end
    -- 2
    if step == 677 then 
        R3:tweenPos(R3.defaultX + 40, R3.y, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.y, 0.10)
    end
    if step == 678 then 
        R2:tweenPos(R2.defaultX + 40, R2.y, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.y, 0.10)
    end
    if step == 679 then 
        R0:tweenPos(R0.defaultX - 40, R0.y, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.y, 0.10)
    end
    if step == 680 then 
        R1:tweenPos(R1.defaultX - 40, R1.y, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.y, 0.10)
    end
    -- 3 
    if step == 682 then 
        R0:tweenPos(R0.x, R0.defaultY + 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY + 40, 0.10)
    end
    if step == 683 then 
        R1:tweenPos(R1.x, R1.defaultY + 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY + 40, 0.10)
    end
    if step == 684 then 
        R2:tweenPos(R2.x, R2.defaultY + 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY + 40, 0.10)
    end
    if step == 685 then 
        R3:tweenPos(R3.x, R3.defaultY + 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY + 40, 0.10)
    end
    -- 4 
    if step == 687 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.10)
        end
    end
    -- 5 
    if step == 688 then 
        R3:tweenPos(R3.x, R3.defaultY + 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY + 40, 0.10)
    end
    if step == 689 then 
        R2:tweenPos(R2.x, R2.defaultY + 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY + 40, 0.10)
    end
    if step == 690 then 
        R1:tweenPos(R1.x, R1.defaultY + 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY + 40, 0.10)
    end
    if step == 691 then 
        R0:tweenPos(R0.x, R0.defaultY + 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY + 40, 0.10)
    end
    -- 6 
    if step == 693 then 
        R0:tweenPos(R0.defaultX - 40, R0.y, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.y, 0.10)
    end
    if step == 694 then 
        R1:tweenPos(R1.defaultX - 40, R1.y, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.y, 0.10)
    end
    if step == 695 then 
        R3:tweenPos(R3.defaultX + 40, R3.y, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.y, 0.10)
    end
    if step == 696 then 
        R2:tweenPos(R2.defaultX + 40, R2.y, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.y, 0.10)
    end
    -- 7 
    if step == 698 then 
        R0:tweenPos(R0.x, R0.defaultY - 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY - 40, 0.10)
    end
    if step == 699 then 
        R1:tweenPos(R1.x, R1.defaultY - 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY - 40, 0.10)
    end
    if step == 700 then 
        R2:tweenPos(R2.x, R2.defaultY - 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY - 40, 0.10)
    end
    if step == 701 then 
        R3:tweenPos(R3.x, R3.defaultY - 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY - 40, 0.10)
    end
    -- 8 
    if step == 703 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.10)
        end
    end
-- Arrow Duet Part 2 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 704 then 
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.defaultY - 80, 1.3)
        end
        if step == 716 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.2)
        end
        if step == 718 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.2)
        end
        if step == 720 then 
            receptor.tweenPos(receptor, receptor.defaultX + 120, receptor.y, 0.2)
        end
        if step == 722 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 730 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.2)
        end
        if step == 732 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 20, 0.1)
        end
        if step == 733 then 
            receptor.tweenPos(receptor, receptor.defaultX + 20, receptor.y, 0.1)
        end
        if step == 734 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
        if step == 735 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 704 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.defaultY + 80, 1.3)
        end
        if step == 716 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.2)
        end
        if step == 718 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.2)
        end
        if step == 720 then 
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.y, 0.2)
        end
        if step == 722 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 730 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.2)
        end
        if step == 732 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 20, 0.1)
        end
        if step == 733 then 
            receptor.tweenPos(receptor, receptor.defaultX - 20, receptor.y, 0.1)
        end
        if step == 734 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
        if step == 735 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
-- Arrow Beating Part 2 
    -- 1 
    if step == 736 then 
        R3:tweenPos(R3.x, R3.defaultY - 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY + 40, 0.10)
    end
    if step == 737 then 
        R2:tweenPos(R2.x, R2.defaultY - 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY + 40, 0.10)
    end
    if step == 738 then 
        R1:tweenPos(R1.x, R1.defaultY - 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY + 40, 0.10)
    end
    if step == 739 then 
        R0:tweenPos(R0.x, R0.defaultY - 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY + 40, 0.10)
    end
    -- 2 
    if step == 741 then 
        R0:tweenPos(R0.defaultX - 40, R0.defaultY, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.defaultY, 0.10)
    end
    if step == 742 then 
        R1:tweenPos(R1.defaultX - 40, R1.defaultY, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.defaultY, 0.10)
    end
    if step == 743 then 
        R3:tweenPos(R3.defaultX - 40, R3.defaultY, 0.10)
        R4:tweenPos(R4.defaultX + 40, R4.defaultY, 0.10)
    end
    if step == 744 then 
        R2:tweenPos(R2.defaultX - 40, R2.defaultY, 0.10)
        R5:tweenPos(R5.defaultX + 40, R5.defaultY, 0.10)
    end
    -- 3
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 746 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 747 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 748 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 749 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        -- 4 
        if step == 751 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 746 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 747 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 748 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 749 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        -- 4
        if step == 751 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 5
    if step == 752 then 
        R0:tweenPos(R0.x, R0.defaultY + 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY - 40, 0.10)
    end
    if step == 753 then 
        R1:tweenPos(R1.x, R1.defaultY + 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY - 40, 0.10)
    end
    if step == 754 then 
        R2:tweenPos(R2.x, R2.defaultY + 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY - 40, 0.10)
    end
    if step == 755 then 
        R3:tweenPos(R3.x, R3.defaultY + 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY - 40, 0.10)
    end
    -- 6 
    if step == 757 then 
        R3:tweenPos(R3.defaultX + 40, R3.defaultY, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.defaultY, 0.10)
    end
    if step == 758 then 
        R2:tweenPos(R2.defaultX + 40, R2.defaultY, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.defaultY, 0.10)
    end
    if step == 759 then 
        R1:tweenPos(R1.defaultX + 40, R1.defaultY, 0.10)
        R6:tweenPos(R6.defaultX - 40, R6.defaultY, 0.10)
    end
    if step == 760 then 
        R0:tweenPos(R0.defaultX + 40, R0.defaultY, 0.10)
        R7:tweenPos(R7.defaultX - 40, R7.defaultY, 0.10)
    end
    -- 7 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 762 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 763 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 764 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 765 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        -- 8
        if step == 767 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 762 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 763 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 764 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 765 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        -- 8
        if step == 767 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
-- Arrow Duet But it's only BF
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 768 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.defaultY + 80, 1.3)
        end
        if step == 780 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 782 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 784 then 
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.y, 0.20)
        end
        if step == 786 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 794 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 796 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
    end
-- Arrow Beating Part 3 
    -- 1 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 800 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 801 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 802 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 803 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 800 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 801 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 802 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 803 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 2
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 805 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 806 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 807 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 808 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 805 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 806 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 807 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 808 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 3
    if step == 810 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    if step == 811 then 
        R1:tweenAngle(R1.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1)
    end
    if step == 812 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    if step == 813 then 
        R2:tweenAngle(R2.angle - 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
    end
    -- 4 
    if step == 815 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R1:tweenAngle(R1.angle + 180, 0.1)
        R2:tweenAngle(R2.angle - 180, 0.1)
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    -- 5 
    if step == 816 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    if step == 817 then
        R1:tweenAngle(R1.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1) 
    end
    if step == 818 then 
        R2:tweenAngle(R2.angle - 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
    end
    if step == 819 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 816 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 817 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 818 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 819 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 816 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 817 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 818 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 819 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 6 
    if step == 821 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    if step == 822 then
        R2:tweenAngle(R2.angle - 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
    end
    if step == 823 then 
        R1:tweenAngle(R1.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1) 
    end
    if step == 824 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 821 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 822 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 823 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 824 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 821 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 822 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 823 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 824 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 7 
    if step == 826 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    if step == 827 then
        R2:tweenAngle(R2.angle + 180, 0.1)
        R5:tweenAngle(R5.angle - 180, 0.1)
    end
    if step == 828 then 
        R1:tweenAngle(R1.angle - 180, 0.1)
        R6:tweenAngle(R6.angle + 180, 0.1) 
    end
    if step == 829 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    -- 8 
    if step == 831 then
        R0:tweenAngle(R0.angle + 180, 0.1)
        R1:tweenAngle(R1.angle - 180, 0.1)
        R2:tweenAngle(R2.angle + 180, 0.1)
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
        R5:tweenAngle(R5.angle - 180, 0.1)
        R6:tweenAngle(R6.angle + 180, 0.1) 
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
-- Centre and Back 
    if step == 894 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 3.5)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 3.5)
        end
    end
    if step == 952 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.845)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.845)
        end
    end
-- "Why Do You Hate Me" Disappearing Part
    if step == 1008 then 
        R0:tweenAlpha(0, 0.05)
        R1:tweenAlpha(0, 0.05)
        R3:tweenAlpha(0, 0.05)
        R4:tweenAlpha(0, 0.05)
        R6:tweenAlpha(0, 0.05)
        R7:tweenAlpha(0, 0.05)
    end
    if step == 1011 then 
        R1:tweenAlpha(1, 0.05)
        R2:tweenAlpha(0, 0.05)
        R5:tweenAlpha(0, 0.05)
        R6:tweenAlpha(1, 0.05)
    end
    if step == 1014 then 
        R1:tweenAlpha(0, 0.05)
        R3:tweenAlpha(1, 0.05)
        R4:tweenAlpha(1, 0.05)
        R6:tweenAlpha(0, 0.05)
    end
    if step == 1017 then 
        R3.alpha = 0
        R4.alpha = 0
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 90
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 90
        end
    end
    if step == 1020 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
    end
-- Diagonal Arrows in Chorus 
    if step == 1024 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1025 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
    if step == 1032 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1034 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1)
    end
    if step == 1036 then 
        R3:tweenPos(R3.x, R3.defaultY, 0.10)
        R4:tweenPos(R4.x, R4.defaultY, 0.10)
    end
    if step == 1037 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.10)
        R5:tweenPos(R5.x, R5.defaultY, 0.10)
    end
    if step == 1038 then 
        R1:tweenPos(R1.x, R1.defaultY, 0.10)
        R6:tweenPos(R6.x, R6.defaultY, 0.10)
    end
    if step == 1039 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.10)
        R7:tweenPos(R7.x, R7.defaultY, 0.10)
    end
    if step == 1040 then
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1042 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1044 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1052 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 550, receptor.y, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 550, receptor.y, 0.42)
        end
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1056 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1062 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.1)
        R1:tweenPos(R1.x, R1.defaultY, 0.1)
        R6:tweenPos(R6.x, R6.defaultY, 0.1)
        R7:tweenPos(R7.x, R7.defaultY, 0.1) 
    end
    if step == 1063 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.1)
        R3:tweenPos(R3.x, R3.defaultY, 0.1)
        R4:tweenPos(R4.x, R4.defaultY, 0.1)
        R5:tweenPos(R5.x, R5.defaultY, 0.1)
    end
    if step == 1064 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1066 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1068 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.10)
        R7:tweenPos(R7.x, R7.defaultY, 0.10)
    end
    if step == 1069 then 
        R1:tweenPos(R1.x, R1.defaultY, 0.10)
        R6:tweenPos(R6.x, R6.defaultY, 0.10)
    end
    if step == 1070 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.10)
        R5:tweenPos(R5.x, R5.defaultY, 0.10)
    end
    if step == 1071 then 
        R3:tweenPos(R3.x, R3.defaultY, 0.10)
        R4:tweenPos(R4.x, R4.defaultY, 0.10)
    end
    if step == 1072 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1074 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1084 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 90, receptor.y, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 90, receptor.y, 0.42)
        end
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1088 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1089 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
    if step == 1096 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1098 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1)
    end
    if step == 1100 then 
        R3:tweenPos(R3.x, R3.defaultY, 0.10)
        R4:tweenPos(R4.x, R4.defaultY, 0.10)
    end
    if step == 1101 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.10)
        R5:tweenPos(R5.x, R5.defaultY, 0.10)
    end
    if step == 1102 then 
        R1:tweenPos(R1.x, R1.defaultY, 0.10)
        R6:tweenPos(R6.x, R6.defaultY, 0.10)
    end
    if step == 1103 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.10)
        R7:tweenPos(R7.x, R7.defaultY, 0.10)
    end
    if step == 1104 then
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1106 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1108 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1120 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.71)
        end
    end
    if step == 1136 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.845)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.845)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.845)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.845)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.845)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.845)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.845)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.845)
    end
    if step == 1144 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.y, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.y, 0.42)
        end
    end
    if step == 1148 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 550, receptor.y, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 550, receptor.y, 0.42)
        end
    end
-- Diagonal Arrows in Chorus Part 2 
    if step == 1152 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1153 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
    if step == 1160 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1)
    end
    if step == 1162 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1)
    end
    if step == 1164 then 
        R3:tweenPos(R3.x, R3.defaultY, 0.10)
        R4:tweenPos(R4.x, R4.defaultY, 0.10)
    end
    if step == 1165 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.10)
        R5:tweenPos(R5.x, R5.defaultY, 0.10)
    end
    if step == 1166 then 
        R1:tweenPos(R1.x, R1.defaultY, 0.10)
        R6:tweenPos(R6.x, R6.defaultY, 0.10)
    end
    if step == 1167 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.10)
        R7:tweenPos(R7.x, R7.defaultY, 0.10)
    end
    if step == 1168 then
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1170 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1172 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1180 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 90, receptor.y, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 90, receptor.y, 0.42)
        end
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1184 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1190 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.1)
        R1:tweenPos(R1.x, R1.defaultY, 0.1)
        R6:tweenPos(R6.x, R6.defaultY, 0.1)
        R7:tweenPos(R7.x, R7.defaultY, 0.1) 
    end
    if step == 1191 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.1)
        R3:tweenPos(R3.x, R3.defaultY, 0.1)
        R4:tweenPos(R4.x, R4.defaultY, 0.1)
        R5:tweenPos(R5.x, R5.defaultY, 0.1)
    end
    if step == 1192 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1194 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1196 then 
        R0:tweenPos(R0.x, R0.defaultY, 0.10)
        R7:tweenPos(R7.x, R7.defaultY, 0.10)
    end
    if step == 1197 then 
        R1:tweenPos(R1.x, R1.defaultY, 0.10)
        R6:tweenPos(R6.x, R6.defaultY, 0.10)
    end
    if step == 1198 then 
        R2:tweenPos(R2.x, R2.defaultY, 0.10)
        R5:tweenPos(R5.x, R5.defaultY, 0.10)
    end
    if step == 1199 then 
        R3:tweenPos(R3.x, R3.defaultY, 0.10)
        R4:tweenPos(R4.x, R4.defaultY, 0.10)
    end
    if step == 1200 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1202 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1212 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end
    if step == 1216 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.845)
        end
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 90, receptor.y, 0.845)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 90, receptor.y, 0.845)
        end
    end
    if step == 1224 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 150, 2.13)
            receptor.alpha = 1
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 150, 2.13)
            receptor.alpha = 1
        end
    end
    if step == 1244 then 
        R0:tweenAngle(R0.angle + 180, 0.42)
        R1:tweenAngle(R1.angle + 180, 0.42)
        R2:tweenAngle(R2.angle - 180, 0.42)
        R3:tweenAngle(R3.angle - 180, 0.42)
        R4:tweenAngle(R4.angle + 180, 0.42)
        R5:tweenAngle(R5.angle + 180, 0.42)
        R6:tweenAngle(R6.angle - 180, 0.42)
        R7:tweenAngle(R7.angle - 180, 0.42)
    end
    if step == 1280 then 
        R0:tweenAngle(R0.angle + 180, 0.42)
        R1:tweenAngle(R1.angle + 180, 0.42)
        R2:tweenAngle(R2.angle - 180, 0.42)
        R3:tweenAngle(R3.angle - 180, 0.42)
        R4:tweenAngle(R4.angle + 180, 0.42)
        R5:tweenAngle(R5.angle + 180, 0.42)
        R6:tweenAngle(R6.angle - 180, 0.42)
        R7:tweenAngle(R7.angle - 180, 0.42)
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end
    if step == 1284 or step == 1286 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
    end
    if step == 1285 or step == 1287 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
    end
    if step == 1288 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.42)
        end
    end 
    if step == 1294 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1295 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1297 then 
        R0:tweenPos(R0.defaultX - 40, R0.defaultY, 0.10)
        R1:tweenPos(R1.defaultX - 40, R1.defaultY, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.defaultY, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.defaultY, 0.10)
    end
    if step == 1299 then 
        R2:tweenPos(R2.defaultX + 40, R2.defaultY, 0.10)
        R3:tweenPos(R3.defaultX + 40, R3.defaultY, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.defaultY, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.defaultY, 0.10)
    end
    if step == 1302 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    if step == 1303 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
    end
    if step == 1305 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
    end
    if step == 1307 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    if step == 1312 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.42) 
    end
    if step == 1316 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.42) 
    end
    if step == 1320 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.845)
        end
    end
    if step == 1328 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1329 then 
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)
        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
    end
    if step == 1330 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.y, 0.42)
            receptor.tweenAlpha(receptor, 0, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.y, 0.42)
        end
    end
    if step == 1336 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.42) 
    end
    if step == 1340 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.y, 0.42)
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.y, 0.42)
        end
    end 
    if step == 1344 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
    if step == 1348 or step == 1350 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 600, receptor.defaultY, 0.1)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 680, receptor.defaultY, 0.1)
        end
    end
    if step == 1349 or step == 1351 then
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 680, receptor.defaultY, 0.1)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 600, receptor.defaultY, 0.1)
        end 
    end
    if step == 1352 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.defaultY, 0.1)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.defaultY, 0.1)
        end 
    end 
    if step == 1358 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.1) 
    end
    if step == 1359 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.1)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.1)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.1)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.1)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1) 
    end
    if step == 1361 then 
        R0:tweenPos(R0.defaultX + 600, R0.defaultY, 0.10)
        R1:tweenPos(R1.defaultX + 600, R1.defaultY, 0.10)
        R6:tweenPos(R6.defaultX - 600, R6.defaultY, 0.10)
        R7:tweenPos(R7.defaultX - 600, R7.defaultY, 0.10)
    end
    if step == 1363 then 
        R2:tweenPos(R2.defaultX + 680, R2.defaultY, 0.10)
        R3:tweenPos(R3.defaultX + 680, R3.defaultY, 0.10)
        R4:tweenPos(R4.defaultX - 680, R4.defaultY, 0.10)
        R5:tweenPos(R5.defaultX - 680, R5.defaultY, 0.10)
    end
    if step == 1366 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.defaultY, 0.1)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.defaultY, 0.1)
        end
    end
    if step == 1367 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.1)
        end
    end
    if step == 1369 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.1)
        end
    end
    if step == 1371 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
    end
    if step == 1376 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.42) 
    end 
    if step == 1380 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.42) 
    end
    if step == 1384 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.845)
        end
    end
-- Split Notes Again 
    if step == 1392 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 1.27)
            receptor.tweenAlpha(receptor, 0, 1.27)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.defaultY, 1.27)
        end
    end
    if step == 1404 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
        R0:tweenPos(R0.defaultX, R0.defaultY, 0.42)
        R0:tweenAngle(R0.angle - 360, 0.42)
        R1:tweenPos(R1.defaultX + 60, R1.defaultY, 0.42)
        R1:tweenAngle(R1.angle - 360, 0.42)
        R2:tweenPos(R2.defaultX + 580, R2.defaultY, 0.42)
        R2:tweenAngle(R2.angle + 360, 0.42)
        R3:tweenPos(R3.defaultX + 640, R3.defaultY, 0.42)
        R3:tweenAngle(R3.angle + 360, 0.42)
    end
    -- Diagonal Notes
    if step == 1468 or step == 1532 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
    if step == 1436 then 
        R0:tweenPos(R0.x, R0.defaultY + 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY + 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY - 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY - 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY - 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.42) 
    end
    if step == 1500 then 
        R0:tweenPos(R0.x, R0.defaultY - 60, 0.42)
        R1:tweenPos(R1.x, R1.defaultY - 20, 0.42)
        R2:tweenPos(R2.x, R2.defaultY + 20, 0.42)
        R3:tweenPos(R3.x, R3.defaultY + 60, 0.42)

        R4:tweenPos(R4.x, R4.defaultY + 60, 0.42)
        R5:tweenPos(R5.x, R5.defaultY + 20, 0.42)
        R6:tweenPos(R6.x, R6.defaultY - 20, 0.42)
        R7:tweenPos(R7.x, R7.defaultY - 60, 0.42) 
    end
    if step == 1532 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.42)
        end
    end
-- Slow Return
    if step == 1536 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 0.42)
        end
        R0:tweenAngle(R0.angle + 360, 0.42)
        R1:tweenAngle(R1.angle + 360, 0.42)
        R2:tweenAngle(R2.angle - 360, 0.42)
        R3:tweenAngle(R3.angle - 360, 0.42)
    end
    if step == 1540 then 
        fading = true 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i] 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 12.82)
        end
    end
-- Arrow Duet Nice 
    if step == 1648 then 
        fading = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 1.71)
        end
    end
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1664 then 
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.defaultY - 80, 1.3)
        end
        if step == 1676 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.20)
        end
        if step == 1678 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 1680 then 
            receptor.tweenPos(receptor, receptor.defaultX + 120, receptor.y, 0.20)
        end
        if step == 1682 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 1690 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.20)
        end
        if step == 1692 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1664 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.defaultY + 80, 1.3)
        end
        if step == 1676 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 1678 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 1680 then 
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.y, 0.20)
        end
        if step == 1682 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 1690 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 1692 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
    end
-- Arrow Beating 
    -- 1 
    if step == 1696 then 
        R3:tweenPos(R3.x, R3.defaultY - 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY - 40, 0.10)
    end
    if step == 1697 then 
        R2:tweenPos(R2.x, R2.defaultY - 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY - 40, 0.10)
    end
    if step == 1698 then 
        R1:tweenPos(R1.x, R1.defaultY - 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY - 40, 0.10)
    end
    if step == 1699 then 
        R0:tweenPos(R0.x, R0.defaultY - 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY - 40, 0.10)
    end
    -- 2
    if step == 1701 then 
        R3:tweenPos(R3.defaultX + 40, R3.y, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.y, 0.10)
    end
    if step == 1702 then 
        R2:tweenPos(R2.defaultX + 40, R2.y, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.y, 0.10)
    end
    if step == 1703 then 
        R0:tweenPos(R0.defaultX - 40, R0.y, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.y, 0.10)
    end
    if step == 1704 then 
        R1:tweenPos(R1.defaultX - 40, R1.y, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.y, 0.10)
    end
    -- 3 
    if step == 1706 then 
        R0:tweenPos(R0.x, R0.defaultY + 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY + 40, 0.10)
    end
    if step == 1707 then 
        R1:tweenPos(R1.x, R1.defaultY + 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY + 40, 0.10)
    end
    if step == 1708 then 
        R2:tweenPos(R2.x, R2.defaultY + 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY + 40, 0.10)
    end
    if step == 1709 then 
        R3:tweenPos(R3.x, R3.defaultY + 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY + 40, 0.10)
    end
    -- 4 
    if step == 1711 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.10)
        end
    end
    -- 5 
    if step == 1712 then 
        R3:tweenPos(R3.x, R3.defaultY + 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY + 40, 0.10)
    end
    if step == 1713 then 
        R2:tweenPos(R2.x, R2.defaultY + 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY + 40, 0.10)
    end
    if step == 1714 then 
        R1:tweenPos(R1.x, R1.defaultY + 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY + 40, 0.10)
    end
    if step == 1715 then 
        R0:tweenPos(R0.x, R0.defaultY + 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY + 40, 0.10)
    end
    -- 6 
    if step == 1717 then 
        R0:tweenPos(R0.defaultX - 40, R0.y, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.y, 0.10)
    end
    if step == 1718 then 
        R1:tweenPos(R1.defaultX - 40, R1.y, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.y, 0.10)
    end
    if step == 1719 then 
        R3:tweenPos(R3.defaultX + 40, R3.y, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.y, 0.10)
    end
    if step == 1720 then 
        R2:tweenPos(R2.defaultX + 40, R2.y, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.y, 0.10)
    end
    -- 7 
    if step == 1722 then 
        R0:tweenPos(R0.x, R0.defaultY - 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY - 40, 0.10)
    end
    if step == 1723 then 
        R1:tweenPos(R1.x, R1.defaultY - 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY - 40, 0.10)
    end
    if step == 1724 then 
        R2:tweenPos(R2.x, R2.defaultY - 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY - 40, 0.10)
    end
    if step == 1725 then 
        R3:tweenPos(R3.x, R3.defaultY - 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY - 40, 0.10)
    end
    -- 8 
    if step == 1727 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.10)
        end
    end
-- Arrow Duet Part 2 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1728 then 
            receptor.tweenPos(receptor, receptor.defaultX + 80, receptor.defaultY - 80, 1.3)
        end
        if step == 1740 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.2)
        end
        if step == 1742 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.2)
        end
        if step == 1744 then 
            receptor.tweenPos(receptor, receptor.defaultX + 120, receptor.y, 0.2)
        end
        if step == 1746 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 1754 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 40, 0.2)
        end
        if step == 1756 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 20, 0.1)
        end
        if step == 1757 then 
            receptor.tweenPos(receptor, receptor.defaultX + 20, receptor.y, 0.1)
        end
        if step == 1758 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
        if step == 1759 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1728 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.defaultY + 80, 1.3)
        end
        if step == 1740 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.2)
        end
        if step == 1742 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.2)
        end
        if step == 1744 then 
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.y, 0.2)
        end
        if step == 1746 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 1754 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.2)
        end
        if step == 1756 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY + 20, 0.1)
        end
        if step == 1757 then 
            receptor.tweenPos(receptor, receptor.defaultX - 20, receptor.y, 0.1)
        end
        if step == 1758 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.1)
        end
        if step == 1759 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
-- Arrow Beating Part 2 
    -- 1 
    if step == 1760 then 
        R3:tweenPos(R3.x, R3.defaultY - 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY + 40, 0.10)
    end
    if step == 1761 then 
        R2:tweenPos(R2.x, R2.defaultY - 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY + 40, 0.10)
    end
    if step == 1762 then  
        R1:tweenPos(R1.x, R1.defaultY - 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY + 40, 0.10)
    end
    if step == 1763 then 
        R0:tweenPos(R0.x, R0.defaultY - 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY + 40, 0.10)
    end
    -- 2 
    if step == 1765 then 
        R0:tweenPos(R0.defaultX - 40, R0.defaultY, 0.10)
        R7:tweenPos(R7.defaultX + 40, R7.defaultY, 0.10)
    end
    if step == 1766 then 
        R1:tweenPos(R1.defaultX - 40, R1.defaultY, 0.10)
        R6:tweenPos(R6.defaultX + 40, R6.defaultY, 0.10)
    end
    if step == 1767 then 
        R3:tweenPos(R3.defaultX - 40, R3.defaultY, 0.10)
        R4:tweenPos(R4.defaultX + 40, R4.defaultY, 0.10)
    end
    if step == 1768 then 
        R2:tweenPos(R2.defaultX - 40, R2.defaultY, 0.10)
        R5:tweenPos(R5.defaultX + 40, R5.defaultY, 0.10)
    end
    -- 3
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1770 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1771 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 1772 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1773 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        -- 4 
        if step == 1775 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1770 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1771 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 1772 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1773 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        -- 4
        if step == 1775 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 5
    if step == 1776 then 
        R0:tweenPos(R0.x, R0.defaultY + 40, 0.10)
        R7:tweenPos(R7.x, R7.defaultY - 40, 0.10)
    end
    if step == 1777 then 
        R1:tweenPos(R1.x, R1.defaultY + 40, 0.10)
        R6:tweenPos(R6.x, R6.defaultY - 40, 0.10)
    end
    if step == 1778 then 
        R2:tweenPos(R2.x, R2.defaultY + 40, 0.10)
        R5:tweenPos(R5.x, R5.defaultY - 40, 0.10)
    end
    if step == 1779 then 
        R3:tweenPos(R3.x, R3.defaultY + 40, 0.10)
        R4:tweenPos(R4.x, R4.defaultY - 40, 0.10)
    end
    -- 6 
    if step == 1781 then 
        R3:tweenPos(R3.defaultX + 40, R3.defaultY, 0.10)
        R4:tweenPos(R4.defaultX - 40, R4.defaultY, 0.10)
    end
    if step == 1782 then 
        R2:tweenPos(R2.defaultX + 40, R2.defaultY, 0.10)
        R5:tweenPos(R5.defaultX - 40, R5.defaultY, 0.10)
    end
    if step == 1783 then 
        R1:tweenPos(R1.defaultX + 40, R1.defaultY, 0.10)
        R6:tweenPos(R6.defaultX - 40, R6.defaultY, 0.10)
    end
    if step == 1784 then 
        R0:tweenPos(R0.defaultX + 40, R0.defaultY, 0.10)
        R7:tweenPos(R7.defaultX - 40, R7.defaultY, 0.10)
    end
    -- 7 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1786 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1787 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 1788 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1789 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        -- 8
        if step == 1791 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1786 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1787 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 1788 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1789 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        -- 8
        if step == 1791 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
-- Arrow Duet But it's only BF
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1792 then 
            receptor.tweenPos(receptor, receptor.defaultX - 80, receptor.defaultY + 80, 1.3)
        end
        if step == 1804 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 1806 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY, 0.20)
        end
        if step == 1808 then 
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.y, 0.20)
        end
        if step == 1810 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.y, 0.845)
        end
        if step == 1818 then 
            receptor.tweenPos(receptor, receptor.x, receptor.defaultY - 40, 0.20)
        end
        if step == 1820 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.20)
        end
    end
-- Arrow Beating Part 3 
    -- 1 
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1824 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1825 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 1826 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1827 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1824 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1825 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 1826 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1827 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 2
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1829 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1830 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 1831 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1832 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1829 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1830 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 1831 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1832 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 3
    if step == 1834 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    if step == 1835 then 
        R1:tweenAngle(R1.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1)
    end
    if step == 1836 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    if step == 1837 then 
        R2:tweenAngle(R2.angle - 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
    end
    -- 4 
    if step == 1839 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R1:tweenAngle(R1.angle + 180, 0.1)
        R2:tweenAngle(R2.angle - 180, 0.1)
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    -- 5 
    if step == 1840 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    if step == 1841 then
        R1:tweenAngle(R1.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1) 
    end
    if step == 1842 then 
        R2:tweenAngle(R2.angle - 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
    end
    if step == 1843 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1840 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 1841 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1842 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1843 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1840 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 1841 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1842 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1843 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 6 
    if step == 1845 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    if step == 1846 then
        R2:tweenAngle(R2.angle - 180, 0.1)
        R5:tweenAngle(R5.angle + 180, 0.1)
    end
    if step == 1847 then 
        R1:tweenAngle(R1.angle + 180, 0.1)
        R6:tweenAngle(R6.angle - 180, 0.1) 
    end
    if step == 1848 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        if step == 1845 then 
            receptor.tweenPos(receptor, receptor.defaultX + 40, receptor.defaultY, 0.1)
        end
        if step == 1846 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1847 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1848 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        if step == 1845 then 
            receptor.tweenPos(receptor, receptor.defaultX - 40, receptor.defaultY, 0.1)
        end
        if step == 1846 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 40, 0.1)
        end
        if step == 1847 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 40, 0.1)
        end
        if step == 1848 then 
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.1)
        end
    end
    -- 7 
    if step == 1850 then 
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
    end
    if step == 1851 then
        R2:tweenAngle(R2.angle + 180, 0.1)
        R5:tweenAngle(R5.angle - 180, 0.1)
    end
    if step == 1852 then 
        R1:tweenAngle(R1.angle - 180, 0.1)
        R6:tweenAngle(R6.angle + 180, 0.1) 
    end
    if step == 1853 then 
        R0:tweenAngle(R0.angle + 180, 0.1)
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
    -- 8 
    if step == 1855 then
        R0:tweenAngle(R0.angle + 180, 0.1)
        R1:tweenAngle(R1.angle - 180, 0.1)
        R2:tweenAngle(R2.angle + 180, 0.1)
        R3:tweenAngle(R3.angle - 180, 0.1)
        R4:tweenAngle(R4.angle + 180, 0.1)
        R5:tweenAngle(R5.angle - 180, 0.1)
        R6:tweenAngle(R6.angle + 180, 0.1) 
        R7:tweenAngle(R7.angle - 180, 0.1)
    end
-- Centre and Back 
    if step == 1918 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 3.5)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 3.5)
        end
    end
    if step == 1976 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.845)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.845)
        end
    end
-- "Why Do You Hate Me" Disappearing Part 
    if step == 2034 then 
        R0:tweenAlpha(0, 0.05)
        R1:tweenAlpha(0, 0.05)
        R3:tweenAlpha(0, 0.05)
        R4:tweenAlpha(0, 0.05)
        R6:tweenAlpha(0, 0.05)
        R7:tweenAlpha(0, 0.05)
    end
    if step == 2038 then 
        R5:tweenAlpha(0, 0.05)
        R2:tweenAlpha(0, 0.05)
    end
    if step == 2040 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 0.845)
            receptor.tweenAlpha(receptor, 0.3, 0.845)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.defaultY, 0.845)
            receptor.tweenAlpha(receptor, 1, 0.845)
        end
    end
    if step == 2048 then 
        swayScreenCam = true 
    end
-- Last Chorus 
    if step == 2048 then 
        R4:tweenPos(R4.x - 60, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.x - 20, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.x + 20, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.x + 60, R7.defaultY - 60, 0.1)
    end
    if step == 2049 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2056 then 
        R4:tweenPos(R4.x - 60, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x - 20, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x + 20, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x + 60, R7.defaultY + 60, 0.1)
    end
    if step == 2058 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2060 or step == 2061
    or step == 2062 or step == 2063 
    or step == 2064 then 
        R4:tweenPos(R4.x - 12, R4.y - 12, 0.1)
        R5:tweenPos(R5.x - 4, R5.y + 4, 0.1) 
        R6:tweenPos(R6.x + 4, R6.y + 4, 0.1)
        R7:tweenPos(R7.x + 12, R7.y - 12, 0.1)
    end
    if step == 2066 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2068 then 
        R4:tweenPos(R4.x - 15, R4.y, 0.1)
        R5:tweenPos(R5.x - 5, R5.y, 0.1) 
        R6:tweenPos(R6.x + 5, R6.y, 0.1)
        R7:tweenPos(R7.x + 15, R7.y, 0.1)
    end
    if step == 2069 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2076 then 
        R4:tweenPos(R4.defaultX, R4.defaultY + 60, 0.42)
        R5:tweenPos(R5.defaultX, R5.defaultY + 20, 0.42)
        R6:tweenPos(R6.defaultX, R6.defaultY - 20, 0.42)
        R7:tweenPos(R7.defaultX, R7.defaultY - 60, 0.42)
    end
    if step == 2080 then 
        R4:tweenPos(R4.x, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.x, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.x, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.x, R7.defaultY + 60, 0.1)
    end
    if step == 2081 then 
        R4:tweenPos(R4.x, R4.defaultY, 0.42)
        R5:tweenPos(R5.x, R5.defaultY, 0.42)
        R6:tweenPos(R6.x, R6.defaultY, 0.42)
        R7:tweenPos(R7.x, R7.defaultY, 0.42)
    end
    if step == 2086 then 
        R4:tweenPos(R4.defaultX + 40, R4.y, 0.1)
        R5:tweenPos(R5.defaultX + 40, R5.y, 0.1)
        R6:tweenPos(R6.defaultX + 40, R6.y, 0.1)
        R7:tweenPos(R7.defaultX + 40, R7.y, 0.1)
    end
    if step == 2087 then 
        R4:tweenPos(R4.defaultX - 40, R4.y, 0.1)
        R5:tweenPos(R5.defaultX - 40, R5.y, 0.1)
        R6:tweenPos(R6.defaultX - 40, R6.y, 0.1)
        R7:tweenPos(R7.defaultX - 40, R7.y, 0.1)
    end
    if step == 2088 then 
        R4:tweenPos(R4.defaultX, R4.y, 0.1)
        R5:tweenPos(R5.defaultX, R5.y, 0.1)
        R6:tweenPos(R6.defaultX, R6.y, 0.1)
        R7:tweenPos(R7.defaultX, R7.y, 0.1)
    end
    if step == 2092 or step == 2093
    or step == 2094 or step == 2095 
    or step == 2096 then 
        R4:tweenPos(R4.x - 12, R4.y + 12, 0.1)
        R5:tweenPos(R5.x - 4, R5.y + 4, 0.1) 
        R6:tweenPos(R6.x + 4, R6.y - 4, 0.1)
        R7:tweenPos(R7.x + 12, R7.y - 12, 0.1)
    end
    if step == 2098 then 
        R4:tweenPos(R4.defaultX, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX, R7.defaultY, 0.1)
    end
    if step == 2108 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2112 then 
        R4:tweenPos(R4.x - 15, R4.y, 0.1)
        R5:tweenPos(R5.x - 5, R5.y, 0.1) 
        R6:tweenPos(R6.x + 5, R6.y, 0.1)
        R7:tweenPos(R7.x + 15, R7.y, 0.1)
    end
    if step == 2113 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2120 then 
        R4:tweenPos(R7.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R6.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R5.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R4.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2122 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2124 or step == 2125
    or step == 2126 or step == 2127 
    or step == 2128 then 
        R4:tweenPos(R4.x - 12, R4.y + 12, 0.1)
        R5:tweenPos(R5.x - 4, R5.y - 4, 0.1) 
        R6:tweenPos(R6.x + 4, R6.y - 4, 0.1)
        R7:tweenPos(R7.x + 12, R7.y + 12, 0.1)
    end
    if step == 2130 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2132 then 
        R4:tweenPos(R4.x - 15, R4.y, 0.1)
        R5:tweenPos(R5.x - 5, R5.y, 0.1) 
        R6:tweenPos(R6.x + 5, R6.y, 0.1)
        R7:tweenPos(R7.x + 15, R7.y, 0.1)
    end
    if step == 2133 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2140 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY + 60, 0.42)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY + 20, 0.42)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY - 20, 0.42)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY - 60, 0.42)
    end
    if step == 2144 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY - 60, 0.1)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY - 20, 0.1)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY + 20, 0.1)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY + 60, 0.1)
    end
    if step == 2145 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY, 0.42)
    end
    if step == 2160 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.845)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.845)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.845)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.845)
    end 
    if step == 2168 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.845)
        end
    end
    if step == 2176 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 1
        end
    end
    if step == 2192 then 
        R4:tweenPos(R4.x - 15, R4.defaultY - 15, 0.1)
        R5:tweenPos(R5.x - 5, R5.defaultY + 5, 0.1) 
        R6:tweenPos(R6.x + 5, R6.defaultY + 5, 0.1)
        R7:tweenPos(R7.x + 15, R7.defaultY - 15, 0.1)
    end
    if step == 2194 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.1)
    end
    if step == 2196 then 
        R4:tweenPos(R4.x - 15, R4.defaultY, 0.1)
        R5:tweenPos(R5.x - 5, R5.defaultY, 0.1) 
        R6:tweenPos(R6.x + 5, R6.defaultY, 0.1)
        R7:tweenPos(R7.x + 15, R7.defaultY, 0.1)
    end
    if step == 2197 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42) 
    end
    if step == 2204 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY - 60, 0.42)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY - 20, 0.42)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY + 20, 0.42)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY + 60, 0.42) 
    end
    if step == 2208 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY + 60, 0.1)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY + 20, 0.1)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY - 20, 0.1)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY - 60, 0.1) 
    end
    if step == 2209 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY, 0.42) 
    end
    if step == 2214 then 
        R4:tweenPos(R4.defaultX - 680, R4.y, 0.1)
        R5:tweenPos(R5.defaultX - 680, R5.y, 0.1)
        R6:tweenPos(R6.defaultX - 680, R6.y, 0.1)
        R7:tweenPos(R7.defaultX - 680, R7.y, 0.1)
    end
    if step == 2215 then 
        R4:tweenPos(R4.defaultX - 600, R4.y, 0.1)
        R5:tweenPos(R5.defaultX - 600, R5.y, 0.1)
        R6:tweenPos(R6.defaultX - 600, R6.y, 0.1)
        R7:tweenPos(R7.defaultX - 600, R7.y, 0.1)
    end
    if step == 2216 then 
        R4:tweenPos(R4.defaultX - 640, R4.y, 0.1)
        R5:tweenPos(R5.defaultX - 640, R5.y, 0.1)
        R6:tweenPos(R6.defaultX - 640, R6.y, 0.1)
        R7:tweenPos(R7.defaultX - 640, R7.y, 0.1)
    end
    if step == 2220 or step == 2221
    or step == 2222 or step == 2223 
    or step == 2224 then 
        R4:tweenPos(R4.x - 12, R4.y - 12, 0.1)
        R5:tweenPos(R5.x - 4, R5.y - 4, 0.1) 
        R6:tweenPos(R6.x + 4, R6.y + 4, 0.1)
        R7:tweenPos(R7.x + 12, R7.y + 12, 0.1)
    end
    if step == 2226 then 
        R4:tweenPos(R4.defaultX - 640, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 640, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 640, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 640, R7.defaultY, 0.1)
    end
    if step == 2236 then
        swayScreenCam = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 0.42)
        end 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2240 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.845)
        end
        R4:tweenPos(R4.x - 320, R4.defaultY, 0.845)
        R5:tweenPos(R5.x - 260, R5.defaultY, 0.845)
        R6:tweenPos(R6.x + 260, R6.defaultY, 0.845)
        R7:tweenPos(R7.x + 320, R7.defaultY, 0.845) 
    end
    if step == 2248 or step == 2250 then 
        swayScreenCam = true 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.alpha = 0.3
        end
        R4:tweenPos(R4.x + 160, R4.defaultY, 0.1)
        R5:tweenPos(R5.x + 130, R5.defaultY, 0.1)
        R6:tweenPos(R6.x - 130, R6.defaultY, 0.1)
        R7:tweenPos(R7.x - 160, R7.defaultY, 0.1)
    end
    if step == 2252 or step == 2253
    or step == 2254 or step == 2255 
    or step == 2256 then 
        R4:tweenPos(R4.x - 12, R4.y + 12, 0.1)
        R5:tweenPos(R5.x - 4, R5.y - 4, 0.1) 
        R6:tweenPos(R6.x + 4, R6.y - 4, 0.1)
        R7:tweenPos(R7.x + 12, R7.y + 12, 0.1)
    end
    if step == 2258 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2268 then 
        R4:tweenPos(R7.defaultX - 320, R4.defaultY, 0.2)
        R5:tweenPos(R6.defaultX - 320, R5.defaultY, 0.2)
        R6:tweenPos(R5.defaultX - 320, R6.defaultY, 0.2)
        R7:tweenPos(R4.defaultX - 320, R7.defaultY, 0.2)
    end
    if step == 2270 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.2)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.2)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.2)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.2)
    end
    if step == 2304 then 
        R4:tweenPos(R4.x - 60, R4.defaultY, 0.42)
        R5:tweenPos(R5.x - 20, R5.defaultY, 0.42)
        R6:tweenPos(R6.x + 20, R6.defaultY, 0.42)
        R7:tweenPos(R7.x + 60, R7.defaultY, 0.42)
    end
    if step == 2308 or step == 2310 then 
        R4:tweenPos(R4.defaultX - 340, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 300, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 260, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 220, R7.defaultY, 0.1)
    end
    if step == 2309 or step == 2311 then 
        R4:tweenPos(R4.defaultX - 420, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 380, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 340, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 300, R7.defaultY, 0.1)
    end
    if step == 2312 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2336 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY - 40, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY - 40, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY - 40, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY - 40, 0.42)
    end
    if step == 2340 then
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2348 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.42)
        end
    end
    if step == 2364 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
    end
    if step == 2368 then 
        R4:tweenPos(R4.x - 60, R4.defaultY, 0.42)
        R5:tweenPos(R5.x - 20, R5.defaultY, 0.42)
        R6:tweenPos(R6.x + 20, R6.defaultY, 0.42)
        R7:tweenPos(R7.x + 60, R7.defaultY, 0.42)
    end
    if step == 2372 or step == 2374 then 
        R4:tweenPos(R4.defaultX - 420, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 380, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 340, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 300, R7.defaultY, 0.1)
    end
    if step == 2373 or step == 2375 then 
        R4:tweenPos(R4.defaultX - 340, R4.defaultY, 0.1)
        R5:tweenPos(R5.defaultX - 300, R5.defaultY, 0.1)
        R6:tweenPos(R6.defaultX - 260, R6.defaultY, 0.1)
        R7:tweenPos(R7.defaultX - 220, R7.defaultY, 0.1)
    end
    if step == 2376 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
    if step == 2400 then 
        R4:tweenPos(R4.defaultX - 320, R4.defaultY + 40, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY + 40, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY + 40, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY + 40, 0.42)
    end
    if step == 2404 then
        R4:tweenPos(R4.defaultX - 320, R4.defaultY, 0.42)
        R5:tweenPos(R5.defaultX - 320, R5.defaultY, 0.42)
        R6:tweenPos(R6.defaultX - 320, R6.defaultY, 0.42)
        R7:tweenPos(R7.defaultX - 320, R7.defaultY, 0.42)
    end
-- Almost Ending 
    if step == 2416 then 
        swayScreenCam = false 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 1.27)
            receptor.tweenAlpha(receptor, 0, 1.27)
        end
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.defaultY, 1.27)
        end
    end
    if step == 2428 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.42)
        end
        R0:tweenPos(R0.defaultX, R0.defaultY, 0.42)
        R0:tweenAngle(R0.angle - 360, 0.42)
        R1:tweenPos(R1.defaultX + 60, R1.defaultY, 0.42)
        R1:tweenAngle(R1.angle - 360, 0.42)
        R2:tweenPos(R2.defaultX + 580, R2.defaultY, 0.42)
        R2:tweenAngle(R2.angle + 360, 0.42)
        R3:tweenPos(R3.defaultX + 640, R3.defaultY, 0.42)
        R3:tweenAngle(R3.angle + 360, 0.42)
    end
-- Ending 
    if step == 2698 then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 3.44)
        end
            R0:tweenPos(R0.defaultX + 320, R0.defaultY, 42)
            R0:tweenAngle(R0.angle - 741, 23)
            R1:tweenPos(R1.defaultX + 320, R1.defaultY, 32)
            R1:tweenAngle(R1.angle - 698, 42)
            R2:tweenPos(R2.defaultX + 320, R2.defaultY, 21)
            R2:tweenAngle(R2.angle + 754, 15)
            R3:tweenPos(R3.defaultX + 320, R3.defaultY, 53)
            R3:tweenAngle(R3.angle + 719, 64)
    end
    if step == 2842 then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 3.44)
        end
    end
end 