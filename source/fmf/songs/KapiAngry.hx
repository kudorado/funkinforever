package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class KapiAngry extends Kapi
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/kapiangry/kapi_angry', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('bg/kapi/closed', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		gamePlayState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-400, 550).loadGraphic(Paths.image('bg/kapi/stagefront', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		gamePlayState.add(stageFront);
		
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Dad idle dance', 24);
		animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24);
		animation.addByPrefix('meow', 'Dad meow0', 24);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, -0);
		dad.addOffset("singRIGHT", 0, -0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, -0);

		dad.dance();
	


	}

	override function createDad()
	{
		super.createDad();
		dad.scale.x = 1.2;
		dad.scale.y = 1.2;

		dad.y -= 165;

	}
	
	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 31 | 135 | 204 | 284 | 363:
				dad.playAnimForce("meow", 0.75);

		}
	}
	
}