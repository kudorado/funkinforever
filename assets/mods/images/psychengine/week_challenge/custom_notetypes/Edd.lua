function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Edd' then --Check if the note on the chart is a Bullet Note
			--setPropertyFromGroup('unspawnNotes', i, 'texture', 'notetexture'); --Change notetexture
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); -- make it so original character doesn't sing these notes

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Edd' then

		local animToPlay = '';
		if noteData == 0 then
			animToPlay = 'singLEFT';
		elseif noteData == 1 then
			animToPlay = 'singDOWN';
		elseif noteData == 2 then
			animToPlay = 'singUP';
		elseif noteData == 3 then
			animToPlay = 'singRIGHT';
		end
		characterPlayAnim('dad', animToPlay, true);
		setProperty('dad.specialAnim', true);
	end
end