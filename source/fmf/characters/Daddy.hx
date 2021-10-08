package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Daddy extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/dad/dad', "mods");

		var tex2 = Paths.getSparrowAtlas('pc/dad/dad_miss', 'mods');

		for (frame in tex2.frames)
		{
			tex.pushFrame(frame);
		}

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


		animation.addByPrefix('singUPmiss', 'Dad Miss note UP', 1, false);
		animation.addByPrefix('singLEFTmiss',  'Dad Miss Note LEFT', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Miss Note RIGHT', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Dad Miss Note DOWN', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, 28);
		addOffset("singUP", -15, 78);
		addOffset("singRIGHT", -18, 37);
		addOffset("singLEFT", -14, 54);
		addOffset("singDOWN", -5, -4);

		addOffset("singUPmiss", -21, 79);
		addOffset("singRIGHTmiss", -16, 54);
		addOffset("singLEFTmiss", -16, 38);
		addOffset("singDOWNmiss", -2, -3);

		addOffset("hey", -9, 26);
		addOffset('scared', -8, 27);

		playAnim('idle');
		flipX = false;

		// i dunno why i should do this, LOl
		dance();
		flipX = !flipX;

		// Doesn't flip for BF, since his are already in the right place???		{
		var oldRight = animation.getByName('singRIGHT').frames;
		animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
		animation.getByName('singLEFT').frames = oldRight;

		// IF THEY HAVE MISS ANIMATIONS??
		if (animation.getByName('singRIGHTmiss') != null)
		{
			var oldMiss = animation.getByName('singRIGHTmiss').frames;
			animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
			animation.getByName('singLEFTmiss').frames = oldMiss;
		}

	}
	

}
