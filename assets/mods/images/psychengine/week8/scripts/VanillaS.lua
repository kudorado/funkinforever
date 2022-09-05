function onCreatePost()
	setProperty('scoreTxt.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)

	makeLuaText('ThreePointOProto', 'BONUS WEEK TEST', '0.5', 1040, 700); -- trick official 3.0 build thing lol
	setObjectCamera('ThreePointOProto', 'other'); -- trick official 3.0 build thing lol
	setTextBorder('ThreePointOProto', '1.3', '000000')
	addLuaText('ThreePointOProto'); -- trick official 3.0 build thing lol
end


function onCountdownTick(count)
	if count == 0 then
		local texture = 'NOTEDAD'
        for i = 0, 3 do setPropertyFromGroup('opponentStrums', i, 'texture', texture) end
        for i = 0, getProperty('unspawnNotes.length') - 1 do
            if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'texture', texture)
            end
        end
	end
end

function onUpdatePost(elapsed)
	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.6)
	end
end


function onSongStart()
	setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
end

function onBeatHit()
	scaleObject('iconP1', 1.3, 1.3)
	doTweenX('iconauohsdohjas', 'iconP1.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas2', 'iconP1.scale', 1, crochet/1000, 'circOut')
	
	scaleObject('iconP2', 1.3, 1.3)
	doTweenX('iconauohsdohjas3', 'iconP2.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas4', 'iconP2.scale', 1, crochet/1000, 'circOut')
end
