function onCreate()
	-- background shit
	makeLuaSprite('thunda', 'thunda', -600, -300);
	setScrollFactor('thunda', 0.9, 0.9);

	addLuaSprite('thunda', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end