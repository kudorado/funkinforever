local xx = 430;
local yy = 200;
local xx2 = 820;
local yy2 = 450;
local ofs = 30;
local ofs2 = 15;
local angleshit = 0.5;
local anglevar = 0.5;
local followchars = true;
function onCreate()
	-- background shit
      
        makeLuaSprite('bg', 'bg', -600, -300);
	scaleObject('bg', 1, 1); 

        makeLuaSprite('StageBG', 'Narutobg/StageBG', -600, -300);
	scaleObject('StageBG', 1, 1);    

        makeAnimatedLuaSprite('ink','Narutobg/ink',-600, 450)
        addAnimationByPrefix('ink','ink','ink',24,false)
        addLuaSprite('ink')
        setScrollFactor('ink',0.95,0.95)  
		
	makeAnimatedLuaSprite('glitch', 'static', -600, -300);
	scaleObject('glitch', 2, 2);
	addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
	objectPlayAnimation('glitch', 'glitchout');

        makeLuaSprite('void', 'void', -600, -300);
	addLuaSprite('void', false);
        	
end

function onStepHit()
    if curStep == 127 then
           addLuaSprite('bg', false);
	   addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
end
    if curStep == 703 then
           removeLuaSprite('bg', true)
           addLuaSprite('StageBG', false);
           addAnimatedLuaSprite('ink', false);
       --cameraShake('hud', 0.003, 0.2);
    end
end