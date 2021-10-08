package fmf.songs;

import flixel.tweens.FlxTween;
import flixel.effects.FlxFlicker;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class NonsenseTired extends Nonsense
{
	var whiteBG:FlxSprite; 
	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsensetired/nonsense_tired', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle Tired0', 24, false);
		animation.addByPrefix('singUP', 'Up tired0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right Tired0', 24, false);
		animation.addByPrefix('singLEFT', 'Left Tired0', 24, false);
		animation.addByPrefix('singDOWN', 'Down tired0', 24, false);
		
		dad.animation = animation;
	}

	override function createCharacters()
	{
		super.createCharacters();
		changeDad('common sense');

		whiteBG = new FlxSprite(-600, -200).makeGraphic(FlxG.width * 4, FlxG.height * 4, FlxColor.WHITE);
		playState.add(whiteBG);
		whiteBG.alpha = 0;
		
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle');
		dad.addOffset("singUP", 22, 11);
		dad.addOffset("singRIGHT", 9, -16);
		dad.addOffset("singLEFT", 25, -8);
		dad.addOffset("singDOWN", 0, -52);
	
		dad.dance();
	}


	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{

			case 60 | 124 | 204 | 235:
				playState.defaultCamZoom = 0.8;

			case 61 | 125 | 205 | 236:
				//shake
				whiteBG.alpha = 1;
				FlxTween.tween(whiteBG, {alpha: 0}, 0.25, {});
				playState.shakeBig();

			case 62 | 126 | 147 | 206 | 237:
				playState.defaultCamZoom = 0.6;

			case 144:
				playState.defaultCamZoom = 0.85;
				dad.playAnimForce("ohno", 1.166, function()
				{
					changeDad("highlights");
					dad.dance();
				});

		}
	}

}