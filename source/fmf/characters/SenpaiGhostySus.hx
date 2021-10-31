package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class SenpaiGhostySus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/senpaighosty/senpaighosty_assets', 'mods');
		var tex2 = Paths.getSparrowAtlas('pc/senpaighosty/senpaighosty_assets_miss', 'mods');
	
		for(frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'garcello idle dance', 18, false);
	
		animation.addByPrefix('singUP', 'garcello Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'Garcello Sing Note UP MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Garcello Sing Note RIGHT MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Garcello Sing Note LEFT MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Garcello Sing Note DOWN MISS0', 1, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle');

		addOffset("singUP", 17, 0);
		addOffset("singRIGHT", -25, 0);
		addOffset("singLEFT", 2, 0);
		addOffset("singDOWN", -5, 0);

		addOffset("singUPmiss", -56, 0);
		addOffset("singRIGHTmiss", -87, 29);
		addOffset("singLEFTmiss", -91, -21);
		addOffset("singDOWNmiss", -107, -47);


		flipX = true;
	}
	

}
