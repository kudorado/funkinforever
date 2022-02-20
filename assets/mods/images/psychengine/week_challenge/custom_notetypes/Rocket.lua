function onCreate()


	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
			--setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Rocket' then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Rocket'); --Miss has no penalties
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); -- make it so original character doesn't sing these notes
				if downscroll then
					setPropertyFromGroup('unspawnNotes', i, 'flipY', true);
					setPropertyFromGroup('unspawnNotes', i, 'offsetY', -250);
				end


			end
	end


end

function onUpdate( elapsed )
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
			--setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Rocket' then --Doesn't let Dad/Opponent notes get ignored
				
					setPropertyFromGroup('unspawnNotes', i, 'offsetX', -40);

				if downscroll then
					setPropertyFromGroup('unspawnNotes', i, 'offsetY', -250);
				end


			end
	end
end
function noteMiss(id, direction, noteType, isSustainNote)
	--if duet == false then
		if noteType == 'Rocket' then
			setProperty('health',-999)
		end
	--else
	--	triggerEvent('Camera Follow Pos',640,420)
	--	setProperty('defaultCamZoom', 1)
	--end
end
--gracias al bbpanzu por el script 
--PD: Gracias bebe panzon