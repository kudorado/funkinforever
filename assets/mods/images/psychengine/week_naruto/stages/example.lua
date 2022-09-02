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
	makeLuaSprite('StageBG', 'Narutobg/StageBG', -600, -300);
	
	addLuaSprite('StageBG', false);

makeAnimatedLuaSprite('pibbyshit','pibbyshade',1270,600)
addAnimationByPrefix('pibbyshit','bounce','pibby terrified',24,false)
addLuaSprite('pibbyshit',true)
	
makeAnimatedLuaSprite('ink','Narutobg/ink',-600, 450)
addAnimationByPrefix('ink','ink','ink',24,false)
addLuaSprite('ink')
setScrollFactor('ink',0.95,0.95)

makeAnimatedLuaSprite('pibby','pibbyshade',1270,600)
addAnimationByPrefix('pibby','bounce','pibby idle',24,false)
addLuaSprite('pibby',true)


makeAnimatedLuaSprite('glitch', 'static', -600, -300);
scaleObject('glitch', 2, 2);
addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
objectPlayAnimation('glitch', 'glitchout');
addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
triggerEvent('Load Shader', '', '')-- delete if you dont want the shader
	
end

function onBeatHit()
    if curBeat % 2 == 0 then
        removeLuaSprite('pibbyshit','bounce',true);       
        removeLuaSprite('ink','ink',true);
        objectPlayAnimation('pibby','bounce',true);

    if curBeat % 2 == 703 then
        removeLuaSprite('pibby','bounce',true);
        objectPlayAnimation('pibbyshit','bounce','pibby terrified',true);
        addLuaSprite('ink', true);
        objectPlayAnimation('ink','ink',true);
        end
    end
end

function onStepHit()
        cameraShake('hud', 0.003, 0.2);
end

function opponentNoteHit()
    if curBeat % 2 == 0 then	
        local luckyRoll = math.random(1, 50)
        local luckyRoll2 = math.random(1, 50)

    if curBeat % 2 == 159 then	
        local luckyRoll = math.random(1, 50)
        local luckyRoll2 = math.random(1, 50)

    if curBeat % 2 == 175 then	
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
        end
    end
end