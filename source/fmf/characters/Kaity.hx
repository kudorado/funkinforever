package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Kaity extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/kaity/kaity', 'mods');
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
		addOffset("singUP", -11, -5);
		addOffset("singRIGHT", 27, -3);
		addOffset("singLEFT", -40, -2);
		addOffset("singDOWN", 38, -3);

		addOffset("singUPmiss", -21, -4);
		addOffset("singRIGHTmiss", -34, 4);
		addOffset("singLEFTmiss", 34, 2);
		addOffset("singDOWNmiss", 44, 1);

		playAnim('idle');

		dance();

	}

}
