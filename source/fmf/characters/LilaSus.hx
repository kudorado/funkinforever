package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class LilaSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/lila/lila', 'mods');
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
		addOffset('idle', -5, 28);
		
		addOffset("singUP", -29, 28);
		addOffset("singRIGHT", -40, 30);
		addOffset("singLEFT", -83, 32);
		addOffset("singDOWN", -25, 36);

		addOffset("singUPmiss", -54, 28);
		addOffset("singRIGHTmiss", -35, 10);
		addOffset("singLEFTmiss", -113, 8);
		addOffset("singDOWNmiss", -103, -23);


		flipX = true;
	}
	

}
