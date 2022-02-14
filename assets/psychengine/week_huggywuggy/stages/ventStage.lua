function onCreate()

	makeAnimatedLuaSprite('wally','pared2',185,-500)
	addAnimationByPrefix('wally','right','wallyright',24,true)
	addLuaSprite('wally',false)

	makeAnimatedLuaSprite('floor','piso',-300,5)
	addAnimationByPrefix('floor','run','floorrun',24,true)
	addLuaSprite('floor',false)

	makeLuaSprite('TheSombara','sombara',-250,-600)
	addLuaSprite('TheSombara',false)
	setLuaSpriteScrollFactor('sombara', 0.8, 0.8)

	makeAnimatedLuaSprite('huggy','wuggy',90,-350)
	addAnimationByPrefix('huggy','runy','huggyruny',24,true)
	addAnimationByPrefix('huggy','hurty','huggyhurty',24,true)
	addLuaSprite('huggy',false)

	makeAnimatedLuaSprite('wall','pared1',-500,-570)
	addAnimationByPrefix('wall','run1','wallrun1',24,true)
	addLuaSprite('wall',true)

	makeAnimatedLuaSprite('person','bf',400,0)
	addAnimationByPrefix('person','run','personrun',24,true)
	addAnimationByPrefix('person','hurty','personhurty',24,true)
	addLuaSprite('person',false)

	makeLuaSprite('TheSombra2','sombra2',-500,-500)
	addLuaSprite('TheSombra2',true)
	setLuaSpriteScrollFactor('theSombra2', 0.8, 0.8)

	makeLuaSprite('TheShadow','shadow',-200,0)
	addLuaSprite('TheShadow',true)
	setLuaSpriteScrollFactor('shadow', 0.8, 0.8)

	makeLuaSprite('TheSombra','sombra',-500,-900)
	addLuaSprite('TheSombra',true)
	setLuaSpriteScrollFactor('theSombra', 0.8, 0.8)


end

function onBeatHit()--for every beat

end