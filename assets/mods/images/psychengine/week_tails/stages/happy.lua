function onCreate()
	-- background shit
	makeLuaSprite('sky', 'happy/SKY', -600, -100);
	setScrollFactor('sky', 0.9, 0.9);
	
	makeLuaSprite('floor1', 'happy/FLOOR2', -650, 0);
	setScrollFactor('floor1', 0.9, 0.9);
	scaleObject('floor1', 1.1, 1.1);

	makeLuaSprite('floor2', 'happy/FLOOR1', -650, 0);
	setScrollFactor('floor2', 0.9, 0.9);
	scaleObject('floor2', 1.1, 1.1);

	makeLuaSprite('grass', 'happy/frontgrass', -650, 0);
	setScrollFactor('grass', 0.9, 0.9);
	scaleObject('grass', 1.1, 1.1);

	addLuaSprite('sky', false, 'happy');
	addLuaSprite('floor1', false, 'happy');
	addLuaSprite('floor2', false, 'happy');
	addLuaSprite('grass', false, 'happy');

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end