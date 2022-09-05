function onCreate()
	
	makeLuaSprite('Dbackground', 'Dbackground', -354, -300);
	setProperty("Dbackground.scale.x", 1.15);
	setProperty("Dbackground.scale.y", 1.15);
	setScrollFactor('Dbackground', 1.1, 1.1);

-- Your Custom bg sprites or something like this


end

function opponentNoteHit(id, direction, noteType, isSustainNote)
		doTweenColor('Dbackgroundfadein', 'Dbackground', 'ff96d63', 0.25, 'quartIn');
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	doTweenColor('Dbackgroundfadeout', 'Dbackground', 'ffffffff', 0.25, 'quartIn');
end


function onStartCountdown()
	addLuaSprite('Dbackground', false)
	runTimer('wait', 2.25);

end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		-- doTweenColor('hello', 'Dbackground', 'ff96d63', 0.5, 'quartIn');
	end
end




