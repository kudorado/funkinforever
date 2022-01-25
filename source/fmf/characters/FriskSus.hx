package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class FriskSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/frisk/frisk', 'mods');
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
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);
		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -2, 2);

		addOffset("singUP", -40, 23);
		addOffset("singRIGHT", 31, -6);
		addOffset("singLEFT", -42, -12);
		addOffset("singDOWN", -24, -33);
		
		addOffset("singUPmiss", -35, 32);
		addOffset("singRIGHTmiss", -44, 12);
		addOffset("singLEFTmiss", 36, 12);
		addOffset("singDOWNmiss", -27, -13);

		addOffset('hey', 2, 0);
		addOffset('scared', -2, -3);

		flipX = false;
	}
	

}
