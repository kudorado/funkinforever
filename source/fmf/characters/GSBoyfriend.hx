package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GSBoyfriend extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/gsbf/bfCar', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, -2);
		addOffset("singUP", -51, 26);
		addOffset("singRIGHT", 5, -10);
		addOffset("singLEFT", -50, -4);
		addOffset("singDOWN", -11, -52);

		addOffset("singUPmiss", -41, 26);
		addOffset("singRIGHTmiss", -45, 19);
		addOffset("singLEFTmiss", -1, 25);
		addOffset("singDOWNmiss", -12, -22);

		playAnim('idle');


		dance();

	}

}
