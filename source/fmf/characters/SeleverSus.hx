package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SeleverSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/selever/selever_sheet', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'SelIdle0', 24, false);

		animation.addByPrefix('singUP', 'SelUp0', 24, false);
		animation.addByPrefix('singDOWN', 'SelDown0', 24, false);
		animation.addByPrefix('singLEFT', 'SelLeft0', 24, false);
		animation.addByPrefix('singRIGHT', 'SelRight0', 24, false);
		
		animation.addByPrefix('singUPmiss', 'SelUp MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'SelDown MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'SelLeft MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'SelRight MISS0', 1, false);
		
		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 60);

		addOffset("singUP", 55, 121);
		addOffset("singRIGHT", 151, 82);
		addOffset("singLEFT", 171, 59);
		addOffset("singDOWN", 114, 7);

		addOffset("singUPmiss", 54, 122);
		addOffset("singRIGHTmiss", 156, 88);
		addOffset("singLEFTmiss", 171, 59);
		addOffset("singDOWNmiss", 120, 9);
	
		flipX = true;
	}
	

}
