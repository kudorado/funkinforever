function onCreate()
	-- background shit
	makeLuaSprite('disabled', 'disabled', -600, -300);
	setScrollFactor('disabled', 0.9, 0.9);


	addLuaSprite('disabled', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end