function onCreate()
	-- background shit
	makeLuaSprite('redtunnel', 'redtunnel', -600, -300);
	setScrollFactor('redtunnel', 0.9, 0.9);


	addLuaSprite('redtunnel', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end