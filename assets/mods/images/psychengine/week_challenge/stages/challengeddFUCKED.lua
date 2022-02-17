function onCreate()
	-- background shit
		makeLuaSprite('bgtord', 'bgtord', 900, -190);
		scaleObject('bgtord', 1.75, 1.75)
	addLuaSprite('bgtord', false);	

	makeLuaSprite('cieloFUCKED', 'cieloFUCKED', -600, -950);
	addLuaSprite('cieloFUCKED', false);	

		makeAnimatedLuaSprite('tordbot', 'tordbot', 1670, 200);
		setProperty('tordbot.flipX', false);
		addAnimationByPrefix('tordbot', 'enter', 'TordBot Enter', 14, true);
		addAnimationByPrefix('tordbot', 'boom', 'TordBot Boom', 14, false);
			setProperty('tordbot.scale.x', getProperty('tordbot.scale.x') + 0.56);
			setProperty('tordbot.scale.y', getProperty('tordbot.scale.y') + 0.56);
			setLuaSpriteScrollFactor('tordbot', 1, 1);
				addLuaSprite('tordbot', false);

	makeLuaSprite('patioFUCKED', 'patioFUCKED', -600, -770);
	addLuaSprite('patioFUCKED', false);

	makeLuaSprite('vallas', 'vallas', 85, -120);
	addLuaSprite('vallas', true);

		makeAnimatedLuaSprite('matt', 'matt', 1950, 200);
		setProperty('matt.flipX', false);
		addAnimationByPrefix('matt', 'enter', 'MattWalking', 14, true);
		addAnimationByPrefix('matt', 'shit', 'MattReactionTord', 14, false);
		addAnimationByPrefix('matt', 'idle', 'MattSnappingFinger', 24, true);
		addAnimationByPrefix('matt', 'pissed', 'MattPISSED', 24, true);
			setProperty('matt.scale.x', getProperty('matt.scale.x') + 0.56);
			setProperty('matt.scale.y', getProperty('matt.scale.y') + 0.56);
			setLuaSpriteScrollFactor('matt', 1, 1);
				addLuaSprite('matt', false);


	makeLuaSprite('carro', 'carro', -835, 800);
	addLuaSprite('carro', true);


end


function onEvent(name,value1,value2)
	if name == 'Play Animation' then 

		if value1 == 'mattw' then
		addLuaSprite('matt', true);
		objectPlayAnimation('matt', 'enter', true); 
		doTweenX('mattTweenX', 'matt', 1200, 8, 'linear'); 
	end	

		if value1 == 'runin' then
		addLuaSprite('TomRun', false);
		objectPlayAnimation('TomRun', 'enter', true); 
		doTweenX('TomRunTweenX', 'TomRun', 2900, 3, 'linear'); 
	end	
	   	if value1 == 'matti' then	
		    objectPlayAnimation('matt', 'idle', true); 

    end
			if value1 == 'matts' then
		addLuaSprite('matt', false);
		objectPlayAnimation('matt', 'shit', true); 
		doTweenX('mattTweenX', 'matt', 1300, 0.1, 'linear'); 
		makeAnimatedLuaSprite('TomRun', 'TomRun', 2550, 500);
		setProperty('TomRun.flipX', false);
		addAnimationByPrefix('TomRun', 'enter', 'Tom Running In', 15, false);
			setProperty('TomRun.scale.x', getProperty('TomRun.scale.x') + 0.56);
			setProperty('TomRun.scale.y', getProperty('TomRun.scale.y') + 0.56);
			setLuaSpriteScrollFactor('TomRun', 1, 1);
				addLuaSprite('TomRun', true);
	end	

				if value1 == 'arpon' then 
		makeAnimatedLuaSprite('ToomArpon', 'ToomArpon', 2550, 500);
		setProperty('ToomArpon.flipX', false);
		addAnimationByPrefix('ToomArpon', 'enter', 'ToomArpon', 8, true);
			setProperty('ToomArpon.scale.x', getProperty('ToomArpon.scale.x') + 0.56);
			setProperty('ToomArpon.scale.y', getProperty('ToomArpon.scale.y') + 0.56);
			setLuaSpriteScrollFactor('ToomArpon', 1, 1);
				addLuaSprite('ToomArpon', true);
	end	

			if value1 == 'tordbot' then
		addLuaSprite('tordbot', false);
		objectPlayAnimation('tordbot', 'enter', true); 
		doTweenY('tordbotTweenY', 'tordbot', -500, 3, 'linear'); 
	end	

				if value1 == 'boom' then
		addLuaSprite('tordbot', false);
		objectPlayAnimation('tordbot', 'boom', false); 
	end	

			if value1 == 'tord' then

			setProperty('bgtord.visible', true);
			setProperty('cieloFUCKED.visible', false);
			setProperty('tordbot.visible', false);
			setProperty('patioFUCKED.visible', false);
			setProperty('carro.visible', false);
			setProperty('matt.visible', false);
			setProperty('vallas.visible', false);
			setProperty('TomRun.visible', false);
	end	
 

		if value1 == 'normal' then

			setProperty('bgtord.visible', false);
			setProperty('cieloFUCKED.visible', true);
			setProperty('tordbot.visible', true);
			setProperty('patioFUCKED.visible', true);
			setProperty('carro.visible', true);
			setProperty('matt.visible', false);
			setProperty('vallas.visible', true);
			setProperty('TomRun.visible', false);										
										
		end
	end
end

