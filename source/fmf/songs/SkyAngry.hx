package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class SkyAngry extends SkyTired
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/skyangry/sky_angry', 'mods');
		dad.frames = tex;
	}

	
	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		
		animation.addByPrefix('idle', 'Sky annoyed alt idle', 24, false);

		animation.addByPrefix('singUP', 'Sky annoyed alt up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sky annoyed alt right0', 24, false);
		animation.addByPrefix('singDOWN', 'Sky annoyed alt down0', 24, false);
		animation.addByPrefix('singLEFT', 'Sky annoyed alt left0', 24, false);
		
		animation.addByPrefix('singUP-alt', 'Sky annoyed alt up0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Sky annoyed alt right0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Sky annoyed alt down0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Sky annoyed alt left0', 24, false);


		animation.addByPrefix('grr', 'Sky annoyed grr0', 24, false);
		animation.addByPrefix('huh', 'Sky annoyed huh0', 12, false);
		animation.addByPrefix('ugh', 'Sky annoyed ugh0', 12, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{

		dad.addOffset('idle');
		dad.addOffset("singUP", 0, 0);
		dad.addOffset("singRIGHT", 0, 0);
		dad.addOffset("singLEFT", 0, 0);
		dad.addOffset("singDOWN", 0, 0);

		dad.dance();
	}


}