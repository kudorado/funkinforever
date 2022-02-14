function onCreate()
	-- background shit
	makeLuaSprite('bg_sart', 'bg_sart', -790, -300);
	setScrollFactor('bg_sart', 0.9, 0.9);

	addLuaSprite('bg_sart', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end