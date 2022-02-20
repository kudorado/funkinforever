function onCreatePost()
if not lowQuality then
makeLuaSprite('heaven', 'heaven',-600, -300) 
addLuaSprite('heaven')
 addGlitchEffect('heaven',2,2)
end end

function onUpdate(elapsed)
  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY(dadTweenY, 'dad', 50-80*math.sin((currentBeat*0.25)*math.pi),0.001)
    
  end

end

function onCreate()
	if dadName == 'origin' then
		makeAnimatedLuaSprite('animatedicon', 'icons/icon-origin', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'bandu-origin', 24, false)
		addAnimationByPrefix('animatedicon', 'losing', 'bandu-origin', 24, false)
		--addAnimationByPrefix('animatedicon', 'winning', 'winning animation here', 24, true) in case you want a winning animation
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'other') -- either is under the health bar or nothing
		addLuaSprite('animatedicon', false)
		objectPlayAnimation('animatedicon', 'normal', false)
	end
end

function onUpdate(elapsed)
	if dadName == 'origin' then
		setProperty('iconP2.alpha', 0)
		if getProperty('health') > 1.6 then
			objectPlayAnimation('animatedicon', 'losing', false)
		elseif getProperty('health') < 0.4 then
			objectPlayAnimation('animatedicon', 'winning', false)
		else
			objectPlayAnimation('animatedicon', 'normal', false)
		end
	end
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP2.x'))
	setProperty('animatedicon.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon.y', getProperty('iconP2.y') + 15)
	setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
	setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))
end