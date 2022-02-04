package fmf.characters;
import state.*;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class BFPibby extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf_pibby/BF_Pibby', 'mods');
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
		animation.addByPrefix('scared', 'BF idle shaking', 24, false);
		animation.addByPrefix('hurt', 'BF hit0', 24, false);
		animation.addByPrefix('hit', 'BF hit0', 24, false);
		animation.addByPrefix('dodge', 'Boyfriend dodge0', 24, false);

	}

	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -14, -0);
		addOffset("singUP", 20, 0);
		addOffset("singRIGHT", -3, -0);
		addOffset("singLEFT", -15, -0);
		addOffset("singDOWN", 37, -0);

		addOffset("singUPmiss", 11, 0);
		addOffset("singRIGHTmiss", 10, 0);
		addOffset("singLEFTmiss", 26, -0);
		addOffset("singDOWNmiss", 33, -0);
		addOffset("hey", 13, 0);
		addOffset('scared', -0, 0);

		addOffset('hit', -10, 0);
		addOffset('hurt', -9, 0);
		addOffset('scared', -14, 0);
		addOffset('dodge', -4, 0);

		playAnim('idle');
		flipX = false;
	}

}
