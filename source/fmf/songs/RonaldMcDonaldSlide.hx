package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class RonaldMcDonaldSlide extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bab/ronald/kill_yourself', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.8;

		var bg1:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/sunset/happy/bosip_sky', 'mods'));
		bg1.antialiasing = true;
		bg1.scale.y = 0.5;
		bg1.scale.x = 0.5;
		//bg1.scrollFactor.set(0.9,0.9);
		
		playState.add(bg1);

		var bg2:FlxSprite = new FlxSprite(-1200, -500).loadGraphic(Paths.image('bg/bab/sunset/happy/bosip_back', 'mods'));
		bg2.antialiasing = true;
		bg2.scale.y = 0.5;
		bg2.scale.x = 0.5;
		//bg2.scrollFactor.set(0.9,0.9);
		playState.add(bg2);

		var bg:FlxSprite = new FlxSprite(-560, -140).loadGraphic(Paths.image('bg/bab/sunset/happy/bosip_front', 'mods'));
		bg.antialiasing = true;
		//bg.scrollFactor.set(0.9,0.9);
		bg.scale.y = 0.75;
		bg.scale.x = 0.75;
		playState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'RON_IDLE00', 24, false);
		animation.addByPrefix('singUP', 'RON_UP00', 24, false);
		animation.addByPrefix('singDOWN', 'RON_DOWN00', 24, false);
		animation.addByPrefix('singLEFT', 'RON_LEFT00', 24, false);
		animation.addByPrefix('singRIGHT', 'RON_RIGHT00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, 11);
		dad.addOffset("singUP", -15, -28);
		dad.addOffset("singRIGHT", -6, -23);
		dad.addOffset("singLEFT", -16, 225);
		dad.addOffset("singDOWN", -14, -164);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
        dad.y += 80;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y += 50;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 100;
		bf.x += 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bab/ronsip', 'mods'), true, 150, 150);
		icon.animation.add('dad', [2, 1], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowBF()
	{
		playState.camFollow.x =  dad.getMidpoint().x + 300;
		playState.camFollow.y =  dad.getMidpoint().y;

	}

	override function updateCamFollowDad()
	{
		playState.camFollow.x =  dad.getMidpoint().x + 50;
		playState.camFollow.y =  dad.getMidpoint().y;

	}

}