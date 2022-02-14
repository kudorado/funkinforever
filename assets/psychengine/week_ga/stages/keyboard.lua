function onCreate()
	-- background shit
	makeLuaSprite('keyboard', 'keyboard', -600, -300);
	setScrollFactor('keyboard', 0.9, 0.9);


	addLuaSprite('keyboard', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end