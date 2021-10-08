package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Blantad extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/blantad/blantad', "mods");
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

		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 1, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS0', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS0', 1, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 1, false);
		
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', 0, 0);
		addOffset("singUP", 39, 0);
		addOffset("singRIGHT", 64, 0);
		addOffset("singLEFT", 56, 0);
		addOffset("singDOWN", 63, 0);

		addOffset("singUPmiss", 39, 0);
		addOffset("singRIGHTmiss", 64, 0);
		addOffset("singLEFTmiss", 56, 0);
		addOffset("singDOWNmiss", 63, 0);
		
		playAnim('idle');
		flipX = false;

	}
	

}
