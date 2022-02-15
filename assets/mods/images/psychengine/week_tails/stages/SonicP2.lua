function onCreate()
	-- background shit
	makeLuaSprite('sky', 'SonicP2/sky', -650, -100);
	setScrollFactor('sky', 0.9, 0.9);
	
	makeLuaSprite('backtrees', 'SonicP2/backtrees', -650, -100);
	setScrollFactor('backtrees', 0.9, 0.9);
	scaleObject('backtrees', 1.1, 1.1);

	makeLuaSprite('trees', 'SonicP2/trees', -650, -100);
	setScrollFactor('trees', 0.9, 0.9);
	scaleObject('trees', 1.1, 1.1);

	 makeLuaSprite('ground', 'SonicP2/ground', -650, -100);
	setScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 1.1, 1.1);

	addLuaSprite('sky', false);
	addLuaSprite('backtrees', false);
	addLuaSprite('trees', false);
	addLuaSprite('ground', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end