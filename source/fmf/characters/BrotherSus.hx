package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BrotherSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/brother/brother', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/brother/brother_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Dad idle dance', 24, false);

		animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24, false);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT0', 24, false);

		animation.addByPrefix('singUPmiss', 'Dad Sing Note UP MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Dad Sing Note DOWN MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Dad Sing Note LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Sing Note RIGHT MISS0', 1, false);


		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);

		addOffset("singUP", -40, 47);
		addOffset("singRIGHT", -71, 20);
		addOffset("singLEFT", -19, 5);
		addOffset("singDOWN", 18, -30);

		addOffset("singUPmiss", -148, -50);
		addOffset("singRIGHTmiss", -130, -72);
		addOffset("singLEFTmiss", -128, -73);
		addOffset("singDOWNmiss", -79, -125);
	
		flipX = true;
	}
	

}
