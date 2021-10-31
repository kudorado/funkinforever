package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class KapiSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/kapi/kapi', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Kapi idle dance', 24, false);
		animation.addByPrefix('singUP', 'Kapi Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Kapi Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'Kapi Sing Note DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'Kapi Sing Note LEFT0', 24, false);

		animation.addByPrefix('singUPmiss', 'Kapi Sing Note UP MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Kapi Sing Note RIGHT MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Kapi Sing Note DOWN MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Kapi Sing Note LEFT MISS0', 1, false);


		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');
		addOffset("singUP", 1, 0);
		addOffset("singRIGHT", 0, 0);
		addOffset("singLEFT", 0, 0);
		addOffset("singDOWN", 0, 0);

		addOffset("singUPmiss", 1, 0);
		addOffset("singRIGHTmiss", 0, 0);
		addOffset("singLEFTmiss", 0, 0);
		addOffset("singDOWNmiss", 0, 0);
		
		
		flipX = true;

	}
	

}
