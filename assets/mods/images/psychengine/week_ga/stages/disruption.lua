function onCreate()
	-- background shit
	makeLuaSprite('disruptor', 'disruptor', -400, -200);
	setLuaSpriteScrollFactor('disruptor', 0, 0);
	scaleObject('disruptor', 1, 1)
	addLuaSprite('disruptor', false);

	makeLuaSprite('disruptor2', 'disruptor2', -900, -1000);
	setLuaSpriteScrollFactor('disruptor2', 0, 0);
	scaleObject('disruptor2', 2, 2)
	addLuaSprite('disruptor2', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end