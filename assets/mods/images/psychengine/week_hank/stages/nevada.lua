function onCreate()
	camY = 'camFollow.y';
	camX = 'camFollow.x';
	nevada = true;
	
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bfded'); --put in mods/sounds/
	
    makeLuaSprite('city', 'nevada/nevada_city', -600, -100) --the background
		addLuaSprite('city', false);
			setProperty('city.scale.x', getProperty('city.scale.x') + 0.6);
			setProperty('city.scale.y', getProperty('city.scale.y') + 0.2);
		
	if not lowQuality then
		makeAnimatedLuaSprite('heli', 'nevada/choppalol', -1680, 10) --the heli that deimos and sanford ride.
			addLuaSprite('heli', false); --Added offscreen before it starts moving.
				addAnimationByPrefix('heli', 'Move', 'choppa xD', 24, true);
	
		makeLuaSprite('hill', 'nevada/nevada_hill', -200, 100) --the hill that deimos and sanford occupy.
			addLuaSprite('hill', false);
				setProperty('hill.scale.x', getProperty('hill.scale.x') + 0.8);
				setProperty('hill.scale.y', getProperty('hill.scale.y') + 0.6);
	
		makeAnimatedLuaSprite('sanford', 'nevada/stanford', 1370, 100) --sanford's sprites. bool statement means if the animation should loop or not.
			addAnimationByPrefix('sanford', 'enter', 'stanford land', 12, false);
			addAnimationByPrefix('sanford', 'idle', 'stanford dance', 14, false);
			addAnimationByPrefix('sanford', 'shoot', 'stanford shoot', 20, false);
				setProperty('sanford.scale.x', getProperty('sanford.scale.x') + 0.26);
				setProperty('sanford.scale.y', getProperty('sanford.scale.y') + 0.26);
	
		makeAnimatedLuaSprite('deimos', 'nevada/deimous', -790, 100); --deimos's sprites
			addAnimationByPrefix('deimos', 'enter', 'deimous land', 12, false);
			addAnimationByPrefix('deimos', 'idle', 'deimous dance', 14, true);
			addAnimationByPrefix('deimos', 'shoot', 'deimous shoot', 20, false);
				setProperty('deimos.scale.x', getProperty('deimos.scale.x') + 0.26);
				setProperty('deimos.scale.y', getProperty('deimos.scale.y') + 0.26);
		
		--makeAnimatedLuaSprite('shotflashDeimos', nil, -790, 0);
			--doTweenColor('shotflashDeimosColorTween', 'shotflashDeimos', 'cccccc', 0.01, 'linear');			addAnimationByPrefix('deimos', 'shoot', 'deimous shoot', 20, false);
			--makeGraphic('shotflashDeimos', 400, 300, 'cccccc');
			--setBlendMode('shotflashDeimos', 'screen');
		
		--makeLuaSprite('shotflashSanford', nil, 1370, 0);
			--doTweenColor('shotflashDeimosColorTween', 'shotflashSanford', 'cccccc', 0.01, 'linear');			addAnimationByPrefix('sanford', 'shoot', 'stanford shoot', 20, false);
			--makeGraphic('shotflashSanford', 400, 300, 'cccccc');
			--setBlendMode('shotflashSanford', 'screen');
	end
			
	makeAnimatedLuaSprite('tiky', 'nevada/tikyfall', 340, -50); -- tricky falling off the speaker
		addAnimationByPrefix('tiky', 'skidaddle', 'fall', 24, true); --the animation
	
    makeLuaSprite('stage', 'nevada/nevada_stage', -400, -220); --the stage where everybody sings!
		addLuaSprite('stage', false);
			setProperty('stage.scale.x', getProperty('stage.scale.x') + 0.6);
			setProperty('stage.scale.y', getProperty('stage.scale.y') + 0.8);
			
	makeAnimatedLuaSprite('speaker', 'nevada/speakers', 185, 460); --the speakers that tricky sings on, and later falls off of
		addAnimationByPrefix('speaker', 'idle', 'GF Dancing Beat', 24, true);
			setLuaSpriteScrollFactor('speaker', 1, 1);
	
	makeAnimatedLuaSprite('hotdog', 'nevada/gfhotdog', 2000, 500); --creating gf walking in with a hotdog
		addAnimationByPrefix('hotdog', 'enter', 'girlfriend walk', 8, true);
		addAnimationByPrefix('hotdog', 'idle', 'girlfriend dance idle', 24, true);
			setProperty('hotdog.scale.x', getProperty('hotdog.scale.x') + 0.56);
			setProperty('hotdog.scale.y', getProperty('hotdog.scale.y') + 0.56);
			setLuaSpriteScrollFactor('hotdog', 1, 1);
	
	makeLuaSprite('yeet', 'nevada/cya', 220, 220); --creating the gf sprite that flies away
		setProperty('yeet.scale.x', getProperty('yeet.scale.x') + 0.5);
		setProperty('yeet.scale.y', getProperty('yeet.scale.y') + 0.5);
			
	makeLuaSprite('shot', 'nevada/tracer', 2000, 640); --da Bullet
		addLuaSprite('shot', true); --creating the bullet offscreen for later
		
	if not lowQuality then
		makeLuaSprite('foreground', 'nevada/nevada_foreground', -970, -215); --the foreground, aka tent with the word MADNESS on it
			addLuaSprite('foreground', true);
				setProperty('foreground.scale.x', getProperty('foreground.scale.x') + 0.75);
				setProperty('foreground.scale.y', getProperty('foreground.scale.y') + 0.8);
	
		makeAnimatedLuaSprite('laserdot', 'nevada/laser', 520, 210); --x 520 y 210
			addAnimationByPrefix('laserdot', 'enter', 'laser idle', 24, false);
			addAnimationByPrefix('laserdot', 'bop', 'laser bop', 24, true);
			setProperty('laserdot.scale.x', getProperty('laserdot.scale.x') + 0.6);
			setProperty('laserdot.scale.y', getProperty('laserdot.scale.y') + 0.6);
	end	
			
	if difficulty == 2 then --don't need hellclown if the difficulty isn't "fucked"
		if not lowQuality then
			makeAnimatedLuaSprite('hellclown', 'nevada/hellclown', 180, 1500); --hellclown,
			makeAnimatedLuaSprite('lefthand', 'nevada/hand', -300, 2050); --his left hand,
			makeAnimatedLuaSprite('righthand', 'nevada/hand', 1000, 2050); --and his right hand.
			
				addAnimationByPrefix('hellclown', 'idle', 'hellclown idle', 12, true);
				addAnimationByPrefix('lefthand', 'idle', 'hand idle', 14, true);
				addAnimationByPrefix('righthand', 'idle', 'hand idle', 14, true);
				
				setProperty('hellclown.scale.x', getProperty('hellclown.scale.x') + 0.7);
				setProperty('hellclown.scale.y', getProperty('hellclown.scale.y') + 0.7);
				setLuaSpriteScrollFactor('hellclown', 1, 1);
				
				setProperty('lefthand.scale.x', getProperty('lefthand.scale.x') + 0.9);
				setProperty('lefthand.scale.y', getProperty('lefthand.scale.y') + 0.9);
				setLuaSpriteScrollFactor('lefthand', 1, 1);
				
				setProperty('righthand.scale.x', getProperty('righthand.scale.x') + 0.9);
				setProperty('righthand.scale.y', getProperty('righthand.scale.y') + 0.9);
				setLuaSpriteScrollFactor('righthand', 1, 1);
		end				
		if not hideHud then
			if downscroll then
				makeAnimatedLuaSprite('lever', 'nevada/gremlin', 390, 40); --the health draining lever
				setProperty('lever.flipY', true);
			else
				makeAnimatedLuaSprite('lever', 'nevada/gremlin', 390, 410);
			end
			setProperty('lever.scale.x', getProperty('lever.scale.x') - 0.3);
			setProperty('lever.scale.y', getProperty('lever.scale.y') - 0.3);
			setObjectCamera('lever', 'hud');
			addAnimationByPrefix('lever', 'enter', 'enter', 21, false);
			addAnimationByPrefix('lever', 'idle', 'idle', 18, true);
			addAnimationByIndices('lever', 'exit', 'enter', '16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0', 18);
			
			setLuaSpriteScrollFactor('lever', 0, 0);
		end
	elseif difficulty == 1 then --adds the climbing enemies for "hard" difficulty
		makeAnimatedLuaSprite('agent', 'nevada/agent', 370, 1000);
			addAnimationByPrefix('agent', 'agentdie', 'poo poo agent', 12, false);
			setProperty('agent.scale.x', getProperty('agent.scale.x') + 0.2);
			setProperty('agent.scale.y', getProperty('agent.scale.y') + 0.2);
		
		makeAnimatedLuaSprite('engineer', 'nevada/engineer', 910, 1000);
			addAnimationByPrefix('engineer', 'engineerdie', 'engineer idle', 12, false);
			setProperty('engineer.scale.x', getProperty('engineer.scale.x') + 0.2);
			setProperty('engineer.scale.y', getProperty('engineer.scale.y') + 0.2);
		
		makeAnimatedLuaSprite('grunt', 'nevada/grunt', -150, 1000);
			addAnimationByPrefix('grunt', 'gruntdie', 'grunt is dead :)', 12, false);
			setProperty('grunt.scale.x', getProperty('grunt.scale.x') + 0.2);
			setProperty('grunt.scale.y', getProperty('grunt.scale.y') + 0.2);
	end
	--a bunch of precaching to brace for lag
	
	if difficulty == 2 then
		precacheImage('nevada/notes/EX Note');
		precacheImage('nevada/gremlin');
		if not lowQuality then
			precacheImage('nevada/hellclown');
			precacheImage('nevada/hand');
		end
	elseif difficulty == 1 then
		if not lowQuality then
			precacheImage('nevada/grunt');
			precacheImage('nevada/engineer');
			precacheImage('nevada/agent');
		end
		precacheImage('nevada/notes/Hell Note');
	end
	
	if not lowQuality then
		precacheImage('nevada/cya');
		precacheImage('nevada/laser');
		precacheImage('nevada/stanford');
		precacheImage('nevada/deimous');
		precacheImage('nevada/tiky');
		precacheImage('nevada/speakers');
	end
	precacheImage('nevada/notes/Bullet_Note');
	addCharacterToList('hank-scared', 'dad'); 
	addCharacterToList('acceleranttricky', 'gf');
	addCharacterToList('gf-handsup', 'gf');
	precacheSound('hankshoot');
	precacheSound('hankreadyupsound');
	precacheSound('Screamfade');
	if difficulty == 2 then
		precacheSound('hellclown');
	end
end

function onStartCountdown()
	setProperty(camX, 350);
				
	addLuaSprite('hellclown', false); --hellclown appears
	addLuaSprite('lefthand', false);
	addLuaSprite('righthand', false);
	setProperty('hellclown.visible', false);
	setProperty('lefthand.visible', false);
	setProperty('righthand.visible', false);
	-- countdown started, duh
	-- return Function_Stop if you want to stop the countdown from happening (Can be used to trigger dialogues and stuff! You can trigger the countdown with startCountdown())
	return Function_Continue;
end

stepHitFuncs = { --a bunch of timed events, timed to steps
	[1] = function()
		setProperty('defaultCamZoom', 0.7);
	end,
	[16] = function()
		playSound('hankreadyupsound', 0.85);
		doTweenZoom('come on', 'camGame', 0.7, 0.3, 'circInOut');
	end,
    [32] = function() --heli starts moving
		doTweenX('heliTweenX', 'heli', 2000, 8, 'linear');
		objectPlayAnimation('heli', 'Move', false);
    end,
    [293] = function() --deimos and sanford appear, 293
		addLuaSprite('sanford', false);
		addLuaSprite('deimos', false);
		objectPlayAnimation('sanford', 'enter', false);
		objectPlayAnimation('deimos', 'enter', false);
		runTimer('entertimer', 0.5, 1);
		setProperty('defaultCamZoom', 0.6);
		addLuaSprite('shotflashDeimos', false);
		addLuaSprite('shotflashSanford', false);
    end,
	[298] = function() --laser
		if not lowQuality then
			addLuaSprite('laserdot', true);
			objectPlayAnimation('laserdot', 'enter', true);
			runTimer('laserenter', 0.25, 1);
		end
	end,
	[664] = function() --yeet gf gets into position, 664
		addLuaSprite('yeet', false);
		addLuaSprite('speaker', false);
	end,
	[665] = function() --gf gets yeeted off the speaker, 665
		doTweenZoom('tikyarrives', 'camGame', 0.85, 1, 'circInOut');
		doTweenX('yeetTweenX', 'yeet', 2000, 0.3, 'linear');
		doTweenY('yeetTweenY', 'yeet', 700, 0.3, 'linear');
		removeLuaSprite('laserdot', false);
	end,
	[684] = function() --lever, 684
		if difficulty == 2 then
			if not hideHud then
				addLuaSprite('lever', false);
				objectPlayAnimation('lever', 'enter', true);
				runTimer('leverenter', 1.4, 1);
				--if downscroll then					setProperty('lever.flipY', true);				else					setProperty('lever.flipY', false);				end
			end
			runTimer('hpdrain', 0.1, 0);
		end
	end,
	[745] = function() --tiky with laser, 745
		if not lowQuality then
			addLuaSprite('laserdot', true);
			doTweenX('laserdotTweenX', 'laserdot', 690, 0.01, 'linear');
			doTweenY('laserdotTweenY', 'laserdot', 240, 0.01, 'linear');
		end
	end,
	[931] = function()
		doTweenZoom('hold the phone', 'camGame', 0.7, 1, 'circInOut');
	end,
	[937] = function() --tiky falls, 937
		setProperty('gf.visible', false);
		addLuaSprite('tiky', false);
		objectPlayAnimation('skidaddle', true); --making tricky play the wiggling animation
		doTweenY('tikygoestoheaven', 'tiky', -450, 0.38, 'expoOut'); --tricky flies off
		playSound('Screamfade', 0.9); --HAAAAAAAY
	end,
	[992] = function() --992
		if not lowQuality then
			if difficulty == 2 then --checking if the difficulty is "fucked" (hard)
				removeLuaSprite('stage', false);
				removeLuaSprite('speaker', false);
				setProperty('hellclown.visible', true);
				setProperty('lefthand.visible', true);
				setProperty('righthand.visible', true);
				runTimer('idletimer', 0.6, 1);
				objectPlayAnimation('hellclown', 'idle', true);
				objectPlayAnimation('lefthand', 'idle', true);
				addLuaSprite('stage', false);
				addLuaSprite('speaker', false);
				setProperty('righthand.flipX', true);
				doTweenY('hellclownTweenY', 'hellclown', -200, 3, 'linear');
				doTweenY('lethandTweenY', 'lefthand', 350, 3, 'linear');
				doTweenY('righthandTweenY', 'righthand', 350, 3, 'linear');
				runTimer('scream', 0.5, 1);
			elseif difficulty == 1 then -- enemies appear on "hard" (normal)
				removeLuaSprite('speaker', false);
				removeLuaSprite('stage', false);
				removeLuaSprite('hotdog', false);
				addLuaSprite('agent', false);
				addLuaSprite('engineer', false);
				addLuaSprite('grunt', false);
				addLuaSprite('stage', false);
				addLuaSprite('speaker', false);
			end
		end
	end,
	[1014] = function() --makes gf walk into the stage, 1014
		removeLuaSprite('stage', false); --layering
		removeLuaSprite('speaker', false);
		addLuaSprite('stage', false);
		addLuaSprite('speaker', false);
		addLuaSprite('hotdog', false);
		objectPlayAnimation('hotdog', 'enter', false); --gf plays the walking anim
		doTweenX('hotdogTweenX', 'hotdog', 1050, 2.5, 'linear'); --gf seemingly moves
	end,
}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() -- Executes function at curStep in stepHitFuncs
    end
	if curStep > 863 then
		removeLuaSprite('laserdot'); --laser dot is gone forever
	end
end

function onMoveCamera(focus) --camera changes a bit after hellclown appears
	if focus == 'boyfriend' and difficulty == 2 and curStep >= 992 then --992
		setProperty(camY, getProperty(camY) - 100);
		setProperty(camX, getProperty(camX) - 150);
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' and difficulty == 2 and curStep >= 992 then --992
		setProperty(camY, getProperty(camY) - 100);
		setProperty(camX, getProperty(camX) + 150);
		-- called when the camera focus on dad
	end
end

randomEnemyFuncs = { --da climbing enemies
	[1] = function()
		locationFuncs = {
			[1] = function()
				doTweenX('gruntTweenX', 'grunt', -150, 0.01, 'linear');
				doTweenY('gruntTweenY', 'grunt', 480, 0.01, 'linear');
				objectPlayAnimation('grunt', 'gruntdie', true);
				runTimer('gruntdeath', 0.810, 1);
			end,
			[2] = function()
				doTweenX('gruntTweenX', 'grunt', 910, 0.01, 'linear');
				doTweenY('gruntTweenY', 'grunt', 490, 0.01, 'linear');
				objectPlayAnimation('grunt', 'gruntdie', true);
				runTimer('gruntdeath', 0.810, 1);
			end,
			[3] = function()
				doTweenX('gruntTweenX', 'grunt', 370, 0.01, 'linear');
				doTweenY('gruntTweenY', 'grunt', 150, 0.01, 'linear');
				objectPlayAnimation('grunt', 'gruntdie', true);
				runTimer('gruntdeath', 0.810, 1);
			end,
		}
	end,
	[2] = function()
		locationFuncs = {
			[1] = function()
				doTweenX('agentTweenX', 'agent', -150, 0.01, 'linear');
				doTweenY('agentTweenY', 'agent', 480, 0.01, 'linear');
				objectPlayAnimation('agent', 'agentdie', true);
				runTimer('agentdeath', 0.810, 1);
			end,
			[2] = function()
				doTweenX('agentTweenX', 'agent', 910, 0.01, 'linear');
				doTweenY('agentTweenY', 'agent', 500, 0.01, 'linear');
				objectPlayAnimation('agent', 'agentdie', true);
				runTimer('agentdeath', 0.810, 1);
			end,
			[3] = function()
				doTweenX('agentTweenX', 'agent', 370, 0.01, 'linear');
				doTweenY('agentTweenY', 'agent', 150, 0.01, 'linear');
				objectPlayAnimation('agent', 'agentdie', true);
				runTimer('agentdeath', 0.810, 1);
			end,
		}
	end,
	[3] = function()
		locationFuncs = {
			[1] = function()
				doTweenX('engineerTweenX', 'engineer', -150, 0.01, 'linear');
				doTweenY('engineerTweenY', 'engineer', 480, 0.01, 'linear');
				objectPlayAnimation('engineer', 'engineerdie', true);
				runTimer('engiedeath', 0.810, 1);
			end,
			[2] = function()
				doTweenX('engineerTweenX', 'engineer', 910, 0.01, 'linear');
				doTweenY('engineerTweenY', 'engineer', 500, 0.01, 'linear');
				objectPlayAnimation('engineer', 'engineerdie', true);
				runTimer('engiedeath', 0.810, 1);
			end,
			[3] = function()
				doTweenX('engineerTweenX', 'engineer', 370, 0.01, 'linear');
				doTweenY('engineerTweenY', 'engineer', 170, 0.01, 'linear');
				objectPlayAnimation('engineer', 'engineerdie', true);
				runTimer('engiedeath', 0.810, 1);
			end,
		}
	end,
}

function onBeatHit()
	if curBeat >= 248 and difficulty == 1 then --248
		if curBeat % 5 == 0 then
			enemy = math.floor(math.random(1, 3));
			location = math.floor(math.random(1, 3));
			randomEnemyFuncs[enemy]();
			locationFuncs[location]();
		end
	end
	objectPlayAnimation('sanford', 'idle', true);
	objectPlayAnimation('deimos', 'idle', true);
end

bulletposY = {
	[0] = function() --left
		doTweenY('shotTweenY0', 'shot', 650, 0.01, 'linear');
	end,
	[1] = function() --down
		doTweenY('shotTweenY1', 'shot', 670, 0.01, 'linear');
	end,
	[2] = function() --up
		doTweenY('shotTweenY2', 'shot', 610, 0.01, 'linear');
	end,
	[3] = function() --right
		doTweenY('shotTweenY3', 'shot', 640, 0.01, 'linear');
	end,
}

function goodNoteHit(id, direction, noteType, isSustainNote, character, animId, forced) --making the shot from hank's gun sync position with it
	if noteType == 'Bullet_Note' then
		bulletposY[direction]() --executes functions in bulletposY at direction
		doTweenX('shotTweenX1', 'shot', -200, 0.01, 'linear');
		doTweenX('shotTweenX2', 'shot', 2000, 0.2, 'linear');
		if curBeat > 246 and difficulty == 2 then --if hellclown appears
			objectPlayAnimation('sanford', 'shoot', false);
			objectPlayAnimation('deimos', 'shoot', false);
		end
	end
	setProperty('health', getProperty('health') + 0.05)
end

function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
	if curStep >= 684 then
		cancelTimer('hpdrain');
		runTimer('leverexit', 1.4, 1);
		objectPlayAnimation('lever', 'exit', true);
	end
end

function onTweenCompleted(tag) --optimization among other stuff
	if tag == 'heliTweenX' then
		removeLuaSprite('heli'); --optimization
	end
	if tag == 'yeetTweenY' then
		removeLuaSprite('yeet'); --optimization
	end
	if tag == 'tikygoestoheaven' then --after tiky is completely off the speaker
		removeLuaSprite('speaker', false); --layering
		removeLuaSprite('stage', false);
		addLuaSprite('stage', false);
		addLuaSprite('speaker', false);
		doTweenY('tikyTweenY', 'tiky', 2000, 1.4, 'linear'); --tiky falls down
	end
	if tag == 'tikyTweenY' then
		removeLuaSprite('tiky'); --optimization
	end
	if tag == 'hotdogTweenX' then
		objectPlayAnimation('hotdog', 'idle', true); --after gf walks into the stage, she plays her idle
	end
	if tag == 'hellclownTweenY' then
		doTweenColor('bfColorTween', 'boyfriend', '0xFFE09999', 0.01, 'linear');--d87f7f
		doTweenColor('dadColorTween', 'dad', '0xFFE09999', 0.01, 'linear');
		doTweenColor('deimosColorTween', 'deimos', '0xFFE09999', 0.01, 'linear');
		doTweenColor('sanfordColorTween', 'sanford', '0xFFE09999', 0.01, 'linear');
		doTweenColor('stageColorTween', 'stage', '0xFFE09999', 0.01, 'linear');
		doTweenColor('speakerColorTween', 'speaker', '0xFFE09999', 0.01, 'linear');
		doTweenColor('hillColorTween', 'hill', '0xFFE09999', 0.01, 'linear');
		doTweenColor('foregroundColorTween', 'foreground', '0xFFE09999', 0.01, 'linear');
		doTweenColor('hotdogColorTween', 'hotdog', '0xFFE09999', 0.01, 'linear');
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'hpdrain' then
		setProperty('health', getProperty('health')-0.01); --the gremlin's health drain
	end
	if tag == 'idletimer' then
		objectPlayAnimation('righthand', 'idle', true); --tiky's hands don't do the animation at the same time
	end
	if tag == 'scream' and loopsLeft <= 1 then
		playSound('hellclown', 0.9); --helltiky arrives
	end
	if tag == 'leverenter' then
		objectPlayAnimation('lever', 'idle', true); --the gremlin fidgeting
	end
	if tag == 'entertimer' then
		objectPlayAnimation('deimos', 'idle', false); 
		objectPlayAnimation('sanford', 'idle', false); --after deimos and sanford entered, they play the idle animation
	end
	if tag == 'leverexit' and loopsLeft <= 1 then --after the gremlin played the exit anim, it disappears
		removeLuaSprite('lever');
	end
	if tag == 'laserenter' then
		objectPlayAnimation('laserdot', 'bop', true); --after the laser flickering has stopped, it starts bopping
	end
	if tag == 'gruntdeath' then
			objectPlayAnimation('deimos', 'shoot', false);
			objectPlayAnimation('sanford', 'shoot', false);
			playSound('hankded', 0.3);
			runTimer('gruntdied', 0.40, 1);
	end
	if tag == 'gruntdied' then
		doTweenY('deadgruntTweenY', 'grunt', 1000, 0.25);
	end
	if tag == 'agentdeath' then
		objectPlayAnimation('deimos', 'shoot', false);
		objectPlayAnimation('sanford', 'shoot', false);
		playSound('hankded', 0.3);
		runTimer('agentdied', 0.40, 1);
	end
	if tag == 'agentdied' then
		doTweenY('deadagentTweenY', 'agent', 1000, 0.25);
	end
	if tag == 'engiedeath' then
		objectPlayAnimation('deimos', 'shoot', false);
		objectPlayAnimation('sanford', 'shoot', false);
		playSound('hankded', 0.3);
		runTimer('engiedied', 0.40, 1);
	end
	if tag == 'engiedied' then
		doTweenY('deadengineerTweenY', 'engineer', 1000, 0.25);
	end
end