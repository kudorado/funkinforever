package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class KapiAngry extends Kapi
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('kapi/meow', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('kapi/closed', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, 550).loadGraphic(Paths.image('kapi/stagefront', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		playState.add(stageFront);
		
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Dad idle dance', 24);
		animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
		animation.addByPrefix('meow', 'Dad meow', 24);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 1, -8);
		dad.addOffset("singRIGHT", 0, -25);
		dad.addOffset("singLEFT", 0, 41);
		dad.addOffset("singDOWN", 0, -100);

		dad.dance();

	}
	
	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 31 | 135 | 204 | 284 | 363:
				dad.playAnimForce("meow", 0.75);

		}
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('kapi/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [22, 13], 0, false, false);
		icon.animation.play("dad");
	}
}