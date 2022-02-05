function onEvent(name, value1, value2)
	if name == "Image Flash" then
		makeLuaSprite('shit', value1, 0, 0);
		addLuaSprite('shit', true);
		doTweenColor('hello', 'shit', 'FFFFFFFF', 0.5, 'quartIn');
		setObjectCamera('shit', 'other');
		runTimer('wait', value2);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'shit', 0, 0.3, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('shit', true);
	end
end