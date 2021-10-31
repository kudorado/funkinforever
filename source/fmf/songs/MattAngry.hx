	package fmf.songs;

import MenuCharacter.CharacterSetting;
import flixel.FlxSprite;
import fmf.characters.*;

class MattAngry extends Matt
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/mattangry/mattangry', "mods");
		dad.frames = tex;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-600, -100).loadGraphic(Paths.image('bg/matt/arenanightbg', "mods"));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = true;
		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, -425).loadGraphic(Paths.image('bg/matt/boxingnight3', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1));
		stageFront.updateHitbox();
		stageFront.scrollFactor.set(0.9, 0.9);

		stageFront.active = true;
		playState.add(stageFront);

	}


	override function createDadAnimationOffsets():Void
	{
		dad.addOffset("idle", 0, 0);

		dad.addOffset("singUP", -10, 5);
		dad.addOffset("singRIGHT", 48, -20);
		dad.addOffset("singLEFT", 31, -31);
		dad.addOffset("singDOWN", 29, -21);

		dad.dance();
	}

   
}