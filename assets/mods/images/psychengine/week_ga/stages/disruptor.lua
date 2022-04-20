function onCreate()
	-- background shit
	makeLuaSprite('disruptor', 'disruptor', -600, -300);
	setScrollFactor('disruptor', 0.9, 0.9);

	addLuaSprite('disruptor', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end