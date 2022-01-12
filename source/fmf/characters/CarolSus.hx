package fmf.characters;
import state.*;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class CarolSus extends Boyfriend
{
	
	override function getTex()
	{
		var tex = Paths.getSparrowAtlas('pc/carol/carol', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);

		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);

		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS0', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS0', 24, false);

		dance();
	}
	
	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -2, 2);

		addOffset("singUP", -16, 10);
		addOffset("singRIGHT", -59, 3);
		addOffset("singLEFT", 30, -13);
		addOffset("singDOWN", 2, -5);
		
		addOffset("singUPmiss", -27, 14);
		addOffset("singRIGHTmiss", -57, 2);
		addOffset("singLEFTmiss", 22, -13);
		addOffset("singDOWNmiss", 5, -11);

		flipX = false;
	}
	

}
