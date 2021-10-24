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
		addOffset("singUP", -15, 79);
		addOffset("singRIGHT", 34, 55);
		addOffset("singLEFT", -57, 38);
		addOffset("singDOWN", 30, -3);

		addOffset("singUPmiss", -16, 79);
		addOffset("singRIGHTmiss", -49, 39);
		addOffset("singLEFTmiss", 34, 55);
		addOffset("singDOWNmiss", 27, -2);


		playAnim('idle');
		flipX = true;


	}
	

}
