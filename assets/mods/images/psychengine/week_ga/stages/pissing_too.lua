function onCreate()
	-- background shit
	makeLuaSprite('pissing_too', 'pissing_too', -600, -300);
	setScrollFactor('disabled', 0.9, 0.9);


	addLuaSprite('pissing_too', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end