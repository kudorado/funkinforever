function onCreate()
	-- background shit
	makeLuaSprite('Wheels', 'Wheels', -600, -300);
	setScrollFactor('Wheels', 0.9, 0.9);

	addLuaSprite('Wheels', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end