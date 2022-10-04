
local followchars = true
local modchart = true
local xx = 960
local yy = 660
local xx2 = 960
local yy2 = 660
local ofs = 30
local del = 0
local del2 = 0
local bgs = {'fleet', 'sonic'}

function onCreate()
	makeAnimatedLuaSprite('fx', 'bg/vintage', -222, 0)
	addAnimationByPrefix('fx', 'idle', 'idle', 16, true)
	scaleObject('fx', 3, 3)
	setObjectCamera('fx', 'camHud')
	objectPlayAnimation('fx', 'idle', true)
	setProperty('fx.alpha', 0)

	for i = 1,2 do
		makeLuaSprite(bgs[i], 'bg/'..bgs[i], -122, 0)
		addLuaSprite(bgs[i], false)
	end
	addCharacterToList('fleetway', 'boyfriend')
	precacheSound('stat')

	setPropertyFromClass('GameOverSubstate', 'characterName', 'sonic')
end

function onSongStart()
	addLuaSprite('fx', true)
end

function onUpdate(elapsed)

end

function onStartCountdown()
	setProperty('gf.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)

	return Function_Continue
end

function onStepHit()
	if curStep == 10 then
		modchart = false
	end
	if curStep == 384 or curStep == 768 or curStep == 1151 or curStep == 1172 or curStep == 1276 or curStep == 1282 or curStep == 1304 or curStep == 1536 or curStep == 1922 or curStep == 1937 or curStep == 1943 or curStep == 1956 then
		fleetON()
	end
	if curStep == 640 or curStep == 1024 or curStep == 1154 or curStep == 1176 or curStep == 1279 or curStep == 1300 or curStep == 1408 or curStep == 1792 or curStep == 1926 or curStep == 1940 or curStep == 1946 or curStep == 1960 then
		fleetOFF()
	end
end

function fleetON()
	setProperty('fx.alpha', 0.8)
	setProperty('sonic.alpha', 0)
	doTweenAlpha('fleetON', 'fx', 0, 1, 'linear')
	playSound('stat', 0.3)
	triggerEvent('Change Character', 0, 'fleetway')
end

function fleetOFF()
	setProperty('fx.alpha', 0.8)
	setProperty('sonic.alpha', 1)
	doTweenAlpha('fleetON', 'fx', 0, 1, 'linear')
	playSound('stat', 0.3)
	triggerEvent('Change Character', 0, 'sonic')
end

function onGameOver()
	modchart = false
	return Function_Continue;
end