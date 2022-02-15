function onCreate()
	-- background shit
	makeLuaSprite('bg', 'white', -600, -100);
	addLuaSprite('bg', false);
	doTweenColor('hello', 'bg', 'FFFFFFFF', 0.5, 'quartIn');

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end