package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Parish extends SongPlayer	
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sarv/sarv', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		playState.defaultCamZoom = 0.75;

		var bg:FlxSprite = new FlxSprite(-200, -700).loadGraphic(Paths.image('bg/sacredmass/church1/base', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.3;
		bg.scale.x = 1.3;
		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'BF idle dance00', 18, false);
		animation.addByPrefix('singUP', 'BF NOTE UP00', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT00', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT00', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN00', 24, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -2);
		dad.addOffset("singUP", -15, 4);
		dad.addOffset("singRIGHT", -6, -1);
		dad.addOffset("singLEFT", -16, -3);
		dad.addOffset("singDOWN", -14, -8);
		dad.dance();

		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 350;
		dad.y += 0;
		
		dad.flipX = true;
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.y += 120;
		bf.x += 300;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [30, 31], 0, false, false);
		icon.animation.play("dad");
	}

}