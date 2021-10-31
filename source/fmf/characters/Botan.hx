package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Botan extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/botan/botan', "mods");
		frames = tex;
	
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', "Pico Idle Dance0", 24, false);
		animation.addByPrefix('singUP', "pico Up note0", 24, false);
		animation.addByPrefix('singDOWN', "Pico Down Note0", 24, false);
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);

		animation.addByPrefix('singUPmiss', "pico Up note miss0", 24, false);
		animation.addByPrefix('singDOWNmiss', "Pico Down Note MISS0", 24, false);
		animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss0', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss0', 24, false);
		
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{

		addOffset('idle');
		addOffset("singUP", 2, 20);
		addOffset("singRIGHT", -47, -10);
		addOffset("singLEFT", 73, -12);
		addOffset("singDOWN", 102, -116);

		addOffset("singUPmiss", 2, 20);
		addOffset("singRIGHTmiss", -47, -10);
		addOffset("singLEFTmiss", 73, -12);
		addOffset("singDOWNmiss", 102, -116);

		playAnim('idle');
		flipX = false;

	}
	

}
