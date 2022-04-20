function onCreate()
	-- background shit
	makeLuaSprite('heaven', 'heaven', -600, -300);
	setScrollFactor('heaven', 0.9, 0.9);

	addLuaSprite('heaven', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end