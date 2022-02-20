function onCreate()
	-- background shit



	makeLuaSprite('cielo', 'cielo', -600, -300);
	addLuaSprite('cielo', false);	

	makeLuaSprite('patio', 'patio', -600, -300);
	addLuaSprite('patio', false);

	makeLuaSprite('vallas', 'vallas', 85, -120);
	addLuaSprite('vallas', true);

						makeAnimatedLuaSprite('matt', 'matt', 1950, 200);
		setProperty('matt.flipX', false);
		addAnimationByPrefix('matt', 'enter', 'MattWalking', 14, true);
		addAnimationByPrefix('matt', 'idle', 'MattSnappingFinger', 24, true);
		addAnimationByPrefix('matt', 'pissed', 'MattPISSED', 24, true);
			setProperty('matt.scale.x', getProperty('matt.scale.x') + 0.56);
			setProperty('matt.scale.y', getProperty('matt.scale.y') + 0.56);
			setLuaSpriteScrollFactor('matt', 1, 1);
				addLuaSprite('matt', false);

		makeAnimatedLuaSprite('tom', 'tom', 1980, 290);
		setProperty('tom.flipX', true);
		addAnimationByPrefix('tom', 'enter', 'TomWalking', 14, true);
		addAnimationByPrefix('tom', 'idle', 'TomLooking', 14, true);
		addAnimationByPrefix('tom', 'pissed', 'TomReaction', 24, true);
			setProperty('tom.scale.x', getProperty('tom.scale.x') + 0.56);
			setProperty('tom.scale.y', getProperty('tom.scale.y') + 0.56);
			setLuaSpriteScrollFactor('tom', 1, 1);
				addLuaSprite('tom', false);

makeAnimatedLuaSprite('mark','mark',540, 130)
addAnimationByPrefix('mark','mark','mark',24,true)
addLuaSprite('mark',false)

	makeAnimatedLuaSprite('john','john',330, 100)
addAnimationByPrefix('john','john','john',24,true)
addLuaSprite('john',false)

	makeLuaSprite('carro', 'carro', -835, 800);
	addLuaSprite('carro', true);	

	makeAnimatedLuaSprite('character', 'characters/gfedd', 1680, 100); -- change 'character' to the name of your character, change 'dad' to the name of the .png and .xml file

	addAnimationByPrefix('character', 'idle', 'GF Dancing Beat', 24, true); -- change 'character' to the name of your character, don't change 'idle', change 'Dad idle dance' to the idle animation in your xml file
	addAnimationByPrefix('character', 'singLEFT', 'Dad Sing Note LEFT', 24, false); -- repeat this for each one ^^^
	addAnimationByPrefix('character', 'singDOWN', 'Dad Sing Note DOWN', 24, false);
	addAnimationByPrefix('character', 'singUP', 'Dad Sing Note UP', 24, false);
	addAnimationByPrefix('character', 'singRIGHT', 'Dad Sing Note RIGHT', 24, false);

	objectPlayAnimation('character', 'idle'); -- change 'character'
	addLuaSprite('character', false); -- change 'character' to the name of your character and put the 'false' to true if you want the character to be in front of the original characters
end 

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'character' then
		objectPlayAnimation('character', singAnims[direction + 1], false)
	end
end 

function onBeatHit()	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('character', 'idle');
	end
end 

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('character', 'idle');
	end


end



function onEvent(name,value1,value2)
	if name == 'Play Animation' then 

		if value1 == 'mattw' then
		addLuaSprite('matt', false);
		objectPlayAnimation('matt', 'enter', true); --gf plays the walking anim
		doTweenX('mattTweenX', 'matt', 1200, 7, 'linear'); --gf seemingly moves
	end	

		if value2 == 'tomw' then
		addLuaSprite('tom', true);
		objectPlayAnimation('tom', 'enter', true); --gf plays the walking anim
		doTweenX('tomTweenX', 'tom', 2570, 4, 'linear'); --gf seemingly moves
	end	

	   	if value1 == 'matti' then	
		    objectPlayAnimation('matt', 'idle', true); --after gf walks into the stage, she plays her idle

    end

    	   	if value2 == 'tomi' then	
		    objectPlayAnimation('tom', 'idle', true); --after gf walks into the stage, she plays her idle


    end
		if value1 == 'mattp' then	
		    objectPlayAnimation('matt', 'pissed', true); --after gf walks into the stage, she plays her idle	


		if value2 == 'tomp' then	
		    objectPlayAnimation('tom', 'pissed', true); --after gf walks into the stage, she plays her idle												
		end
end	end
end

