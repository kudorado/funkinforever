function onCreate()
	-- background shit
	makeAnimatedLuaSprite('static','SonicP3/staticBACKGROUND2',-700,-400)addAnimationByPrefix('static','dance','menuSTATICNEW instance ',24,true)
   objectPlayAnimation('static','dance',false)
   setScrollFactor('static', 0.9, 0.9);
   scaleObject('static', 1.8, 1.8);

	 makeLuaSprite('ground', 'SonicP2/ground', -650, -100);
	setScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 1.1, 1.1);

	makeAnimatedLuaSprite('gf-dark','characters/GF_dark',150,150)addAnimationByPrefix('gf-dark','dance','GF Dancing Beat',24,true)
   objectPlayAnimation('gf-dark','dance',false)
   setScrollFactor('gf-dark', 0.9, 0.9);

	addLuaSprite('static', false);
	addLuaSprite('ground', false);
	addLuaSprite('gf-dark', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end