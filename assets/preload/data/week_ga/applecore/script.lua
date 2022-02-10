function onCreate()
	screenWidthV = getPropertyFromClass('FlxG', 'width')
	makeLuaSprite('poop', 'poop', -1900, -900); -- the phase 2 bg
	setLuaSpriteScrollFactor('poop', 0, 0);
	scaleObject('poop', 2, 2)

	makeLuaSprite('poop2', 'poop2', -1800, -900);
	setLuaSpriteScrollFactor('poop2', 0, 0);
	scaleObject('poop2', 2, 2)

	makeLuaSprite('yeah', 'yeah', -1500, -900); -- the phase 3
	setLuaSpriteScrollFactor('yeah', 0, 0);
	scaleObject('yeah', 2, 2)

	makeLuaSprite('yeah2', 'yeah2', -1800, -900);
	setLuaSpriteScrollFactor('yeah2', 0, 0);
	scaleObject('yeah2', 2, 2)

	makeLuaSprite('sandu', 'sandu', 100, 0);
	setLuaSpriteScrollFactor('sandu', 1, 1);
	scaleObject('sandu', 1, 1)

	makeAnimatedLuaSprite('bambi_pissyboy', 'bambi_pissyboy', -800, -100)
	addAnimationByPrefix('bambi_pissyboy', 'bambi_pissyboy', 'DaveAngry idle dance', 24, true)
	scaleObject('bambi_pissyboy', 1.1, 1.1)
	setLuaSpriteScrollFactor('bambi_pissyboy', 1, 1);

	makeLuaSprite('monkey_guy', 'monkey_guy', 100, 0);
	setLuaSpriteScrollFactor('monkey_guy', 1, 1);
	scaleObject('monkey_guy', 1, 1)

	makeLuaSprite('monkey_person', 'monkey_person', -800, 100);
	setLuaSpriteScrollFactor('monkey_person', 1, 1);
	scaleObject('monkey_person', 1, 1)

	makeAnimatedLuaSprite('flash', 'flash', -1500, -900)
	addAnimationByPrefix('flash', 'flash', 'flash', 10, false)
	scaleObject('flash', 4, 4)
	setScrollFactor('flash', 0, 0)
	makeAnimatedLuaSprite('ohdarkness', 'ohdarkness', -1500, -900)
	addAnimationByPrefix('ohdarkness', 'ohdarkness', 'ohdarkness', 10, false)
	scaleObject('ohdarkness', 4, 4)
	setScrollFactor('ohdarkness', 0, 0)
end

function opponentNoteHit()
if noteType ~= 'No Animation' then
	health = getProperty('health')
	if curStep > 894 and curStep < 1780 then
			triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			setProperty('health', health- 0.015);
	else if curStep > 1780 and curStep < 1912 then
			triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			setProperty('health', health- 0.005);
	else if curStep > 2544 then
			triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
			setProperty('health', health- 0.003);
	end
	end
	end
	end
end

function onSongStart()
	realPlayer1 = getProperty('defaultPlayerStrumX0')
	realPlayer2 = getProperty('defaultPlayerStrumX1')
	realPlayer3 = getProperty('defaultPlayerStrumX2')
	realPlayer4 = getProperty('defaultPlayerStrumX3')
	realOppo1 = getProperty('defaultOpponentStrumX0')
	realOppo2 = getProperty('defaultOpponentStrumX1')
	realOppo3 = getProperty('defaultOpponentStrumX2')
	realOppo4 = getProperty('defaultOpponentStrumX3')
	realPlayerY1 = getProperty('defaultPlayerStrumY0')
	realPlayerY2 = getProperty('defaultPlayerStrumY1')
	realPlayerY3 = getProperty('defaultPlayerStrumY2')
	realPlayerY4 = getProperty('defaultPlayerStrumY3')
	realOppoY1 = getProperty('defaultOpponentStrumY0')
	realOppoY2 = getProperty('defaultOpponentStrumY1')
	realOppoY3 = getProperty('defaultOpponentStrumY2')
	realOppoY4 = getProperty('defaultOpponentStrumY3')
end


function onStepHit()
	if curStep == 894 then --894 for the curStep (this is a note)
		addLuaSprite('poop2', false)
		addLuaSprite('poop', false)
		addLuaSprite('flash', true)

	else if curStep == 2544 then
		addLuaSprite('yeah', false)
		addLuaSprite('yeah2', false)
		addLuaSprite('bambi_pissyboy', true)
		addLuaSprite('ohdarkness', true)
		setProperty('health', 2);

	else if curStep == 2634 then
		doTweenX('dadScaleTweeenX', 'dad.scale', 0.001, 0.00001, 'linear')
		doTweenY('dadScaleTweeenY', 'dad.scale', 0.001, 0.00001, 'linear')
		doTweenX('dadScaleTweenX', 'dad.scale', 5, 3, 'quartInOut')
		doTweenY('dadScaleTweenY', 'dad.scale', 5, 3, 'quartInOut')
		addLuaSprite('sandu', true)

	else if curStep == 2695 then
		playSound('suck', 1, 'sucked')
		removeLuaSprite('sandu', false)
		removeLuaSprite('bambi_pissyboy', false)
		addLuaSprite('monkey_person', true)
		doTweenX('monkey_personscalex', 'monkey_person.scale', 0, 1.2, 'quartIn')
		doTweenY('monkey_personscaley', 'monkey_person.scale', 0, 1.2, 'quartIn')
		doTweenX('monkey_personx', 'monkey_person', 0, 1.2, 'quartIn')
		doTweenY('monkey_persony', 'monkey_person', 0, 1.2, 'quartIn')
		addLuaSprite('monkey_guy', true)
		doTweenX('monkey_guyscalex', 'monkey_guy.scale', 0, 1.2, 'quartIn')
		doTweenY('monkey_guyscaley', 'monkey_guy.scale', 0, 1.2, 'quartIn') 
		doTweenX('monkey_guyx', 'monkey_guy', 0, 1.2, 'quartIn')
		doTweenY('monkey_guyy', 'monkey_guy', 0, 1.2, 'quartIn')
	else if curStep == 2713 then
		stopSound('sucked')
		playSound('suckEnd', 1, 'suckedEnd')
	end
	end
	end
	end
	end
end

function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/1000)
doTweenX('poopscale', 'poop.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
doTweenY('poopscaley', 'poop.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
doTweenX('yeah2', 'yeah2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
doTweenY('yeah2y', 'yeah2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
doTweenX('hi2', 'hi2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)
doTweenY('hi2y', 'hi2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)
doTweenX('opponentmove2', 'sandu', 600 - 3300*math.sin((currentBeat+12*12)*math.pi), 2)
	if curStep < 895 then
		doTweenX('opponentmove', 'dad', 600 - 3300*math.sin((currentBeat+12*12)*math.pi), 2)
	else if curStep > 896 and curStep < 2543 then
		doTweenX('opponentmove3', 'dad', 600 - 3300*math.sin((currentBeat+12*12)*math.pi), 2)
		noteTweenY('player1', 4, defaultPlayerStrumY3 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player2', 5, defaultPlayerStrumY1 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player3', 6, defaultPlayerStrumY0 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player4', 7, defaultPlayerStrumY2 +	300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent1', 0, defaultOpponentStrumY3 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent2', 1, defaultOpponentStrumY1 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent3', 2, defaultOpponentStrumY0 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent4', 3, defaultOpponentStrumY2 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx1', 4, defaultPlayerStrumX0 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx2', 5, defaultPlayerStrumX1 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx3', 6, defaultPlayerStrumX2 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx4', 7, defaultPlayerStrumX3 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx1', 0, defaultOpponentStrumX0 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx2', 1, defaultOpponentStrumX1 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx3', 2, defaultOpponentStrumX2 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx4', 3, defaultOpponentStrumX3 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
	else if curStep > 2543 and curStep < 2633 then
		doTweenX('opponentmove3', 'dad', 600 - 3300*math.sin((currentBeat+12*12)*math.pi), 2)
		noteTweenX('unfairplayer1', 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
		noteTweenX('unfairplayer2', 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
		noteTweenX('unfairplayer3', 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
		noteTweenX('unfairplayer4', 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
		noteTweenY('unfairplayery1', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.001)
		noteTweenY('unfairplayery2', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.001)
		noteTweenY('unfairplayery3', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.001)
		noteTweenY('unfairplayery4', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.001)
		noteTweenX('unfairoppo1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (4) * 2) * 300), 0.001)
		noteTweenX('unfairoppo2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (5) * 2) * 300), 0.001)
		noteTweenX('unfairoppo3', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (6) * 2) * 300), 0.001)
		noteTweenX('unfairoppo4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (7) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy1', 0, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (4) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy2', 1, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (5) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy3', 2, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (6) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy4', 3, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (7) * 2) * 300), 0.001)
	else if curStep > 2543 then
		noteTweenX('unfairplayer1', 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
		noteTweenX('unfairplayer2', 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
		noteTweenX('unfairplayer3', 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
		noteTweenX('unfairplayer4', 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
		noteTweenY('unfairplayery1', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.001)
		noteTweenY('unfairplayery2', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.001)
		noteTweenY('unfairplayery3', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.001)
		noteTweenY('unfairplayery4', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.001)
		noteTweenX('unfairoppo1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (4) * 2) * 300), 0.001)
		noteTweenX('unfairoppo2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (5) * 2) * 300), 0.001)
		noteTweenX('unfairoppo3', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (6) * 2) * 300), 0.001)
		noteTweenX('unfairoppo4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (7) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy1', 0, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (4) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy2', 1, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (5) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy3', 2, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (6) * 2) * 300), 0.001)
		noteTweenY('unfairoppoy4', 3, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (7) * 2) * 300), 0.001)
	end
	end
	end
	end
end
