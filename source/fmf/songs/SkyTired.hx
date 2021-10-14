package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SkyTired extends Sky
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/skytired/sky_tired', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;

		var hallowTex = Paths.getSparrowAtlas('bg/sky/bg_annoyed', 'mods');
		var bg = new FlxSprite(-200, -300);

		bg.frames = hallowTex;
		bg.animation.addByPrefix('idle', 'Bg20', 12, true);
		bg.animation.play('idle');
		bg.antialiasing = true;

		bg.scale.x = 2;
		bg.scale.y = 2;

		playState.add(bg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Sky annoyed idle', 24, false);
		
		animation.addByPrefix('singUP', 'Sky annoyed up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky annoyed right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky annoyed down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky annoyed left0', 24, false);
		animation.addByPrefix('oh', 'Sky annoyed oh0', 12, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.ad dOffset("singDOWN", 0, 0);

		dad.dance();
		dad.flipX = true;
	
	}

	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{

			case 29 | 61:
				dad.playAnim('oh', true);
				dad.lockAnim(0.5, function()
				{
					dad.dance();
				});

				

			case 125:

				changeDad("sky-angry");
				dad.playAnim('grr', true);

				dad.lockAnim(1, function()
				{
					dad.dance();
				});
				dad.y += 25;

				
			case 190 | 253 | 270:
				dad.playAnim('huh', true);
				dad.lockAnim(0.5, function()
				{
					dad.dance();
				});

			case 286:
				dad.playAnim('ugh', true);
				dad.lockAnim(1, function()
				{
					dad.dance();
				});

		}
	}

}