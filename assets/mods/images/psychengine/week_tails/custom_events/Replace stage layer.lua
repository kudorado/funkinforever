function onEvent(name, value1, value2)
	if name == 'Replace stage layer' then

        removeLuaSpriteGroup('happy', true);
		loadLuaFile('sad.lua', 'stages');
		
	end
end 