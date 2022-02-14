function onCreate()
	-- background shit
	makeLuaSprite('metal', 'metal', -600, -300);
	setScrollFactor('metal', 0.9, 0.9);


	addLuaSprite('metal', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end