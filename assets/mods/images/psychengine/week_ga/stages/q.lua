function onCreate()
	-- background shit
	makeLuaSprite('q', 'q', -600, -300);
	setScrollFactor('q', 0.9, 0.9);

	addLuaSprite('q', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end