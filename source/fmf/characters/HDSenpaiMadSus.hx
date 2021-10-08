package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class HDSenpaiMadSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/hdsenpaimad/HD_SENPAIMAD', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Dad idle dance", 24, false);
		animation.addByPrefix('singUP', "Dad Sing Note UP0", 24, false);
		animation.addByPrefix('singDOWN', "Dad Sing Note DOWN0", 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);

		animation.addByPrefix('singUPmiss', "Dad Sing Note UP MISS0", 1, false);
		animation.addByPrefix('singDOWNmiss', "Dad Sing Note DOWN MISS0", 1, false);
		animation.addByPrefix('singLEFTmiss', 'Dad Sing Note LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Sing Note RIGHT MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", -5, -10);
		addOffset("singRIGHT", 50, -20);
		addOffset("singLEFT", 8, 0);
		addOffset("singDOWN", 10, -7);

		addOffset("singUPmiss", -5, -10);
		addOffset("singRIGHTmiss", 50, -20);
		addOffset("singLEFTmiss", 8, 0);
		addOffset("singDOWNmiss", 10, -7);


		flipX = true;
	}
	

}
