function onCreate()
	-- background shit
	makeLuaSprite('algebraBg', 'algebraBg', -600, -300);
	setScrollFactor('algebraBg', 0.9, 0.9);

	addLuaSprite('algebraBg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end