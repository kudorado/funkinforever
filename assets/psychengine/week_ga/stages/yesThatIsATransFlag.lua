function onCreate()
	-- background shit
	makeLuaSprite('yesThatIsATransFlag', 'yesThatIsATransFlag', -480, -300);
	setScrollFactor('yesThatIsATransFlag', 0.9, 0.9);

	addLuaSprite('yesThatIsATransFlag', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end