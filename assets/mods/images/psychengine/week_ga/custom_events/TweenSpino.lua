function onEvent()
	setProperty('health', 1)
	end
	
	function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
		noteTweenAngle('A',4 , 600000 , 600, quintOut)
		noteTweenAngle('B',5 , 600000 , 600, quintOut)
		noteTweenAngle('C',6 , 600000 , 600, quintOut)
		noteTweenAngle('D',7 , 600000 , 600, quintOut)

		-- oppt notespin
		noteTweenAngle('E',0 , 600000 , 600, quintOut)
		noteTweenAngle('F',1 , 600000 , 600, quintOut)
		noteTweenAngle('G',2 , 600000 , 600, quintOut)
		noteTweenAngle('H',3 , 600000 , 600, quintOut)
	end
