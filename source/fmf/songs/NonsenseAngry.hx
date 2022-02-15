package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.tweens.FlxTween;
import flixel.effects.FlxFlicker;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class NonsenseAngry extends Nonsense
{
	var whiteBG:FlxSprite; 


	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/nonsense/nonsense_angry', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle pissed0', 24, false);
		animation.addByPrefix('singUP', 'Up Pissed0', 24, false);
		animation.addByPrefix('singRIGHT', 'Right Pissed0', 24, false);
		animation.addByPrefix('singLEFT', 'Pissed left0', 24, false);
		animation.addByPrefix('singDOWN', 'Pissed Down0', 24, false);
		animation.addByPrefix('takethat', 'Pissed mid-song0', 12, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle');
		dad.addOffset("singUP", 8, 14);
		dad.addOffset("singRIGHT", 18, -13);
		dad.addOffset("singLEFT", -6, -5);
		dad.addOffset("singDOWN", 8, -49);

		dad.dance();
	}


	override function createCharacters()
	{
		super.createCharacters();
		whiteBG = new FlxSprite(-600, -200).makeGraphic(FlxG.width * 4, FlxG.height * 4, FlxColor.WHITE);
		gameState.add(whiteBG);
		whiteBG.alpha = 0;
		
	}

	override function midSongEventUpdate(curBeat:Int)
	{
		switch (curBeat)
		{
			case 60 | 124 | 156 | 235:
				gameState.defaultCamZoom = 0.8;

			case 61 | 125 | 157 | 236:
				//shake
				// gameState.defaultCamZoom = 0.8;
				whiteBG.alpha = 1;
				FlxTween.tween(whiteBG, {alpha: 0}, 0.25, {});
				gameState.shakeBig();

			case 62 | 126 | 158| 206 | 237:
				gameState.defaultCamZoom = 0.6;

			case 152:
				gameState.defaultCamZoom = 0.85;
				dad.playAnimForce("takethat", 1.166, function()
				{
					changeDad("nonsensemad");
					dad.dance();
				});

		}		
	}

}