local xx = 580;
local yy = 300;
local xx2 = 820;
local yy2 = 450;
local ofs = 30;
local angleshit = 1;
local anglevar = 1;
local followchars = true;
function onCreate()
	-- background shit
	makeLuaSprite('place2', 'place2', -600, -300);
	
	addLuaSprite('place2', false);

makeAnimatedLuaSprite('people', 'Group', 250, 380)
addAnimationByPrefix('people', 'bounce', 'people idle', 24, true)
addLuaSprite('people', false)
objectPlayAnimation('people', 'bounce', true)

makeAnimatedLuaSprite('glitch', 'static', -600, -300);
scaleObject('glitch', 2, 2);
addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
objectPlayAnimation('glitch', 'glitchout');
addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
triggerEvent('Load Shader', '', '')-- delete if you dont want the shader
	
end

function onStepHit()
    cameraShake('hud', 0.003, 0.2);
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Sword' then
	   	characterPlayAnim('gf', 'finn slash', true);
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('pibby','bounce',true)
    end
end

function opponentNoteHit()	
    local luckyRoll = math.random(1, 50)
    local luckyRoll2 = math.random(1, 50)
    
    if mustHitSection == false then
        if (luckyRoll >= 45) then
            cameraShake('hud', 0.08, 0.05);
        end
    end
    if mustHitSection == false then
        if (luckyRoll2 >= 45) then
            cameraShake('game', 0.08, 0.05);
        end
    end
end